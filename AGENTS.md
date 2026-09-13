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

- Always present every proposed AGENTS.md change as a diff before requesting authorization, regardless of the file's location.

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

Authorization is valid only when both conditions are met:

1. The immediately preceding assistant message is an explicit, complete plan preview.
2. The user's entire authorization message is exactly `ok` or `go`, in lowercase, with no whitespace, punctuation, or additional content.

No other message counts as authorization. Do not translate, normalize, or infer equivalent expressions.

Each authorization applies only to the exact plan preview immediately preceding it. Any change to that plan invalidates the authorization, including changes to scope, approach, steps, or affected files. Authorization never transfers to a revised plan.

This gate applies to all changes, including temporary files, files outside the repository, tests, AGENTS.md updates, deletions, reverts, and repairs of unauthorized changes.

- Before every write, verify that the current plan is unchanged from the authorized preview and that the write is covered by it.
- Do not expand beyond the approved plan.
- If any part of the plan changes, stop execution, present a new complete plan preview, and obtain fresh bare authorization before making further changes.
- If either condition is unmet or ambiguous, do not make changes.
- Never infer authorization from urgency, frustration, questions, corrections, or repeated requests.
- Discovering an unauthorized change does not authorize reverting or repairing it.

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

## Architecture and responsibility boundaries

- Correct architecture and clear responsibility boundaries are mandatory. Never compromise them to minimize changed files, line count, or diff size.
- Establish component responsibilities, state ownership, and data flow before choosing an implementation. Place behavior in the component that owns it, even when this requires changes across multiple files.
- Minimize implementation only within those boundaries. Minimal-fix preferences, including Ponytail mode, must not justify misplaced responsibilities or structural shortcuts.
- During verification, check responsibility boundaries and state ownership as well as functional behavior.

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

## Communication

- Before sending a response, complete any further verification or investigation that the response would otherwise identify as still needed. Report the findings instead of deferring that work to a later reply.
- When the user adds, changes, or corrects task instructions, take exactly one of two actions: execute a validly authorized plan, or formulate or revise a concrete plan and present its complete preview.
- Never substitute acknowledgments, repetition, paraphrases, or explanations without task progress for either action.
- Never repeat or paraphrase the user's request as an acknowledgment. Respond directly with the answer, concrete findings, or necessary next action.
- Before sending each response, remove any opening that merely repeats or paraphrases the user's request.
- When an error is identified, propose a concrete, durable prevention measure and explain how to verify it. An apology, cause explanation, or promise alone is insufficient. Follow the execution gate before making persistent changes.

### Pre-send check

Before sending each response, check all four items:

1. Does the response directly address the user's current question or instruction without switching to another task?
2. Does it comply with all applicable instructions, including authorization, non-repetition, and completing required investigation before reporting?
3. If an error was identified, does it provide a concrete, durable prevention measure and a way to verify it, rather than continuing to explain the cause?
4. Is every completion claim supported by observed results, with failures and unverified scope stated accurately?

If any item fails, revise the response or complete the required authorized work before sending it.
