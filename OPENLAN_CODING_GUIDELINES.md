# OpenLAN — Coding Guidelines

Coding standards for **`ols-ucentral-schema`** —
the uCentral config, state and capabilities schema: YAML sources, the JSON
generated from them, and the ucode schema reader.

For the PR lifecycle (branching, submitting, integrating), see
[OPENLAN_PR_GUIDELINES.md](OPENLAN_PR_GUIDELINES.md). This document covers **code
formatting, commit messages, and per-language conventions**.

---

## 1. Git history

The history is **linear**. Keep it that way:

- **No merge bubbles.** Submit clean, rebasable commits — they land via rebase /
  cherry-pick / `git am`, not merge.
- **One logical change per commit.** Don't bundle unrelated fixes; commits are applied
  individually and must each leave the tree buildable.
- **Authorship and `Signed-off-by` are preserved** when a patch is applied — the author
  stays the contributor, the integrator becomes the committer.

---

## 2. Commit message conventions

Every commit follows kernel-style trailers, with the ticket as the subject prefix:

```
OLS-<number>: <imperative summary — first word lower-case; schema identifiers keep their case; no trailing period>

<Required body, wrapped at ~72 cols: explain why the change is needed, then what
it does. Use "-" bullets for multi-part fixes. Name the .yml sources changed and
confirm the JSON was regenerated.>

Fixes: OLS-<number>
Signed-off-by: Your Name <email>
```

### Subject line

- **`OLS-<number>: description`** — the ticket is the prefix and is **mandatory**. This
  repo has no subsystems, so the ticket is what namespaces a commit.
- **First word after the colon is lower-case and imperative** (`fix`, `add`, `remove`,
  `update`, `disable`); **preserve the case of schema identifiers** (e.g. `Access-Lockout`,
  `MCLAG`, `VLAN`); **no trailing period**.
- Keep the whole subject under ~72 characters.

Examples:
```
OLS-848: add intrusion detection access lockout
OLS-688: add storm control to the switch capabilities
OLS-644: add a global DNS server list to switch.yml
OLS-1027: change port mirror type to array
```

### Body

A body is **required** on every commit. Write it as plain text, not labelled
sections:

