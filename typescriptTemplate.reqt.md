<!-- reqt_id: 2025-06-08T15:59:09.253Z-b99f0ec9 --start-->

# 0: typescriptTemplate 
<!-- reqt_status_field-->
**Status:**
PLANNED

 <!-- reqt_Desc_field-->
**Description**

DETAILS

<!-- reqt_Accept_field-->
**Acceptance:**

ACCEPTANCE

<!-- reqt_README_field-->
**README:**

exclude

<!-- Make Content "exclude" to exclude from README generation -->
---
<!-- reqt_id: 2025-06-08T15:59:09.253Z-b99f0ec9 --end-->

<!-- reqt_id: 2025-06-08T15:59:25.540Z-09c573db --start-->

## 1: Workspace 
<!-- reqt_status_field-->
**Status:**
PLANNED

 <!-- reqt_Desc_field-->
**Description**

This will be a git template that will be used to create TypeScript project that will have a core API functions and a CLI interface.

**OBJECTIVES:**
- ESM modules only
- ts-node for running TypeScript files
- Vitest for testing
    - Coverage with c8
- src/ holds both .ts and .test.ts files
- package.json scripts
    - npm run build = `tsc`
    - npm run test = run vitest with coverage
- CLI interface
    - `npx <package-name>` to run the CLI to run the current build at any time
    - npm run test must run the core and the CLI tests
- Use `execa` for running CLI commands
- create a .gitignore file with common Node.js and TypeScript ignores

**Workflow:**
- use npm run test to see all the current test with coverage
- To run an individual test file, `npx vitest run <file> --coverage`
- To manually run the CLI, `npx <package-name>`

```json
  "devDependencies": {
    "@vitest/coverage-v8": "^3.2.2",
    "c8": "^10.1.3",
    "execa": "^9.6.0",
    "reqtext": "^0.2.1",
    "ts-node": "^10.9.2",
    "typescript": "^5.8.3",
    "vite": "^6.3.5",
    "vitest": "^3.2.2"
  }
```

<!-- reqt_Accept_field-->
**Acceptance:**

ACCEPTANCE

<!-- reqt_README_field-->
**README:**

README

<!-- Make Content "exclude" to exclude from README generation -->
---
<!-- reqt_id: 2025-06-08T15:59:25.540Z-09c573db --end-->