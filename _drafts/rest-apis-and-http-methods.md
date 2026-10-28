---
title: "[DRAFT] Understanding REST APIs and HTTP Methods"
date: 2026-10-28 09:00:00 -0400
categories: [Testing, API]
tags: [rest-api, http, postman, api-testing]
description: "DRAFT: example article outline, not yet reviewed."
---

> **Draft / example article.** This is a starter outline to be reviewed, fact-checked and expanded before publishing. It lives in `_drafts/`, so it does not appear on the live site.
{: .prompt-warning }

## What is a REST API?

<!-- TODO: Explain resources, URIs, statelessness, and representations (JSON) in your own words. -->

## The core HTTP methods

| Method | Typical use | Idempotent? | Has request body? |
| ------ | ----------- | ----------- | ----------------- |
| GET    | Read a resource | Yes | No |
| POST   | Create a resource / trigger an action | No | Yes |
| PUT    | Replace a resource | Yes | Yes |
| PATCH  | Partially update a resource | Not guaranteed | Yes |
| DELETE | Remove a resource | Yes | Usually no |

<!-- TODO: Add a real example for each method against a public test API. -->

```http
GET /users/42 HTTP/1.1
Host: api.example.com
Accept: application/json
```

## Status codes worth knowing

<!-- TODO: 200, 201, 204, 400, 401, 403, 404, 409, 422, 429, 500, 503 with one-line meaning each. -->

## How I test these as an SDET

<!-- TODO: Postman collection + REST Assured examples; positive/negative cases; contract checks. -->

## Key takeaways

<!-- TODO -->
