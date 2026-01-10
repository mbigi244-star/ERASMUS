---
name: prd
description: "Analyze organizations and generate Project Bible for Erasmus+ KA210 applications. Use for organization website analysis, partner matching, and topic proposals. Triggers on: analyze organization, create project bible, generate ka210 proposal, erasmus+ planning."
---

# KA210 Project Bible Generator

Create comprehensive Project Bibles for Erasmus+ KA210 Small-scale Partnership applications.

---

## The Job

1. Analyze organization websites (PROMPT 0.0)
2. Generate partner match and 3 topic proposals (PROMPT 0.1)
3. After user selects topic, generate full Project Bible (PROMPT 0.2)
4. Save to `tasks/project-bible-[acronym].md`

**Reference:** Always use `Matryca_KA210_EN.md` as structure reference.

---

## PROMPT 0.0: Organization Website Analysis (MANDATORY)

Before writing any application content, analyze websites of all participating organizations.

### Task

For each organization (applicant + partners), identify:

1. **Concrete target groups** (NOT generic "young people"):
   - Specific names of schools, programs, groups
   - Numbers of participants
   - Age ranges and profiles
   - Identified needs from programs

2. **Operational capacity proofs**:
   - Infrastructure (labs, equipment)
   - Staff (trainers, experts, PhDs)
   - Track record (past projects, trained participants)

### Output Format

```
## ORGANIZATION ANALYSIS: [NAME]
Website: [URL]

### Concrete Target Groups:
1. [Specific group with name, numbers, age, program]
2. [Another specific group]

### Operational Capacity:
- [Infrastructure/equipment]
- [Staff expertise]
- [Track record with numbers]

### Data for Matrix:
- Problems addressed: [list]
- Potential objectives: [list]
```

---

## PROMPT 0.1: Strategic Matchmaker and Topic Generator

After website analysis, generate partner profile and 3 project topics.

### Focus: Digital and AI domains
- Digital Transformation
- Artificial Intelligence
- Digital Skills
- Digital Citizenship
- Media Literacy

### Task 1: Capabilities Audit

For Polish organization:
- **Superpowers**: Specific infrastructure, staff, local reach
- **Strategic gap**: What's missing to achieve long-term goals
- **Complementarity**: Profile of ideal partner

### Task 2: Ideal Partner Profile

- Preferred country (with justification)
- Organization type (NGO, SME, University)
- Required expertise ("hard skills")
- Role in project

### Task 3: Three Topic Proposals

For each topic:
- Title and main priority
- Synergy logic (why this specific pair)
- Hard output (tangible result)

### Output Format

```
## 1. APPLICANT DIAGNOSIS
Superpower: [description]
Strategic gap: [description]

## 2. IDEAL PARTNER PROFILE
Best countries: [list with reasons]
Organization type: [type]
Required expertise: [list]
Role: [description]

## 3. PROJECT TOPIC PROPOSALS

### OPTION A: [Title]
Priority: [Inclusion & Diversity / Digital Transformation / etc.]
Concept: [2-3 sentences]
Role division:
- Polish org does: [tasks]
- Partner does: [tasks]
Hard output: [tangible deliverable]

### OPTION B: [Title]
[same structure]

### OPTION C: [Title]
[same structure]
```

---

## PROMPT 0.2: Full Project Bible Generator

After user selects option (A/B/C), generate complete Project Bible.

### Required Sections

1. **PROJECT_DATA**: title, acronym, topic, priority, duration (17 months recommended), budget (60k), dates (start: September 2026)

2. **APPLICANT_ORG**: name, country, expertise, role, unique assets

3. **PARTNER_1**: name, country, expertise, role, unique assets, newcomer status

4. **STRATEGY**:
   - Target groups (CONCRETE from analysis!)
   - Main problem
   - Solution
   - Innovation (4 dimensions: APPROACH/TECHNOLOGY/ACCESSIBILITY/MEASUREMENT)
   - EU added value
   - Synergy logic
   - Competitive advantage (200-300 chars)
   - Dissemination assets (concrete reach numbers)

5. **LOGFRAME MATRIX**: Table with 3-5 objectives
   | ID | Objective (SMART) | Activity | Output | Result | KPI |

6. **BUDGET ALLOCATION**: Table summing to exactly 60,000 EUR
   - Project Management: 17-25%
   - Activities: remaining budget
   - Must sum to 60,000 exactly!

7. **TIMELINE**: Phases with months, activities, deliverables

8. **KEY ACTIVITIES**: For each activity:
   - Location (partner country only!)
   - Duration (days)
   - Participants (number and breakdown)
   - Budget
   - Objectives
   - Leading organisation

9. **OPERATIONAL CAPACITY PROOFS**: 3-5 hard statistics per organization

---

## Important Requirements

1. **Use concrete target groups** from website analysis
   - NOT: "students" or "youth"
   - YES: "Youth from [School Name], grades [X-Y], [N] students"

2. **Budget must sum to exactly 60,000 EUR**

3. **Timeline must match duration** (17 months recommended)

4. **Activities ONLY in partner countries** or EU institution HQs

5. **LogFrame must show logical flow**: Problem → Objective → Activity → Output → Result

---

## Output

- **Format:** Markdown (`.md`)
- **Location:** `tasks/`
- **Filename:** `project-bible-[acronym].md`

---

## Checklist Before Saving

- [ ] Website analysis completed for all organizations
- [ ] Target groups are CONCRETE (names, numbers)
- [ ] Budget sums to exactly 60,000 EUR
- [ ] Timeline matches duration
- [ ] Activities only in partner countries
- [ ] LogFrame shows clear logical progression
- [ ] Operational capacity proofs included
- [ ] Saved to `tasks/project-bible-[acronym].md`
