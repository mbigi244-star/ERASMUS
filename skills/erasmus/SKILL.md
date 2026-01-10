---
name: erasmus
description: "Convert Project Bible to wniosek.json format for ERASMUS autonomous agent. Use when you have a Project Bible and need to convert it to JSON for autonomous section writing. Triggers on: convert project bible, create wniosek.json, erasmus json format."
---

# ERASMUS Application Converter

Converts Project Bible to `wniosek.json` format for autonomous KA210 application writing.

---

## The Job

Take a Project Bible (markdown file) and convert it to `wniosek.json` for the ERASMUS agent loop.

---

## Output Format

```json
{
  "projekt": {
    "tytul": "[Project Title]",
    "tytul_en": "[English Title]",
    "akronim": "[ACRONYM]",
    "temat": "[Topic]",
    "priorytet_glowny": "[Main Priority]",
    "priorytety_dodatkowe": ["[Additional priorities]"],
    "czas_trwania_miesiace": 17,
    "budzet": 60000,
    "data_rozpoczecia": "2026-09-01",
    "data_zakonczenia": "2028-01-31",
    "sektor": "[ADU/SCH/VET/YOU/SPO]"
  },
  "wnioskodawca": {
    "nazwa": "[Name]",
    "akronim": "[Acronym]",
    "kraj": "Poland",
    "miasto": "[City]",
    "ekspertyza": "[Expertise]",
    "rola": "[Role]",
    "aktywa": "[Unique assets]"
  },
  "partner_1": {
    "nazwa": "[Name]",
    "kraj": "[Country]",
    "ekspertyza": "[Expertise]",
    "rola": "[Role]",
    "aktywa": "[Unique assets]",
    "newcomer": true/false
  },
  "strategia": {
    "grupa_docelowa": "[CONCRETE target groups from analysis]",
    "liczba_uczestnikow": [number],
    "problem_glowny": "[Main problem with data]",
    "rozwiazanie": "[Solution]",
    "innowacja": "[4D innovation: APPROACH/TECHNOLOGY/ACCESSIBILITY/MEASUREMENT]",
    "wartosc_dodana_eu": "[EU added value]",
    "synergia": "[Synergy logic]",
    "przewaga_konkurencyjna": "[Competitive advantage 200-300 chars]"
  },
  "logframe": [
    {
      "id": 1,
      "cel": "[SMART objective]",
      "aktywnosc": "[Activity name]",
      "output": "[Concrete output]",
      "rezultat": "[Expected result]",
      "kpi": "[Measurable KPI]"
    }
  ],
  "budzet_alokacja": {
    "zarzadzanie": {"kwota": [amount], "procent": [%], "opis": "[description]"},
    "aktywnosc_1": {"nazwa": "[name]", "kwota": [amount], "procent": [%]},
    "aktywnosc_2": {"nazwa": "[name]", "kwota": [amount], "procent": [%]},
    "upowszechnianie": {"kwota": [amount], "procent": [%], "opis": "[description]"}
  },
  "harmonogram": [
    {"faza": "[Phase]", "miesiace": "[M1-MX]", "aktywnosci": "[activities]", "produkty": "[deliverables]"}
  ],
  "sekcje": [
    {
      "id": "B2.1",
      "tytul": "Objectives & Outcomes",
      "limit": 3000,
      "priorytet": 1,
      "ukonczona": false,
      "tresc": "",
      "notatki": ""
    }
  ]
}
```

---

## Section Structure

The `sekcje` array must include ALL form sections in correct order:

### B2. Project Description (6 sections x 3000 chars)
| ID | Title | Priority |
|----|-------|----------|
| B2.1 | Objectives & Outcomes | 1 |
| B2.2 | Target Groups & Needs | 2 |
| B2.3 | Motivation & Funding | 3 |
| B2.4 | Addressing Needs & Goals | 4 |
| B2.5 | Transnational Benefits | 5 |
| B2.6 | Horizontal Aspects | 6 |

### B3. Participating Organisations (4 fields x 1000 chars each)
| ID | Title | Priority |
|----|-------|----------|
| B3.APP | Applicant Organisation Description | 7 |
| B3.P1 | Partner 1 Organisation Description | 8 |
| B3.P2 | Partner 2 Organisation Description | 9 (if applicable) |

### B4. Cooperation Arrangements (4 sections x 3000 chars)
| ID | Title | Priority |
|----|-------|----------|
| B4.1 | Partnership Formation & Strengths | 10 |
| B4.2 | Project Management & Communication | 11 |
| B4.3 | Use of Erasmus+ Platforms | 12 |
| B4.4 | Tasks & Responsibilities | 13 |

### B5. Activities (5 fields per activity)
| ID | Title | Priority |
|----|-------|----------|
| B5.A1 | Activity 1: [Name] | 14 |
| B5.A2 | Activity 2: [Name] | 15 |
| B5.A3 | Activity 3: [Name] | 16 |
| B5.A4 | Activity 4: [Name] | 17 |

Each activity has 5 fields (Content 2000, Target 2000, Link 2000, Results 2000, Budget 4000).

### B6. Impact and Follow-up (3 sections x 3000 chars)
| ID | Title | Priority |
|----|-------|----------|
| B6.1 | Measuring Achievement | 18 |
| B6.2 | Long-term Development & Sustainability | 19 |
| B6.3 | Dissemination & Communication | 20 |

### B7. Project Summary (3 fields x 500 chars x 2 languages)
| ID | Title | Priority |
|----|-------|----------|
| B7.PL | Project Summary (Polish) | 21 |
| B7.EN | Project Summary (English) | 22 |

---

## Critical Requirements

### 1. Concrete Target Groups

From Project Bible analysis, NOT generic terms.

**WRONG:**
```json
"grupa_docelowa": "young people aged 18-25"
```

**RIGHT:**
```json
"grupa_docelowa": "Youth from Warsaw High School No. 14, grades 2-3, 60 students, 'Digital Skills' program (2024)"
```

### 2. Budget Sum = 60,000 EUR

All amounts in `budzet_alokacja` must sum to exactly 60,000 EUR.

### 3. LogFrame Consistency

Each objective in `logframe` must have corresponding activity in `budzet_alokacja`.

### 4. All Sections Start False

All sections must have `"ukonczona": false` initially.

### 5. Priority Order

Sections must be ordered by dependency (Project Description -> Organisations -> Cooperation -> Activities -> Impact -> Summary).

---

## Conversion Rules

1. Extract all data from Project Bible
2. Map to JSON structure
3. Create section entries for each form field
4. Set all sections to `ukonczona: false`
5. Preserve CONCRETE target groups exactly
6. Verify budget sums to 60,000
7. Save to `wniosek.json`

---

## Archiving Previous Runs

Before writing new `wniosek.json`, check if exists with different project:

1. Read current `wniosek.json` if exists
2. Check if `projekt.akronim` differs
3. If different AND `postep.txt` has content:
   - Create archive folder: `archive/YYYY-MM-DD-[acronym]/`
   - Copy current `wniosek.json` and `postep.txt`
   - Reset `postep.txt`

---

## Checklist Before Saving

- [ ] All data extracted from Project Bible
- [ ] Target groups are CONCRETE (names, numbers)
- [ ] Budget sums to exactly 60,000 EUR
- [ ] All sections created with correct limits
- [ ] Priority order is logical
- [ ] All sections have `ukonczona: false`
- [ ] LogFrame objectives match activities
- [ ] Previous run archived if different project
- [ ] Saved to `wniosek.json`