- **Explain why, then what.** Lead with the reason the change is needed (the bug, gap, or
  motivation the diff can't show), then what the commit does. Imperative mood, wrapped at
  ~72 columns; use `-` bullets for multi-part fixes.
- **Record what you validated as plain text** — which `.yml` sources changed, that the
  JSON was regenerated with `./generate.sh` and committed alongside them, and any
  device⇄cloud compatibility impact. Mechanical commits (version bumps, renames, reverts)
  need none. Optionally use a `Tested-by:` trailer when someone else verified the change.

Trailers follow the body:

- **`Fixes: OLS-<number>`** **where the commit addresses a tracked issue.** Bug fixes
  reference a ticket; refactors, additions, and bumps often have none.
- **`Signed-off-by:` is required on every commit** (DCO). Preserve upstream sign-offs when
  forwarding a patch; add your own.

### Special commit types

- **Reverts** use the standard `git revert` format plus a reason:
  ```
  Revert "OLS-1027: change port mirror type to array"

  This reverts commit 7c62326.
  Existing ODM implementations may rely on multiple monitor/analysis port
  combinations; needs discussion across ODMs first.
  ```

---

## 3. File headers (SPDX)

Every **new** source file begins with an SPDX license identifier, written in that file's own
comment syntax; for files with a shebang, the identifier goes **immediately after the
shebang line**. Use the **same license as the rest of the package** — C sources in these
repos use `BSD-3-Clause`. When editing an existing file, match its current header; don't
change a file's license identifier as a drive-by.

Comment syntax per language:

- C / headers: `/* SPDX-License-Identifier: BSD-3-Clause */`
- ucode (`.uc`): `// SPDX-License-Identifier: <package license>` — above `"use strict";`
- Shell / procd init scripts: shebang first, then `# SPDX-License-Identifier: <package license>`
- YAML / UCI config: `# SPDX-License-Identifier: <package license>`

---

## 4. C code style (`wlan-ucentral-client`, packages)

Follow the **OpenWrt / libubox / Linux-kernel** idiom — be consistent with it, not with
generic C conventions.

- **`/* SPDX-License-Identifier: BSD-3-Clause */`** as the first line of every C source and
  header file (see §3 for the cross-language rule).
- **Tabs for indentation.** Never spaces.
- **K&R braces.** For function *definitions*, the return type and name go on the same line,
  but the opening brace is on its own line:
  ```c
  static void
  send_blob(struct blob_buf *blob)
  {
          char *msg;
          int len;
          ...
  }
  ```
- **`static` for everything file-local** — functions and globals.
- **snake_case**, lower-case, no Hungarian notation.
- **libubox/libubus/blobmsg idioms throughout:**
  - Attribute enums end with a `__FOO_MAX` sentinel and pair with a
    `static const struct blobmsg_policy foo_policy[__FOO_MAX]` using designated
    initializers (`[JSONRPC_VER] = { .name = "jsonrpc", .type = BLOBMSG_TYPE_STRING }`).
  - Logging via **`ULOG_ERR` / `ULOG_DBG`**, not `printf`/`fprintf` in production paths.
- **Dead code is `#if 0`'d out**, not deleted, when kept for reference. Keep these blocks rare.
- Declarations at the top of the block; early-return guard style for error paths.

---

## 5. ucode (`.uc`) style

- **`"use strict";`** at the top of every module.
- **Tabs for indentation.**
- **`let` for locals**, never bare globals.
- **Modular helpers via `require`/`import`.** Shared logic lives in `libs/` and is imported
  explicitly:
  ```js
  import { ipcalc } from 'libs.ipcalc';
  import { create_wiphy } from 'libs/wiphy.uc';
  import {
          b, s, uci_cmd, uci_set_string, uci_set_boolean, ...
  } from 'libs/uci_helpers.uc';
  ```
- **JSDoc-style doc comments** on non-trivial functions (`@param`, `@memberof`).
- **Defensive coding:** null-guard every external read
  (`let conn = ubus ? ubus.connect() : null;`), and use **`assert()` for invariants**
  (`assert(cursor, "Unable to instantiate uci");`).
- **`??=` for nullish defaults** (`default_config.country ??= 'US';`).
- Wrap risky includes in `try/catch` and `warn()` rather than aborting.

---

## 6. Schema authoring

- **Author in YAML, never hand-edit generated JSON.** The source of truth is the
  `schema/*.yml` files (2-space indent); `ucentral.schema.json`, `*.pretty.json`, and the
  full schema are **generated** via `generate.sh` / `merge-schema.py`. Regenerate and commit
  the output; don't patch it by hand.
- Each property block carries **`description`, `type`, constraints (`maximum`/`minimum`),
  and `examples`** — keep all four. Descriptions are full prose sentences.
- The schema is consumed by both the device (`schemareader.uc`, generated by
  `generate-reader.uc`) and the cloud, so **breaking changes ripple**. Prefer additive
  changes; bump and document when you must break.

---

## 7. Quick checklist

- [ ] One logical change per commit; `.yml` sources and generated JSON in sync at every
      commit.
- [ ] Subject `OLS-<number>: imperative summary`: first word lower-case, schema identifiers
      keep their case, no trailing period.
- [ ] Body present (why, then what); names the `.yml` sources changed and confirms the JSON
      was regenerated.
- [ ] `Signed-off-by:` present on every commit (yours preserved + upstream preserved).
- [ ] New source files carry an SPDX identifier (first line, or immediately after a shebang).
- [ ] C: tabs, `static`, blobmsg policy + `__MAX` sentinel, `ULOG_*` logging.
- [ ] ucode: `"use strict"`, tabs, `let`, helpers imported from `libs/`, null-guards + `assert()`.
- [ ] Schema: edited the `.yml`, regenerated JSON via `generate.sh`, didn't hand-edit JSON.
