---
title: "chamilo-lms drift {{ env.CUR }} -> {{ env.LATEST }}"
labels:
  - automation
  - dep-drift
---

Weekly dep-drift report.

- Current pin: `{{ env.CUR }}`
- Latest stable: `{{ env.LATEST }}` ({{ env.AHEAD }} commits ahead)
- Build-gate: **PASSED** at `{{ env.LATEST }}`; a bump PR was opened (or is already open).

The change is the linked PR (one-line Dockerfile diff). Not auto-merged.

_Filed automatically by the weekly `dep-drift` workflow (`.github/workflows/dep-drift.yml`) via the [`JasonEtco/create-an-issue` action](https://github.com/JasonEtco/create-an-issue)._
