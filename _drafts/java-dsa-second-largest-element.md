---
title: "[DRAFT] Java DSA: Finding the Second Largest Element"
date: 2026-10-28 09:00:00 -0400
categories: [Java, DSA]
tags: [java, arrays, interview-prep]
description: "DRAFT: example article outline, not yet reviewed."
math: false
---

> **Draft / example article.** This is a starter outline to be reviewed, tested and expanded before publishing. It lives in `_drafts/`, so it does not appear on the live site.
{: .prompt-warning }

## Problem

Given an integer array, return the second largest **distinct** value. If none exists, signal that clearly.

<!-- TODO: State your chosen contract (exception vs. sentinel vs. Optional) and why. -->

## Approach 1: Sort, O(n log n)

<!-- TODO: Explain why this is simple but not optimal, and the duplicate-handling trap. -->

## Approach 2: Single pass, O(n) time and O(1) space

```java
import java.util.OptionalInt;

public final class SecondLargest {

    public static OptionalInt find(int[] nums) {
        if (nums == null || nums.length < 2) {
            return OptionalInt.empty();
        }
        long first = Long.MIN_VALUE;
        long second = Long.MIN_VALUE;
        for (int n : nums) {
            if (n > first) {
                second = first;
                first = n;
            } else if (n < first && n > second) {
                second = n;
            }
        }
        return second == Long.MIN_VALUE ? OptionalInt.empty() : OptionalInt.of((int) second);
    }
}
```

Using `long` sentinels means an input that contains `Integer.MIN_VALUE` is still handled correctly.

## Test cases

<!-- TODO: Turn these into JUnit 5 tests and include the output. -->

| Input | Expected |
| ----- | -------- |
| `[12, 35, 1, 10, 34, 1]` | `34` |
| `[10, 10, 10]` | empty |
| `[5]` | empty |
| `[-1, Integer.MIN_VALUE]` | `Integer.MIN_VALUE` |

## Complexity

<!-- TODO -->
