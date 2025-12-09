# Example: Complete Feature Workflow

This example shows the complete superpowers workflow in Amplifier for adding a feature.

## Scenario

**User request:** "Add rate limiting to our API to prevent abuse"

## Phase 1: Design Refinement

**User:** "I want to add rate limiting to the API"

**Amplifier (design-refiner agent):**
```
I'll help you design the rate limiting feature. Let me ask some questions:

1. What rate limits do you want to enforce?
   a) 100 requests/minute per IP
   b) 1000 requests/hour per user
   c) Custom limits per endpoint
   d) Combination of the above
```

**User:** "a - 100 requests per minute per IP"

**Amplifier:** 
```
What should happen when the limit is exceeded?
   a) Return 429 (Too Many Requests) with Retry-After header
   b) Queue requests
   c) Drop silently
```

**User:** "a - Return 429"

**Amplifier continues questioning...**

After design refinement, saves to: `docs/plans/2025-12-09-rate-limiting-design.md`

## Phase 2: Plan Creation

**Amplifier (plan-writer agent):**
```
I'll create a detailed implementation plan from your design.

Plan saved to: docs/plans/2025-12-09-rate-limiting.md

The plan includes 12 tasks:
1. Write test for RateLimiter class (RED)
2. Implement RateLimiter class (GREEN)
3. Write test for Redis backend (RED)
4. Implement Redis backend (GREEN)
... (continued)
```

## Phase 3: Implementation

**Amplifier (plan-executor agent):**
```
I'll execute the plan in batches of 3 tasks.

Batch 1 (Tasks 1-3):
  ✓ Task 1: Write test for RateLimiter (RED)
     - Created tests/test_rate_limiter.py
     - Test fails as expected ✓
     
  ✓ Task 2: Implement RateLimiter class (GREEN)
     - Created src/rate_limiter.py
     - All tests pass ✓
     
  ✓ Task 3: Write test for Redis backend (RED)
     - Added tests for Redis integration
     - Test fails as expected ✓

Ready for feedback.
```

**User:** "Continue"

**Amplifier continues through all batches...**

## Phase 4: Review (Continuous)

After each batch, code-reviewer checks:
```
code-reviewer:
  ✓ Tests cover edge cases
  ✓ Code follows patterns
  ✓ No unnecessary complexity
  ✓ TDD discipline maintained
  
Approved - continue to next batch
```

## Phase 5: Finalization

**Amplifier (branch-finalizer agent):**
```
All tasks complete. Running final verification...

✓ Full test suite: 47 tests, all passing
✓ Git status: All work committed
✓ Branch: feature/rate-limiting

Options for completing this work:
1. Merge to main
2. Create Pull Request
3. Continue development

What would you like to do?
```

**User:** "Create Pull Request"

**Amplifier:**
```
Creating pull request...

✓ PR created: https://github.com/you/repo/pull/123

PR Summary:
- Add rate limiting to API (100 req/min per IP)
- Redis-backed storage
- 429 responses with Retry-After header
- 47 tests, 100% passing

Branch finalization complete!
```

## Summary

**Time:** ~45 minutes for complete feature (automated execution)  
**Quality:** 100% test coverage, TDD-enforced, code reviewed  
**Process:** Design → Plan → Implement → Review → Complete  
**Result:** Production-ready feature with comprehensive tests

This workflow ensures:
- Thoughtful design before coding
- Detailed planning with bite-sized tasks
- TDD discipline throughout
- Code review at checkpoints
- Clean completion

## Try It Yourself

```bash
# Load superpowers-dev profile
amplifier --profile superpowers:superpowers-dev

# Start with your feature request
> I want to add [your feature]

# Follow the workflow:
# 1. Answer design questions
# 2. Review and approve design
# 3. Review and approve plan
# 4. Approve batches as they complete
# 5. Choose completion option
```
