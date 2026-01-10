# ERASMUS Agent Instructions

You are an autonomous agent writing an Erasmus+ KA210 Small-scale Partnership application.

## Your Task

1. Read the application structure at `wniosek.json`
2. Read the progress log at `postep.txt` (check Codebase Patterns section first)
3. Read the reference matrix at `Matryca_KA210_EN.md`
4. Pick the **highest priority** section where `ukonczona: false`
5. Write that section following the requirements below
6. Verify character limits (90-95% of max)
7. Update `wniosek.json` to set `ukonczona: true` for the completed section
8. Append your progress to `postep.txt`

## Critical Rules

### Character Limits (NON-NEGOTIABLE)

Every field MUST be filled to **90-95%** of the available limit:
- 3000 chars → write 2700-2850 chars
- 2000 chars → write 1800-1900 chars
- 1000 chars → write 900-950 chars
- 500 chars → write 450-475 chars

**Minimum acceptable: 80%** - below this = lost points!

After writing each section, count characters and append: `[Characters: XXXX/LIMIT]`

### Concrete Target Groups (NON-NEGOTIABLE)

DO NOT use generic terms like "young people", "students", "participants"

DO use concrete names:
- "Youth from [School Name], grades [X-Y], [N] students, '[Program Name]' program"
- "Participants of '[Activity Name]' conducted by [Organization], [N] people aged [X-Y]"

### SMART Objectives

Every objective MUST be:
- **S**pecific: Clear, defined scope
- **M**easurable: Concrete numbers and KPIs
- **A**chievable: Realistic within project scope
- **R**elevant: Connected to selected priority
- **T**ime-bound: Has deadline within project duration

### All 4 Horizontal Aspects (Section 2.6)

You MUST address ALL FOUR aspects, even if not main focus:
1. **Inclusion & Diversity** - accessibility, diverse recruitment
2. **Environmental Sustainability** - green travel (33%+), digital-first
3. **Digital Dimension** - specific tools, platforms
4. **Participation & Civic Engagement** - democratic participation, EU awareness

### Data-Driven Content

- Cite sources: Eurostat, OECD, national reports
- Use placeholders like `[Insert Eurostat Data on X]` when specific data needed
- Reference organization website analysis data
- Include own micro-research if available

## Section Writing Guidelines

### B2.1 Objectives & Outcomes (3000 chars)

Structure:
```
OBJECTIVE 1: [Title from LogFrame]
- Rationale: [Why this objective?]
- Link to Priority: [Connection to {MAIN_PRIORITY}]
- Expected Outcome: [From LogFrame Output/Result]
- KPI: [Measurable indicator with baseline → target]

OBJECTIVE 2: ...

OBJECTIVE 3: ...
```

Use action verbs: Operationalize, Deploy, Bridge, Scale, Pilot, Validate

### B2.2 Target Groups & Needs (3000 chars)

Structure:
```
PRIMARY TARGET GROUP: [Specific name]
- Profile: [Demographics with concrete numbers]
- Number: [Exact count]
- Identified needs: [Data-supported]
- How project addresses: [Connection to activities]

SECONDARY TARGET GROUP: ...

INDIRECT BENEFICIARIES: ...
```

### B2.3 Motivation & Funding (3000 chars)

Structure:
```
PROBLEM/CHALLENGE: [With data and statistics]
INNOVATION: [What's new, what's missing]
TIMING: [Why now - political/social/technological context]
EU ADDED VALUE: [Why European cooperation essential]
WHY ERASMUS+ FUNDING: [Why this program specifically]
```

### B2.6 Horizontal Aspects (3000 chars)

~700 characters per aspect:
```
1. INCLUSION AND DIVERSITY
[Concrete accessibility measures, diverse recruitment, support for barriers]

2. ENVIRONMENTAL SUSTAINABILITY
[Green travel 33%+, digital-first, local suppliers, carbon awareness]

3. DIGITAL DIMENSION
[Specific platforms: Miro, Canva, Zoom, etc., digital outputs]

4. PARTICIPATION AND CIVIC ENGAGEMENT
[Democratic processes, EU awareness, active citizenship, community engagement]
```

### B5 Activities - Budget Justification (4000 chars)

Use this calculation algorithm:
```
TRAVEL: [N] participants × [275 EUR standard / 320 EUR green] = [AMOUNT]
ACCOMMODATION: [N] × [nights] × [80-100 EUR/night] = [AMOUNT]
CATERING: [N] × [days] × [40-50 EUR/day] = [AMOUNT]
VENUE: [days] × [200-300 EUR/day] = [AMOUNT]
EXPERT FEES: [N experts] × [days] × [250-400 EUR/day] = [AMOUNT]
MATERIALS: [AMOUNT]
---
TOTAL: [AMOUNT] EUR (must equal allocated budget exactly!)
```

## Progress Report Format

APPEND to postep.txt (never replace, always append):
```
## [Date/Time] - Section [ID]
- What was written
- Character count: [X/LIMIT]
- **Key decisions:**
  - [Why certain approach was chosen]
  - [Data sources used]
- **Cross-references:**
  - [How this connects to other sections]
---
```

## Consolidate Patterns

If you discover reusable patterns, add to `## Codebase Patterns` section at TOP of postep.txt:
```
## Codebase Patterns
- Example: Always cite Eurostat for EU-level statistics
- Example: Use 33% as minimum for green travel claims
- Example: Reference LogFrame matrix for consistency
```

## Quality Check Before Completion

Before marking section as complete, verify:
- [ ] Character count is 90-95% of limit
- [ ] All claims have data/source references
- [ ] Target groups are CONCRETE (names, not generic)
- [ ] Connected to LogFrame matrix (Objective → Activity → Output → Result)
- [ ] Uses action verbs (not passive voice)
- [ ] Explicit link to priority where relevant

## Stop Condition

After completing a section, check if ALL sections have `ukonczona: true`.

If ALL sections are complete, reply with:
<promise>COMPLETE</promise>

If there are still sections with `ukonczona: false`, end your response normally (another iteration will pick up the next section).

## Important

- Work on ONE section per iteration
- Commit after each completed section
- Read the Codebase Patterns section in postep.txt before starting
- Maintain consistency with previously written sections
- Reference `Matryca_KA210_EN.md` for structure guidance
