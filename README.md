# ERASMUS - Autonomiczny Agent do Pisania Wniosków KA210

![ERASMUS](ralph.webp)

ERASMUS to autonomiczna petla agenta AI, ktora pomaga pisac wnioski o dofinansowanie w programie Erasmus+ KA210 (Male Partnerstawa). Agent iteracyjnie pracuje nad kolejnymi sekcjami wniosku, zachowujac spojnosc i zgodnosc z wytycznymi programu.

Bazuje na wzorcu [Ralph](https://ghuntley.com/ralph/) autorstwa Geoffrey'a Huntley'a.

## Cel: 90-100 punktow (nie minimum 60!)

Minimalny prog 60 punktow to jedynie wymog wstepny. Finansowanie otrzymuja wnioski z wynikiem 85-100 punktow. Ten system pomoze Ci osiagnac maksymalny wynik.

## Kryteria oceny

| Kryterium | Max punktow | Min punktow |
|-----------|-------------|-------------|
| RELEVANCE (Adekwatnosc) | 30 | 15 |
| QUALITY (Jakosc projektu) | 30 | 15 |
| PARTNERSHIP (Jakosc partnerstwa) | 20 | 10 |
| IMPACT (Wplyw) | 20 | 10 |
| **RAZEM** | **100** | **60** |

## Wymagania

- [Amp CLI](https://ampcode.com) zainstalowany i skonfigurowany
- `jq` zainstalowany (`brew install jq` na macOS, `apt install jq` na Linux)
- Repozytorium git dla projektu

## Workflow - Krok po Kroku

### KROK 0: Analiza organizacji i generowanie Project Bible

```
# 0.0 - Analiza stron organizacji (OBOWIAZKOWA)
Zaladuj skill prd i przeanalizuj strony: [URL_WNIOSKODAWCY], [URL_PARTNERA]

# 0.1 - Matchmaker i propozycje tematow
Zaladuj skill prd i wygeneruj 3 propozycje tematow na podstawie PIF

# 0.2 - Generowanie Project Bible
Wybieram OPCJE [A/B/C] - wygeneruj pelny Project Bible
```

### KROK 1: Konwersja na format ERASMUS

```
Zaladuj skill erasmus i przekonwertuj Project Bible na wniosek.json
```

### KROK 2: Uruchom ERASMUS

```bash
./erasmus.sh [max_iteracji]
```

Domyslnie: 15 iteracji.

## Struktura wniosku KA210

Agent pracuje nad nastepujacymi sekcjami:

### B2. PROJECT DESCRIPTION (6 pol x 3000 znakow)

| ID | Sekcja | Limit |
|----|--------|-------|
| 2.1 | Objectives & Outcomes | 3000 |
| 2.2 | Target Groups & Needs | 3000 |
| 2.3 | Motivation & Funding | 3000 |
| 2.4 | Addressing Needs & Goals | 3000 |
| 2.5 | Transnational Benefits | 3000 |
| 2.6 | Horizontal Aspects (wszystkie 4!) | 3000 |

### B3. PARTICIPATING ORGANISATIONS (4 pola x 1000 znakow)

| Pole | Limit |
|------|-------|
| Present your organisation | 1000 |
| Main activities | 1000 |
| Activities in application field | 1000 |
| Learner profiles & age groups | 1000 |

### B4. COOPERATION ARRANGEMENTS (4 pola x 3000 znakow)

| ID | Sekcja | Limit |
|----|--------|-------|
| 4.1 | Partnership Formation & Strengths | 3000 |
| 4.2 | Project Management & Communication | 3000 |
| 4.3 | Use of Erasmus+ Platforms | 3000 |
| 4.4 | Tasks & Responsibilities | 3000 |

### B5. ACTIVITIES (5 pol na aktywnosc)

| Pole | Limit |
|------|-------|
| Content description | 2000 |
| Target group | 2000 |
| Link to objectives | 2000 |
| Expected results | 2000 |
| Budget justification | 4000 |

### B6. IMPACT AND FOLLOW-UP (3 pola x 3000 znakow)

| ID | Sekcja | Limit |
|----|--------|-------|
| 6.1 | Measuring Achievement | 3000 |
| 6.2 | Long-term Development & Sustainability | 3000 |
| 6.3 | Dissemination & Communication | 3000 |

### B7. PROJECT SUMMARY (3 pola x 500 znakow x 2 jezyki)

## Kluczowe pliki

| Plik | Przeznaczenie |
|------|---------------|
| `erasmus.sh` | Glowny skrypt uruchamiajacy petle agenta |
| `prompt.md` | Instrukcje dla kazdej iteracji agenta |
| `wniosek.json` | Sekcje wniosku ze statusem ukonczenia |
| `wniosek.json.example` | Przykladowy format wniosku |
| `postep.txt` | Notatki i kontekst dla kolejnych iteracji |
| `Matryca_KA210_EN.md` | Struktura referencyjna LogFrame |
| `skills/prd/` | Skill do analizy i generowania Project Bible |
| `skills/erasmus/` | Skill do konwersji na format JSON |

## Krytyczne zasady

### Limit znakow: 90-95%

Kazde pole musi byc wypelnione w **90-95%** dostepnego limitu. Puste miejsce = utracone punkty!

- Cel: 2700-2850 znakow dla pola 3000
- Minimum: 2400 znakow (80%) - ponizej = strata punktow

### Wszystkie 4 aspekty horyzontalne (OBOWIAZKOWE)

1. **INCLUSION & DIVERSITY** - Wlaczenie i roznorodnosc
2. **ENVIRONMENTAL SUSTAINABILITY** - Zrownowaozny rozwoj
3. **DIGITAL DIMENSION** - Wymiar cyfrowy
4. **PARTICIPATION & CIVIC ENGAGEMENT** - Uczestnictwo obywatelskie

### Konkretne grupy docelowe

NIE pisz: "mlodzi ludzie", "studenci"
PISZ: "Mlodziez z Liceum nr 3 w Warszawie, klasy 2-3, 50 uczniow, program 'Kompetencje Cyfrowe'"

### SMART Objectives

Kazdy cel musi byc:
- **S**pecific (Konkretny)
- **M**easurable (Mierzalny)
- **A**chievable (Osiagalny)
- **R**elevant (Istotny)
- **T**ime-bound (Okreslony w czasie)

## Red Flags - Bledy odrzucajace wniosek

### Bledy formalne (= automatyczne odrzucenie)
- Zlozenie po terminie
- Brak OID partnera
- Mniej niz 2 organizacje z 2 roznych krajow
- Aktywnosci poza krajami partnerskimi
- Brak podpisu osoby upowaznionej

### Bledy merytoryczne (= niski wynik)
- Brak powiazania z priorytetami
- Generyczne cele (bez liczb)
- Brak danych o potrzebach
- Niejasna metodologia
- Brak aspektow horyzontalnych
- Pasywni partnerzy
- Brak wskaznikow (KPI)
- Slabe upowszechnianie

## Debugowanie

```bash
# Zobacz status sekcji
cat wniosek.json | jq '.sekcje[] | {id, tytul, ukonczona}'

# Zobacz notatki z poprzednich iteracji
cat postep.txt

# Sprawdz historie git
git log --oneline -10
```

## Referencje

- [Przewodnik po programie Erasmus+](https://erasmus-plus.ec.europa.eu/programme-guide/erasmusplus-programme-guide)
- [Formularz wniosku KA210](https://webgate.ec.europa.eu/app-forms/af-ui-opportunities/)
- [Geoffrey Huntley's Ralph pattern](https://ghuntley.com/ralph/)
