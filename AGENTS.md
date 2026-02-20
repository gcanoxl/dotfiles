# Commit Message Scope Rules

在这个仓库里，commit message 使用 Conventional Commits 形式：

`type(scope): subject`

仓库级改动也允许：

`type: subject`

## Scope 规则

- 如果是子项目改动，`scope` 必须是 dotfiles 的子项目名，而不是子项目内部模块名。
- 推荐使用这些 scope：
  - `doom`
  - `hammerspoon`
  - `kitty`
  - `nvim`
  - `wezterm`
  - `surfingkeys`
  - `zshrc`
- 如果是针对整个 dotfiles 仓库的改动（不只某个子项目），可以使用常规 scope，不受子项目名限制。
- 仓库级改动可以写成 `docs(gitignore): ...` 这类常规形式，也可以不写 scope（`docs: ...`）。

## 示例

- ✅ `fix(nvim): avoid mutating shared root_markers config`
- ✅ `feat(hammerspoon): add app switch shortcut`
- ✅ `docs(gitignore): clarify ignore rules`
- ✅ `docs: update repo conventions`
- ❌ `fix(mason): ...`（`mason` 是 `nvim` 子项目内部组件，不是 dotfiles 子项目）

## 强制说明

- 在这个仓库中，子项目改动应写 `fix(nvim)`，而不是 `fix(mason)`。
- 仓库级改动可用常规 scope（例如 `docs(gitignore)`），也可以省略 scope。
