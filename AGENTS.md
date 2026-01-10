# ERASMUS Agent Instructions

## Overview

ERASMUS is an autonomous AI agent loop that writes Erasmus+ KA210 Small-scale Partnership applications. Each iteration is a fresh agent instance with clean context. Memory persists via git history, `postep.txt`, and `wniosek.json`.

## Commands

```bash
# Run ERASMUS (from project root)
./erasmus.sh [max_iterations]

# Check section status
cat wniosek.json | jq '.sekcje[] | {id, tytul, ukonczona}'

# View progress log
cat postep.txt
```

## Key Files

- `erasmus.sh` - The bash loop that spawns fresh agent instances
- `prompt.md` - Instructions given to each agent instance
- `wniosek.json` - Application sections with completion status
- `wniosek.json.example` - Example application format
- `Matryca_KA210_EN.md` - LogFrame matrix reference structure
- `postep.txt` - Progress log for context between iterations
- `skills/prd/` - Skill for organization analysis and Project Bible
- `skills/erasmus/` - Skill for converting Project Bible to JSON

## Critical Patterns

### Character Limits (NON-NEGOTIABLE)

Every field MUST be filled to 90-95% of limit:
- 3000 chars → write 2700-2850 chars
- 2000 chars → write 1800-1900 chars
- 1000 chars → write 900-950 chars
- Below 80% = lost points!

### Concrete Target Groups (NON-NEGOTIABLE)

WRONG: "young people", "students", "participants"
RIGHT: "Youth from [School Name], grades [X-Y], [N] students"

### All 4 Horizontal Aspects (Section B2.6)

Must address ALL:
1. Inclusion & Diversity
2. Environmental Sustainability (33%+ green travel)
3. Digital Dimension (name specific tools)
4. Participation & Civic Engagement

### SMART Objectives

Every objective must be:
- Specific (clear scope)
- Measurable (numbers, KPIs)
- Achievable (realistic)
- Relevant (linked to priority)
- Time-bound (deadline)

### Budget Rules

- Sum must equal exactly 60,000 EUR (or 30,000)
- Activities ONLY in partner countries
- Use calculation algorithm in prompt.md

### Data Sources

Always cite sources:
- Eurostat for EU statistics
- OECD for country comparisons
- National reports for local data
- Own micro-research (N≥10) if available

## Evaluation Criteria

| Criterion | Points | Key factors |
|-----------|--------|-------------|
| RELEVANCE | 30 | Priority link, inclusion, EU value |
| QUALITY | 30 | SMART objectives, methodology, digital |
| PARTNERSHIP | 20 | Active partners, newcomer bonus |
| IMPACT | 20 | KPIs, sustainability, dissemination |

## Iteration Flow

1. Read `wniosek.json` for current state
2. Read `postep.txt` for context
3. Pick highest priority section with `ukonczona: false`
4. Write section following `prompt.md` guidelines
5. Verify character count (90-95%)
6. Update `wniosek.json` to mark complete
7. Append progress to `postep.txt`
8. Commit changes
9. Repeat until all sections complete
