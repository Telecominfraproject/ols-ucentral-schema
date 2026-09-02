# OpenLAN — Pull Request Guidelines

How to submit and integrate pull requests for **`ols-ucentral-schema`** —
the uCentral config, state and capabilities schema: YAML sources, the JSON
generated from them, and the ucode schema reader.

Code formatting and commit-message rules live in
[OPENLAN_CODING_GUIDELINES.md](OPENLAN_CODING_GUIDELINES.md). This document covers the
**PR lifecycle** and has two tracks:

- **[Part A — Contributor Guide](#part-a--contributor-guide):** submitting a PR.
- **[Part B — Reviewer / Merger Guide](#part-b--reviewer--merger-guide):** integrating a PR.

---

## The core principle: PRs are rebased, not merged

This repository keeps a **linear history**. A PR lands by **replaying its commits onto
`main`** (GitHub's "Rebase and merge" button), not by creating a merge commit. As a result:

- The **author field stays the contributor**; the integrator becomes the *committer*.
- The contributor's **`Signed-off-by`** is preserved.
- There is **no "Merge pull request #N" bubble**. The GitHub PR still auto-closes as
  "merged" because its commits now appear on `main`.

`main` carries no merge commits at all.
Everything below is what each side does to make this work.

---

# Part A — Contributor Guide

Deliver a **clean, replayable sequence of standalone commits** so the integrator can replay
your branch without rewriting it.

> **Which base branch?** All PRs target **`main`** — it is the only integration branch in
> this repo. See B6 for how releases are cut from it.

## A1. Branch off the latest `main`, named after the ticket

`main` is the only integration branch — branch all work off `main`.

```bash
git checkout main
git pull origin main
git checkout -b staging-OLS-848-intrusion-detection-access-lockout
```

Branch name = **`staging-OLS-<number>-<short-hyphenated-description>`** — all PR branches
carry the `staging-` prefix. Words are separated by hyphens, with acronyms, band names, and
schema identifiers kept in their conventional case (mirroring the subject-line rule) — e.g.
`staging-OLS-688-storm-control`, `staging-OLS-1027-port-mirror-array`.
**One ticket → one branch → one focused PR.** Keep PRs small — typically **1–3 commits**.

## A2. Stay current with `rebase`, never `merge`

Do not merge `main` into your branch. Rebase onto it.

```bash
git fetch origin
git rebase origin/main          # ✅ replays your commits on top of main
# NOT: git merge main           # ❌ creates a merge bubble that must be undone on apply
```

## A3. Squash to clean, standalone commits before submitting

```bash
git rebase -i origin/main
```

`squash`/`fixup` the "fix typo", "address review", and duplicate commits into their parent.
Target state: **1–3 commits, each builds on its own**, each with:

- Subject `OLS-<number>: imperative summary` — the ticket is the prefix, first word after
  the colon lower-case, schema identifiers keep their case, no trailing period —
  e.g. `OLS-848: add intrusion detection access lockout`, not
  `ols-848-intrusiondetection-draft-changes`.
- Required body (see the coding guide, §2 → *Body*): explain why, then what, as plain text.
  Name the `.yml` sources you changed and confirm the JSON was regenerated.
- **`Signed-off-by: Your Name <email>`** on *every* commit (DCO).
- **`Fixes: OLS-<number>`** where the commit addresses a tracked issue (bug fixes reference
  a ticket; refactors, additions, and bumps often have none).
- **Sources and generated JSON stay in sync at every commit** — they may be applied
  individually.

## A4. Open the PR with a self-justifying description

- **What & why** — mirror the commit body. For a single-commit PR, restate why the change
  is needed and what it does; for a multi-commit PR, give a short per-commit summary plus
  the overall test evidence.
- **Ticket:** link `OLS-<number>`.
- **Affected schema areas:** be explicit (`schema/switch.yml`, `state/state.yml`,
  `capabilities/connect.capabilities.yml`).
- **Validation:** confirm `./generate.sh` was re-run and the regenerated JSON is committed
  alongside the `.yml` change.
- **Schema changes:** confirm you edited the `.yml` source and
  regenerated JSON via `generate.sh` (never hand-edit generated JSON); note any device⇄cloud
  compatibility impact.

## A5. Respond to review by re-pushing a rebased branch

```bash
git rebase -i origin/main       # fold review fixes into the right commits
git push --force-with-lease     # update the same PR; --force-with-lease, not --force
```

Fold review fixes into the relevant commit rather than stacking "address review" commits.
Commits land on `main` exactly as pushed — nothing is rewritten on apply — so expect
reviewers to ask you to **reword or split** commits before the PR is merged; that is
normal, not a rejection.

## A6. Contributor checklist

- [ ] Branch `staging-OLS-<ticket>-<desc>`, cut from latest `main`.
- [ ] Rebased on `main` — **no `Merge branch 'main'` commits**.
- [ ] 1–3 focused commits; no duplicate/fixup/"address review" commits.
- [ ] Each commit: `OLS-<number>: imperative summary`; required body (why, then what);
      `Signed-off-by:` present.
- [ ] Every commit leaves the `.yml` sources and generated JSON in sync.
- [ ] PR description: what/why, ticket, affected schema areas, **validation**.
- [ ] Schema edited in `.yml` + regenerated.
- [ ] PR targets `main`.
- [ ] `git log origin/main..HEAD` shows only your real commits, no merge lines.

---

# Part B — Reviewer / Merger Guide

Integrate with GitHub's **"Rebase and merge"** button — it replays the PR's commits onto
`main` with no merge commit. Do **not** use "Create a merge commit" or "Squash and merge"
for feature PRs.

## B1. Review before integrating

- **Scope:** one ticket, focused, 1–3 commits. Push back on bundled/unrelated changes.
- **Commit hygiene:** each commit standalone, canonical `OLS-<number>: summary` subject,
  a required body (why, then what), `Signed-off-by:` present (and `Fixes:` where the commit
  fixes a tracked issue). Reword non-canonical subjects on apply.
- **Per-commit consistency:** since commits are applied individually, every commit must
  leave the `.yml` sources and the generated JSON in sync.
- **Compatibility risk:** the schema is consumed by both the device and the cloud, so
  breaking changes ripple. Prefer additive changes. When a regression slips through,
  revert it with a reason (see B5).
- **Schema:** confirm `.yml` edited and JSON regenerated via
  `generate.sh`, not hand-edited; check device⇄cloud compatibility.

## B2. Integrate with Rebase and merge

Confirm the PR branch is rebased on the current `main` and every commit is in its final
shape — canonical subject, required body, `Signed-off-by` present — then press GitHub's
**"Rebase and merge"** button. Nothing is rewritten on apply.

This keeps the contributor as **author** and you as **committer**, preserves their
`Signed-off-by`, and adds no merge commit. If only some commits should land, ask the
contributor to drop or split them and re-push, rather than cherry-picking around the PR.

## B3. Clean up before merge

Rebase and merge applies commits verbatim, so fix-ups happen on the PR branch before the
button is pressed — request them from the contributor, or push to the PR branch:

- **Reword** non-canonical subjects (`ols-848-intrusiondetection-draft-changes` →
  `OLS-848: add intrusion detection access lockout`).
- **Drop** any `Merge branch 'main'` commits that leaked into the branch — rebase past them.
- **Split or squash** if a commit mixes concerns or a fixup should fold into its parent.

## B4. Push and confirm linear history

```bash
git log --pretty='%h %an (committer %cn) %s' -5    # authorship preserved?
git log --merges -1                                 # not your feature apply?
```

The contributor's PR auto-closes as "merged" once the commits are on `main`.

## B5. Reverts

When something breaks after landing, revert with the standard format **plus a reason**:

```
Revert "OLS-1027: change port mirror type to array"

This reverts commit 7c62326.
Existing ODM implementations may rely on multiple monitor/analysis port
combinations; needs discussion across ODMs first.

Signed-off-by: ...
```

## B6. Releases

- `main` is the trunk — every PR lands there.
- A release is cut on `main`: bump the version in `schema.json`, land that as a normal PR,
  then tag the resulting commit.
- Use an **annotated** tag, so the release carries an author, date and message:
  ```bash
  git tag -a v5.1.0 -m "Release 5.1.0"
  git push origin v5.1.0
  ```
- Tag names are `vX.Y.Z` and match `major`/`minor`/`patch` in `schema.json`; pre-releases
  use `-rcN` (e.g. `v5.1.0-rc1`).
- There is no maintained backport line. A fix reaches a release by landing on `main` and
  being included in the next tag.

## B7. Reviewer / merger checklist

- [ ] PR is scoped to one ticket, 1–3 standalone commits.
- [ ] Each commit: canonical `OLS-<number>: summary` subject; required body (why, then
      what); `Signed-off-by:` present; subjects reworded if needed.
- [ ] Every commit leaves the `.yml` sources and generated JSON in sync.
- [ ] Device⇄cloud compatibility impact considered for any breaking schema change.
- [ ] QA has signed off on the ticket's staging branch, where QA coverage exists
      (non-blocking; note in the PR when a change ships without QA validation).
- [ ] Integrated via **Rebase and merge** — **no merge commit**.
- [ ] Authorship preserved, contributor `Signed-off-by` kept.
- [ ] History still linear (`git log --merges` unchanged for feature work).
- [ ] Reverts state a reason.
