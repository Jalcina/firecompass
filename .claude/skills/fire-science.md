---
name: fire-science
description: Expert knowledge on microgravity combustion science, fire behavior in space, and NASA experiment results. Use when explaining science to users or writing Claude prompts.
---

# Fire Science in Microgravity — Expert Knowledge

## Flame behavior by environment
| Environment | Gravity | O2% | Pressure | Flame shape | Temp | Mechanism |
|-------------|---------|-----|----------|-------------|------|-----------|
| Earth | 1g | 21% | 14.7 psi | Teardrop | ~2000K | Convection dominates |
| ISS | 0g | 21% | 14.7 psi | Sphere | ~1800K | Diffusion only |
| Moon Base | 0.16g | ~30% | ~10.2 psi | Unknown* | Unknown* | Partial gravity gap |
| Mars | 0.38g | ~0.13% | ~0.1 psi | Unknown* | - | Very low O2 |
| Spacesuit | 0g | 100% | 4.3 psi | Sphere | High | Extremely flammable |

*No experimental data exists yet — LUCI and FM2 missions will measure this.

## Why microgravity is dangerous for fire
1. No buoyancy → hot gases don't rise → flame feeds on itself
2. No convection → depleted O2 zone doesn't refresh → "cool flames" can persist undetected
3. Smoke doesn't rise → detectors designed for 1g may miss it
4. Suppression agents behave differently (CO2, helium dilution tested in FLEX)

## Key scientific findings from PSI data
- FLEX (PSI-69): CO2 and helium effectively suppress droplet flames in 0g
- BASS-II (PSI-25): Cotton/SIBAL fabric flammability increases with O2 concentration
- ACME CFI-G (PSI-159): "Cool flames" persist at conditions where normal flames extinguish — 272 tests up to 85% O2
- SAME-R (PSI-101): Standard ISS smoke detectors respond slower in microgravity (134 tests)
- SAFFIRE: Largest fires ever intentionally set in space — cotton/fiberglass panels

## Moon Base fire risk calculation
Earth baseline (21% O2, 14.7 psi) → Moon Base (30% O2, 10.2 psi):
- O2 increase: +43% → dramatically increases flammability limits
- Pressure decrease: -31% → partially offsets, but net effect is MORE dangerous
- Result: Materials safe on Earth may ignite on the Moon

## Scoring rubric for investigation relevance (0-100)
- Habitat match (Moon Base): 35 points
  - O2 ≥ 26.5%: +17.5 pts
  - Pressure ≤ 10.2 psi: +17.5 pts
- O2 within tested range: 25 points
- Safety area (prevention/detection/suppression): 20 points
- Airflow data present: 10 points
- Verified NASA source: 10 points

## Citation template for Claude responses
"Based on [Investigation Name] ([PSI-ID], DOI: [doi]), which conducted [N] tests under [conditions], the finding shows [result]. This is relevant to [environment] because [reason]."
