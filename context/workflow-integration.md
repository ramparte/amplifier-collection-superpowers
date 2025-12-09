# Workflow Integration: Superpowers in Amplifier

This document describes the complete development workflow using superpowers agents in Amplifier.

## Complete Workflow

```
User Request
    ↓
1. Design Refinement (design-refiner)
    ↓
2. Plan Creation (plan-writer)
    ↓
3. Implementation (plan-executor OR subagent-orchestrator)
    ├→ TDD Enforcement (tdd-enforcer) - continuously
    └→ Code Review (code-reviewer) - between tasks
    ↓
4. Branch Finalization (branch-finalizer)
    ↓
Done
```

---

## Phase 1: Design Refinement

**Agent:** `superpowers:design-refiner`  
**Wraps:** `brainstorming` skill  
**Purpose:** Transform rough ideas into validated designs

### Process

1. **Understand Context**
   - Use read_file to examine current project
   - Check recent commits
   - Understand existing architecture

2. **Ask Questions**
   - One question at a time
   - Multiple choice when possible
   - Focus on: purpose, constraints, success criteria

3. **Explore Approaches**
   - Propose 2-3 different approaches
   - Present trade-offs
   - Recommend preferred option with reasoning

4. **Present Design**
   - Break into 200-300 word sections
   - Check after each section
   - Cover: architecture, components, data flow, error handling, testing

5. **Save Design**
   - Write to `docs/plans/YYYY-MM-DD-<topic>-design.md`
   - Use write_file tool

6. **Next Steps**
   - Delegate to `superpowers:plan-writer` for implementation plan
   - Or delegate to `foundation:zen-architect` for architectural review

### Example Invocation

```
User: "I need to add caching to improve API performance"

design-refiner:
- Examines current API code
- Asks about cache requirements (TTL, invalidation, storage)
- Proposes approaches (in-memory, Redis, hybrid)
- Presents design in sections
- Saves validated design
- Delegates to plan-writer
```

---

## Phase 2: Plan Creation

**Agent:** `superpowers:plan-writer`  
**Wraps:** `writing-plans` skill  
**Purpose:** Create detailed implementation plans with bite-sized tasks

### Process

1. **Read Design**
   - Load design document
   - Understand architecture and approach

2. **Break Into Tasks**
   - Each task is 2-5 minutes
   - Tasks are explicit and detailed
   - Include file paths, code examples, verification steps
   - Assume engineer has zero codebase context

3. **Enforce Disciplines**
   - TDD: Write test → Run (fail) → Implement → Run (pass)
   - DRY: Don't repeat yourself
   - YAGNI: You aren't gonna need it
   - Frequent commits after each working state

4. **Create Plan Header**
   ```markdown
   # Feature Implementation Plan
   
   > **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans
   
   **Goal:** [What this builds]
   **Architecture:** [Approach]
   **Tech Stack:** [Technologies]
   ```

5. **Write Tasks**
   - File paths explicit
   - Code examples complete
   - Verification clear
   - Commits after each milestone

6. **Save Plan**
   - Write to `docs/plans/YYYY-MM-DD-<feature>.md`

### Example Task Structure

```markdown
### Task 3.2: Write test for cache hit

**File:** `tests/test_cache.py`

**Action:** Add test case for cache hit

**Code:**
```python
def test_cache_hit():
    cache = Cache()
    cache.set("key", "value")
    assert cache.get("key") == "value"
```

**Verify:** Run test, watch it fail (cache not implemented yet)

**Commit:** "Add test for cache hit (RED)"
```

---

## Phase 3A: Plan Execution (Batch Mode)

**Agent:** `superpowers:plan-executor`  
**Wraps:** `executing-plans` skill  
**Purpose:** Execute plans in batches with review checkpoints

### Process

1. **Load Plan**
   - Read plan file
   - Create todo list with all tasks

2. **Execute Batch**
   - Default: First 3 tasks
   - Mark each task in_progress
   - Follow steps exactly
   - Run verifications
   - Mark tasks completed

3. **Report**
   - Show what was implemented
   - Show verification output
   - Say: "Ready for feedback"

4. **Continue**
   - Wait for user approval
   - Execute next batch
   - Repeat until complete

5. **Complete Development**
   - Delegate to `superpowers:branch-finalizer`

### Example Flow

