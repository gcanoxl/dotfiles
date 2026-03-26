#!/usr/bin/env bash

set -euo pipefail

PROGRAM_NAME="$(basename "$0")"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DRY_RUN=false
CONFLICT_MODE="prompt"

BACKUP_ROOT="$HOME/.dotfiles_backup"
BACKUP_STAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_DIR="$BACKUP_ROOT/$BACKUP_STAMP"
BACKUP_DIR_READY=false

linked_count=0
already_linked_count=0
skipped_count=0
backed_up_count=0
forced_count=0
failed_count=0
zshrc_added_count=0
zshrc_unchanged_count=0

COLOR_ENABLED=false
if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  COLOR_ENABLED=true
fi

if $COLOR_ENABLED; then
  CLR_RESET="$(printf '\033[0m')"
  CLR_BOLD="$(printf '\033[1m')"
  CLR_BLUE="$(printf '\033[34m')"
  CLR_CYAN="$(printf '\033[36m')"
  CLR_GREEN="$(printf '\033[32m')"
  CLR_YELLOW="$(printf '\033[33m')"
  CLR_RED="$(printf '\033[31m')"
else
  CLR_RESET=""
  CLR_BOLD=""
  CLR_BLUE=""
  CLR_CYAN=""
  CLR_GREEN=""
  CLR_YELLOW=""
  CLR_RED=""
fi

usage() {
  cat <<EOF
Usage: $PROGRAM_NAME [options]

One-click installer for this dotfiles repository.

Options:
  --conflict MODE      Conflict strategy: prompt|backup|skip|force
  --yes                Non-interactive mode (same as --conflict backup)
  --dry-run            Print planned actions without changing files
  -h, --help           Show this help message
EOF
}

section() {
  printf "\n%s%s==> %s%s\n" "$CLR_BOLD" "$CLR_CYAN" "$*" "$CLR_RESET"
}

info() {
  printf "%s[INFO]%s %s\n" "$CLR_BLUE" "$CLR_RESET" "$*"
}

ok() {
  printf "%s[ OK ]%s %s\n" "$CLR_GREEN" "$CLR_RESET" "$*"
}

warn() {
  printf "%s[WARN]%s %s\n" "$CLR_YELLOW" "$CLR_RESET" "$*"
}

error() {
  printf "%s[ERR ]%s %s\n" "$CLR_RED" "$CLR_RESET" "$*" >&2
}

die() {
  error "$*"
  exit 2
}

quote_cmd() {
  local quoted=""
  local arg=""
  for arg in "$@"; do
    quoted="${quoted} $(printf '%q' "$arg")"
  done
  printf '%s' "${quoted# }"
}

run_cmd() {
  if $DRY_RUN; then
    info "DRY-RUN: $(quote_cmd "$@")"
    return 0
  fi
  "$@"
}

canonical_path() {
  local path="$1"
  local dir=""
  local base=""
  dir="$(dirname "$path")"
  base="$(basename "$path")"
  (
    cd "$dir" >/dev/null 2>&1 || exit 1
    printf '%s/%s\n' "$(pwd -P)" "$base"
  )
}

