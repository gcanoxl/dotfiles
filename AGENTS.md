# Agent instructions 

## workflow

All changes follow this sequence:

1. Present a plan preview.
2. Capture any new coding conventions found in the request.
3. Receive a bare execution authorization.
4. Implement only the approved plan while following [Unrelated existing changes](#unrelated-existing-changes).

### Plan preview

A request that specifies what, where, or how to change is a planning request and does not authorize making changes.

Before requesting authorization, preview the intended result:

- **Files**: show the resulting affected directory tree and mark files to add, modify, move, or delete.
- **Architecture**: show the resulting architecture, responsibility boundaries, and reasons for the chosen structure.
- **Symbols and call flow**: preview the resulting classes, methods, functions, relevant signatures, responsibilities, and calling relationships.
- **Verification and scope**: list planned checks, preserved behavior, exact file scope, and overlapping uncommitted changes.

Show the complete resulting content of affected sections.

Keep the detail proportional to the change, but sufficient to understand the intended implementation before approval.

### Capture conventions

Every turn, check whether the user stated or implied a reusable coding convention, including naming, structure, theme, state access, or practices to avoid.

When a new convention is found:

1. Identify it explicitly.
2. Ask whether it should be added to `AGENTS.md`.
3. If the user does not explicitly answer that it should be added, default to not adding it and continue without requiring an answer.
4. Include its exact resulting rule or section in the plan preview only after the user explicitly requests its addition.
5. Write it only after receiving bare authorization.

Do not silently add, restore, or duplicate conventions.

### Execution gate

Make changes only after the user sends a bare go-ahead with no scope, condition, or approach attached, such as `ok`, `go`, `do`, `write`, `revert`, `implement`, or `yes`.

This gate applies to all changes, including those in temporary directories and outside the repository, whether performed directly or through tools or commands.

Authorization applies only to the latest unexecuted plan preview in the current conversation.

- Do not treat a planning request as authorization.
- Do not expand beyond the approved plan.
- If the scope changes, present a revised plan preview and request authorization again.
- If the applicable plan or authorization is ambiguous, do not make any changes.
- Never apply unsolicited changes, fixes, reverts, refactors, or `AGENTS.md` updates.
- Before every write, require a concrete plan preview followed by standalone bare authorization for that exact scope.
- Never infer authorization from urgency, frustration, questions, corrections, or repeated requests.
- Reverts and repairs of unauthorized changes require the same gate.

### Task continuity

- Treat discussion or revision of a plan as an update to the ongoing plan, not a replacement of the entire task; carry forward all requirements not explicitly canceled and reconcile any affected parts.
- Track authorization separately from task scope: completing an authorized change does not cancel or complete the remaining work.

### Large-plan task lists

Use this workflow only when the user explicitly identifies the task or plan
as large. Do not infer that a task is large from its scope, complexity,
wording, or number of independently implementable steps.

When the user explicitly identifies a task or plan as large:

1. Create a temporary, scope-specific `*_TODO.md` file before implementing the
   plan.
2. Break the plan into ordered checkbox items that can each be implemented and
   verified independently.
3. Work on exactly one checklist item at a time.
4. Apply the normal plan-preview and bare-authorization gate separately to
   every checklist item.
5. After implementing and verifying an item, mark only that item complete.
6. Make deletion of the temporary task-list file the final checklist item.
7. Delete the task-list file only after every preceding item is complete and
   final verification has passed.
8. Do not combine several checklist items into one implementation step unless
   the user explicitly revises the plan and authorizes the combined scope.

### Unrelated existing changes

- Preserve unrelated existing changes exactly as they are.
- Do not modify, restore, reformat, stage, or otherwise touch them.
- Immediately before applying an approved change, re-read every target file and inspect its current Git status and diff to detect concurrent or unrelated changes.
- When an approved change shares a file with unrelated edits, limit the patch to the approved section and preserve all other content exactly.

## Repository language

- Use English for all repository content, including code identifiers, comments, documentation, configuration, and default UI text. Non-English content is permitted only where necessary for internationalization (i18n).

## Mock implementation fidelity

- When the user requests a mock implementation, preserve the approved frontend experience. Replace unavailable backend operations with local data and simulated results while retaining normal interactions and state transitions.
- Do not remove or weaken frontend behavior merely because the backend is unavailable. Preserve applicable loading, completion, error, validation, and disabled states within the approved scope.
- Follow the approved design and UI copy. A mock implementation does not authorize extra labels, disclaimers, messages, or changes to product wording.
- Do not add mock, demo, placeholder, simulated, or equivalent markers to UI text, localization resources, code identifiers, or comments unless the user explicitly requests those markers.
- Report implementation limitations in the task response rather than adding unrequested explanations to the product interface.

## Tests and code

When writing tests, do not modify code. When writing code, do not modify tests. Write the two separately, with functionality as the goal, not making tests pass. If you encounter tests that cannot pass, ignore them, finish the work, and report them afterward.

## Usage reset credits

- Never use or redeem usage reset credits.