```
plan-executor loads plan with 12 tasks

Batch 1 (tasks 1-3):
  Task 1: Write test (RED) ✓
  Task 2: Implement (GREEN) ✓
  Task 3: Refactor ✓
  Report: "Batch 1 complete, all tests green"

User: "Continue"

Batch 2 (tasks 4-6):
  Task 4: Write test (RED) ✓
  Task 5: Implement (GREEN) ✓
  Task 6: Commit ✓
  Report: "Batch 2 complete"

...continues...
```

---

## Phase 3B: Subagent-Driven Development

**Agent:** `superpowers:subagent-orchestrator`  
**Wraps:** `subagent-driven-development` skill  
**Purpose:** Execute with fresh subagent per task, review between tasks

### Process

1. **Load Plan**
   - Read plan file
   - Create todo list

2. **For Each Task**
   
   **A. Dispatch Fresh Subagent:**
   ```yaml
   task tool:
     agent: general-purpose
     instruction: |
       Implement Task N from [plan-file].
       
       1. Read task carefully
       2. Implement exactly what task specifies
       3. Write tests (TDD if required)
       4. Verify implementation works
       5. Commit your work
       6. Report back
       
       Report: What you implemented, tests, results, files changed
   ```

   **B. Subagent Reports Back**
   - Summary of work
   - Test results
   - Files changed

   **C. Review Subagent's Work**
   - Use read_file to check code
   - Use bash to verify tests pass
   - Check if task completed correctly

   **D. Continue or Fix**
   - If good: Move to next task
   - If issues: Spawn another subagent to fix

3. **Complete**
   - All tasks done
   - Delegate to `superpowers:branch-finalizer`

### Why Fresh Subagent Per Task?

- **No context pollution:** Each subagent starts fresh
- **Parallel possibility:** Could run independent tasks in parallel
- **Quality gates:** Review between every task
- **Clear boundaries:** Each task isolated

---

## Phase 3 (Continuous): TDD Enforcement

**Agent:** `superpowers:tdd-enforcer`  
**Wraps:** `test-driven-development` skill  
**Purpose:** Enforce RED-GREEN-REFACTOR cycle

### The Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

### Process

1. **RED:** Write failing test
   - Use write_file to create test
   - Use bash to run test
   - **Must see it fail**

2. **GREEN:** Minimal code to pass
   - Use write_file to implement
   - Use bash to run test
   - **Must see it pass**

3. **REFACTOR:** Clean up
   - Improve code quality
   - Run tests (must stay green)
   - Commit

### Enforcement Rules

**If code exists without test:**
- DELETE the code
- Start over with test first
- No exceptions

**If test wasn't run (fail):**
- You don't know if it tests the right thing
- Run it now, expect it to fail

**If test wasn't run (pass):**
- You don't know if implementation works
- Run it now, expect it to pass

---

## Phase 3 (Between Tasks): Code Review

**Agent:** `superpowers:code-reviewer`  
**Wraps:** `requesting-code-review` skill  
**Purpose:** Review code for correctness, clarity, philosophy compliance

### Process

1. **Examine Changes**
   - Use bash: `git diff`
   - Use read_file for changed files

2. **Review For:**
   - **Correctness:** Does it work?
   - **Tests:** Adequate coverage?
   - **Clarity:** Is it readable?
   - **Simplicity:** Any unnecessary complexity?
   - **Philosophy:** YAGNI, DRY, TDD followed?

3. **Provide Feedback**
   - Specific issues with line numbers
   - Actionable suggestions
   - Explain reasoning

4. **Options:**
   - Approve: Continue to next task
   - Request changes: Fix issues before continuing
   - Discuss: Clarify approach with user

---

## Phase 4: Branch Finalization

**Agent:** `superpowers:branch-finalizer`  
**Wraps:** `finishing-a-development-branch` skill  
**Purpose:** Complete development work cleanly

### Process

1. **Verify Tests**
   - Use bash to run full test suite
   - All must pass

2. **Check Status**
   - Use bash: `git status`
   - Use bash: `git log`
   - Verify all work committed

3. **Present Options**
   ```
   Options for completing this work:
   
   1. Merge to main
      - Fast forward merge
      - Suitable for: Small, complete features
   
   2. Create Pull Request
      - Team review
      - CI/CD runs
      - Suitable for: Features needing review
   
   3. Continue Development
      - More work needed
      - Return to plan execution
   
   What would you like to do?
   ```

