# Example: TDD Enforcement

This example shows how the TDD enforcer works in practice.

## The Iron Law

**NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST**

## Example: Adding a Cache Feature

### ❌ Wrong Way (Without TDD Enforcer)

**Developer writes implementation first:**
```python
# src/cache.py
class Cache:
    def __init__(self):
        self.store = {}
    
    def get(self, key):
        return self.store.get(key)
    
    def set(self, key, value):
        self.store[key] = value
```

**Problem:** No test, no verification it works, might not test edge cases later.

### ✅ Right Way (With TDD Enforcer)

**Step 1: RED - Write Failing Test**

```python
# tests/test_cache.py
def test_cache_stores_and_retrieves_value():
    cache = Cache()
    cache.set("key", "value")
    assert cache.get("key") == "value"
```

**Run test:**
```bash
$ pytest tests/test_cache.py
ERROR: cannot import name 'Cache'
```

**TDD Enforcer:** ✓ Test fails correctly - Cache doesn't exist yet

**Step 2: GREEN - Minimal Implementation**

```python
# src/cache.py
class Cache:
    def __init__(self):
        self.store = {}
    
    def get(self, key):
        return self.store.get(key)
    
    def set(self, key, value):
        self.store[key] = value
```

**Run test:**
```bash
$ pytest tests/test_cache.py
PASSED
```

**TDD Enforcer:** ✓ Test passes - minimum code to pass test

**Step 3: REFACTOR - Improve**

```python
# src/cache.py
from typing import Any, Optional

class Cache:
    """Simple in-memory cache."""
    
    def __init__(self):
        self._store: dict[str, Any] = {}
    
    def get(self, key: str) -> Optional[Any]:
        """Get value from cache."""
        return self._store.get(key)
    
    def set(self, key: str, value: Any) -> None:
        """Set value in cache."""
        self._store[key] = value
```

**Run test:**
```bash
$ pytest tests/test_cache.py
PASSED
```

**TDD Enforcer:** ✓ Tests still pass after refactoring

**Step 4: Commit**

```bash
$ git add .
$ git commit -m "Add Cache class with get/set (TDD)"
```

## What Happens If You Break The Rules?

### Scenario: Developer Writes Code Without Test

**Code appears:**
```python
# src/cache.py
class Cache:
    def __init__(self):
        self.store = {}
        self.ttl = {}  # NEW CODE WITHOUT TEST
    
    def set(self, key, value, ttl=None):  # MODIFIED WITHOUT TEST
        self.store[key] = value
        if ttl:
            self.ttl[key] = time.time() + ttl
```

**TDD Enforcer detects:**
```
⚠️  CODE WITHOUT TEST DETECTED

The following code was written without a failing test first:
- TTL functionality in Cache.set()
- self.ttl dictionary

This violates the Iron Law: NO CODE WITHOUT FAILING TEST FIRST

Action required: Delete this code and start over with test first.
```

**TDD Enforcer takes action:**
```
Reverting unauthorized changes...

✓ Reverted to last TDD-compliant state
✓ Removed untested code

Please write test first, watch it fail, then implement.
```

## Complete TDD Cycle Example

### Feature: Cache with TTL (Time To Live)

**Cycle 1: Basic TTL**

```python
# RED
def test_cache_with_ttl():
    cache = Cache()
    cache.set("key", "value", ttl=1)  # 1 second
    assert cache.get("key") == "value"
```

Run test → Fails (ttl parameter doesn't exist) ✓

```python
# GREEN
def set(self, key, value, ttl=None):
    self.store[key] = value
    # Minimal: accept ttl but don't use it yet
```

Run test → Passes ✓

**Cycle 2: TTL Expiration**

```python
# RED
def test_cache_ttl_expires():
    cache = Cache()
    cache.set("key", "value", ttl=0.1)  # 100ms
    time.sleep(0.2)
    assert cache.get("key") is None
```

Run test → Fails (returns value even after expiration) ✓

```python
# GREEN
def __init__(self):
    self.store = {}
    self.ttl = {}

def set(self, key, value, ttl=None):
    self.store[key] = value
    if ttl:
        self.ttl[key] = time.time() + ttl

def get(self, key):
    if key in self.ttl:
        if time.time() > self.ttl[key]:
            self._delete(key)
            return None
    return self.store.get(key)
```

Run test → Passes ✓

**Cycle 3: Cleanup**

```python
# RED
def test_cache_cleans_up_expired():
    cache = Cache()
    cache.set("key", "value", ttl=0.1)
    time.sleep(0.2)
    cache.cleanup()
    assert "key" not in cache.store
```

Run test → Fails (cleanup doesn't exist) ✓

```python
# GREEN
def cleanup(self):
    expired = [k for k, exp in self.ttl.items() if time.time() > exp]
    for key in expired:
        self._delete(key)
```

Run test → Passes ✓

## Benefits of TDD Enforcement

**Quality:**
- Every line of code has a test
- Tests actually verify behavior (saw them fail first)
- No untested edge cases

**Confidence:**
- Refactor safely (tests catch regressions)
- Add features safely (tests ensure existing code works)
- Deploy confidently (comprehensive test coverage)

**Speed:**
- Less debugging (catch issues in tests)
- Less rework (design emerges from tests)
- Faster reviews (tests document behavior)

## Summary

**The TDD Enforcer ensures:**
1. Tests written first (RED)
2. Implementation minimal (GREEN)
3. Refactoring safe (tests stay green)
4. No code without tests (Iron Law)

**Result:** High-quality, well-tested code every time.