resolve_link_target() {
  local link_path="$1"
  local raw_target=""
  local resolved=""

  raw_target="$(readlink "$link_path")" || return 1
  if [[ "$raw_target" == /* ]]; then
    resolved="$raw_target"
  else
    resolved="$(
      cd "$(dirname "$link_path")" >/dev/null 2>&1 || exit 1
      cd "$(dirname "$raw_target")" >/dev/null 2>&1 || exit 1
      printf '%s/%s\n' "$(pwd -P)" "$(basename "$raw_target")"
    )"
  fi

  canonical_path "$resolved"
}

ensure_backup_dir() {
  if [[ "$BACKUP_DIR_READY" == "true" ]]; then
    return 0
  fi
  if ! run_cmd mkdir -p "$BACKUP_DIR"; then
    return 1
  fi
  BACKUP_DIR_READY=true
  info "Backup directory: $BACKUP_DIR"
}

backup_target() {
  local target="$1"
  local backup_path=""
  local backup_parent=""

  backup_path="$BACKUP_DIR$target"
  backup_parent="$(dirname "$backup_path")"

  if ! ensure_backup_dir; then
    return 1
  fi
  if ! run_cmd mkdir -p "$backup_parent"; then
    return 1
  fi
  if ! run_cmd mv "$target" "$backup_path"; then
    return 1
  fi

  ok "Backed up: $target -> $backup_path"
  backed_up_count=$((backed_up_count + 1))
}

remove_target() {
  local target="$1"

  if [[ -z "$target" || "$target" == "/" ]]; then
    error "Refusing to remove unsafe path: $target"
    return 1
  fi

  if $DRY_RUN; then
    info "DRY-RUN: remove $target"
    return 0
  fi

  if [[ -d "$target" && ! -L "$target" ]]; then
    rm -rf "$target"
  else
    rm -f "$target"
  fi

  ok "Removed existing target: $target"
}

prompt_conflict_action() {
  local target="$1"
  local reply=""

  while true; do
    printf "%s[CONFLICT]%s %s exists and is not the expected symlink.\n" "$CLR_YELLOW" "$CLR_RESET" "$target" >&2
    printf "Action [b]ackup / [s]kip / [f]orce / [q]uit (default: b): " >&2

    if ! IFS= read -r reply; then
      printf 'quit\n'
      return 0
    fi

    reply="$(printf '%s' "$reply" | tr '[:upper:]' '[:lower:]')"
    case "$reply" in
      ""|b|backup)
        printf 'backup\n'
        return 0
        ;;
      s|skip)
        printf 'skip\n'
        return 0
        ;;
      f|force)
        printf 'force\n'
        return 0
        ;;
      q|quit)
        printf 'quit\n'
        return 0
        ;;
      *)
        warn "Invalid choice: $reply" >&2
        ;;
    esac
  done
}

ensure_zshrc_source() {
  local zshrc_file="$HOME/.zshrc"
  local source_line=""
  local zshrc_exists=false

  if [[ "$REPO_ROOT" == "$HOME/.dotfiles" ]]; then
    source_line='source "$HOME/.dotfiles/zshrc"'
  else
    source_line="source \"$REPO_ROOT/zshrc\""
  fi

  section "Ensuring ~/.zshrc sources repo zshrc"

  if [[ -d "$zshrc_file" ]]; then
    error "$zshrc_file is a directory. Cannot update zshrc."
    failed_count=$((failed_count + 1))
    return 1
  fi

  if [[ -e "$zshrc_file" ]]; then
    zshrc_exists=true
  fi

  if [[ ! -e "$zshrc_file" ]]; then
    if ! run_cmd touch "$zshrc_file"; then
      error "Failed to create $zshrc_file"
      failed_count=$((failed_count + 1))
      return 1
    fi
    info "Created $zshrc_file"
  fi

  if $zshrc_exists && grep -Fqx "$source_line" "$zshrc_file"; then
    ok "Source line already present: $source_line"
    zshrc_unchanged_count=$((zshrc_unchanged_count + 1))
    return 0
  fi

  if $DRY_RUN; then
    info "DRY-RUN: append to $zshrc_file -> $source_line"
  else
    printf '\n%s\n' "$source_line" >> "$zshrc_file"
  fi

  ok "Added source line to $zshrc_file"
  zshrc_added_count=$((zshrc_added_count + 1))
}

link_item() {
  local source="$1"
  local target="$2"
  local source_abs=""
  local parent_dir=""
  local conflict_action=""
  local existing_target_abs=""

  if [[ ! -e "$source" ]]; then
    error "Source does not exist: $source"
    failed_count=$((failed_count + 1))
    return 1
  fi

  source_abs="$(canonical_path "$source")"
  parent_dir="$(dirname "$target")"

  if [[ ! -d "$parent_dir" ]]; then
    if ! run_cmd mkdir -p "$parent_dir"; then
      error "Failed to create parent directory: $parent_dir"
      failed_count=$((failed_count + 1))
      return 1
    fi
  fi

  if [[ -L "$target" ]]; then
    if existing_target_abs="$(resolve_link_target "$target" 2>/dev/null)"; then
      if [[ "$existing_target_abs" == "$source_abs" ]]; then
        ok "Already linked: $target -> $source_abs"
        already_linked_count=$((already_linked_count + 1))
        return 0
      fi
    fi
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    conflict_action="$CONFLICT_MODE"
    if [[ "$conflict_action" == "prompt" ]]; then
      conflict_action="$(prompt_conflict_action "$target")"
    fi

    case "$conflict_action" in
      backup)
        if ! backup_target "$target"; then
          error "Failed to backup $target"
          failed_count=$((failed_count + 1))
          return 1
        fi
        ;;
      skip)
        warn "Skipped existing target: $target"
        skipped_count=$((skipped_count + 1))
        return 0
        ;;
      force)
        if ! remove_target "$target"; then
          error "Failed to remove $target"
          failed_count=$((failed_count + 1))
          return 1
        fi
        forced_count=$((forced_count + 1))
        ;;
      quit)
        die "Aborted by user."
        ;;
      *)
        error "Unknown conflict action: $conflict_action"
        failed_count=$((failed_count + 1))
        return 1
        ;;
    esac
  fi

  if ! run_cmd ln -s "$source_abs" "$target"; then
    error "Failed to create symlink: $target"
    failed_count=$((failed_count + 1))
    return 1
  fi

  ok "Linked: $target -> $source_abs"
  linked_count=$((linked_count + 1))
}

check_requirements() {
  local commands=()
  local cmd=""
  commands=(ln mkdir mv rm grep readlink dirname basename pwd tr date)
  for cmd in "${commands[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      die "Required command not found: $cmd"
    fi
  done
}

validate_conflict_mode() {
  case "$CONFLICT_MODE" in
    prompt|backup|skip|force)
      ;;
    *)
      die "Invalid --conflict mode: $CONFLICT_MODE"
      ;;
  esac
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --conflict)
        [[ $# -lt 2 ]] && die "Missing value for --conflict"
        CONFLICT_MODE="$2"
        shift 2
        ;;
      --conflict=*)
        CONFLICT_MODE="${1#*=}"
        shift
        ;;
      --yes)
        CONFLICT_MODE="backup"
        shift
        ;;
      --dry-run)
        DRY_RUN=true
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "Unknown argument: $1"
        ;;
    esac
  done

  validate_conflict_mode

  if [[ "$CONFLICT_MODE" == "prompt" ]] && [[ ! -t 0 ]]; then
    die "Prompt mode requires an interactive terminal. Use --yes or --conflict backup."
  fi
}

print_summary() {
  section "Summary"
  printf "zshrc lines added:      %d\n" "$zshrc_added_count"
  printf "zshrc unchanged:        %d\n" "$zshrc_unchanged_count"
  printf "new links created:      %d\n" "$linked_count"
  printf "already linked:         %d\n" "$already_linked_count"
  printf "backups created:        %d\n" "$backed_up_count"
  printf "forced replacements:    %d\n" "$forced_count"
  printf "skipped conflicts:      %d\n" "$skipped_count"
  printf "failed operations:      %d\n" "$failed_count"
}

main() {
  local sources=()
  local targets=()
  local i=0
  local source_path=""
  local target_path=""

  parse_args "$@"
  check_requirements

  section "Dotfiles bootstrap"
  info "Repository root: $REPO_ROOT"
  info "Conflict mode: $CONFLICT_MODE"
  if $DRY_RUN; then
    info "Dry-run mode: enabled"
  fi

  ensure_zshrc_source || true

  section "Creating symlinks"
  sources=("nvim" "kitty" "hammerspoon" "wezterm" "doom" "codex/rules/default.rules")
  targets=(
    "$HOME/.config/nvim"
    "$HOME/.config/kitty"
    "$HOME/.hammerspoon"
    "$HOME/.config/wezterm"
    "$HOME/.doom.d"
    "$HOME/.codex/rules/default.rules"
  )

  for ((i = 0; i < ${#sources[@]}; i++)); do
    source_path="$REPO_ROOT/${sources[$i]}"
    target_path="${targets[$i]}"
    info "Processing: ${sources[$i]} -> $target_path"
    link_item "$source_path" "$target_path" || true
  done

  print_summary

  if [[ "$failed_count" -gt 0 ]]; then
    error "Completed with failures."
    exit 1
  fi

  ok "Bootstrap completed successfully."
  if $DRY_RUN; then
    info "Dry-run completed. No filesystem changes were made."
  else
    info "Open a new shell or run: source ~/.zshrc"
  fi
}

main "$@"