4. **Execute Choice**
   - User selects option
   - Agent executes with bash tool
   - Reports completion

---

## Supporting Workflows

### Debugging (When Needed)

**Agent:** `superpowers:debugger`  
**Wraps:** `systematic-debugging` skill

**When to use:**
- Tests failing unexpectedly
- Behavior doesn't match expected
- Bug discovered

**Process:**
1. Reproduce the bug
2. Form hypothesis
3. Test hypothesis
4. Iterate until root cause found
5. Fix and verify

---

### Git Worktrees (Optional)

**Agent:** `superpowers:worktree-manager`  
**Wraps:** `using-git-worktrees` skill

**When to use:**
- Working on multiple features simultaneously
- Need isolated workspace
- Want to preserve current work while exploring

**Process:**
1. Create worktree for feature
2. Work in isolated directory
3. Merge when complete
4. Clean up worktree

---

## Integration with Amplifier Foundation Agents

### Complementary Usage

```
Superpowers provides:          Amplifier provides:
- Workflow discipline          - Architectural analysis
- TDD enforcement             - Bug hunting
- Design refinement           - Module building
- Plan execution              - Security review

Use together:
- design-refiner + zen-architect (design + architecture)
- plan-executor + modular-builder (plan + implementation)
- debugger + bug-hunter (both debugging approaches)
- code-reviewer + zen-architect (review + philosophy check)
```

---

## Example: Complete Feature Flow

### User Request
"Add rate limiting to the API"

### Step 1: Design (design-refiner)
```
design-refiner asks:
- What rate limits? (100 req/min per IP)
- What happens when exceeded? (429 status)
- Storage? (Redis)
- Exemptions? (Admin users)

design-refiner presents design in sections:
- Architecture: Middleware approach
- Components: RateLimiter class, Redis backend
- Data flow: Request → Check limit → Allow/Deny
- Error handling: Clear 429 response

Saves to: docs/plans/2025-12-09-rate-limiting-design.md
```

### Step 2: Plan (plan-writer)
```
plan-writer creates detailed plan:

Task 1: Write test for rate limiter (RED)
Task 2: Implement RateLimiter class (GREEN)
Task 3: Write test for Redis backend (RED)
Task 4: Implement Redis backend (GREEN)
Task 5: Write test for middleware (RED)
Task 6: Implement middleware (GREEN)
Task 7: Write test for exemptions (RED)
Task 8: Implement exemptions (GREEN)
Task 9: Integration test
Task 10: Documentation

Saves to: docs/plans/2025-12-09-rate-limiting.md
```

### Step 3: Implementation (plan-executor)
```
plan-executor executes in batches:

Batch 1 (Tasks 1-3):
  ✓ Test for rate limiter (RED)
  ✓ RateLimiter implementation (GREEN)
  ✓ Test for Redis backend (RED)
  
  Reports: "Batch 1 complete, ready for review"
  
Batch 2 (Tasks 4-6):
  ✓ Redis backend (GREEN)
  ✓ Test for middleware (RED)
  ✓ Middleware implementation (GREEN)
  
  Reports: "Batch 2 complete, all tests green"

...continues through all tasks...
```

### Step 4: Review (code-reviewer, continuous)
```
code-reviewer checks after each batch:
- Tests cover edge cases?
- Code follows patterns?
- No unnecessary complexity?
- Provides feedback or approval
```

### Step 5: Finalization (branch-finalizer)
```
branch-finalizer:
- Runs full test suite ✓
- Checks git status ✓
- Presents options:
  1. Merge to main
  2. Create PR
  3. Continue

User selects: "Create PR"
branch-finalizer creates PR with summary
```

---

## Summary

**The workflow:**
1. **Design** → Validated design document
2. **Plan** → Detailed implementation tasks
3. **Implement** → TDD-driven development
4. **Review** → Quality checkpoints
5. **Finalize** → Clean completion

**Key practices:**
- TDD enforced throughout
- Review between tasks
- Batch execution with checkpoints
- Fresh subagents for isolated work
- Clear documentation at each phase

**Result:**
- High quality code
- Comprehensive tests
- Clear commit history
- Validated design
- Clean completion

This workflow scales from small bug fixes to large feature implementations.
