# FireCompass — NASA Space Apps Challenge 2026

## Proyecto
Dashboard web con IA para seguridad contra incendios en exploración espacial.
**Reto:** Flame in Freefall — PSI de NASA + Claude API.
**Hackathon:** Sevilla, Agencia Espacial Española, 14-15 Noviembre 2026.
**Equipo:** 2 personas. Premio objetivo: Best Use of Data + Most Inspirational.

## Frase del jurado (1 línea)
"FireCompass transforma 30 años de experimentos de combustión de la NASA en respuestas claras sobre qué arderá primero en una base lunar."

## Stack
- Next.js 16 + TypeScript + Tailwind CSS 4 + App Router (sin src/)
- Claude API: `claude-sonnet-4-6` para análisis, `claude-haiku-4-5-20251001` para tareas simples
- Anthropic SDK: `@anthropic-ai/sdk`
- Recharts para gráficas
- Deploy: Vercel (URL pública requerida para el jurado)

## Estructura
```
app/                    → páginas Next.js (App Router)
  page.tsx              → Home / Mission Briefing
  dashboard/page.tsx    → Dashboard principal
  ask/page.tsx          → Ask the Data (Claude chat)
  explorer/page.tsx     → Investigation Explorer
  simulator/page.tsx    → Environment Comparator
components/             → componentes React reutilizables
lib/
  psi.ts                → cliente API PSI de NASA
  ntrs.ts               → cliente API NTRS (papers)
  claude.ts             → wrapper Claude API con prompts
  investigations.ts     → datos de investigaciones PSI
data/
  investigations.json   → 20 investigaciones pre-procesadas con DOIs
  flex_data.csv         → PSI-69 FLEX: 274 tests de extinción
  bass_data.csv         → PSI-25 BASS-II: 129 tests sólidos ISS
scripts/
  fetch-psi.ts          → descarga metadata de PSI API
  analyze-frames.ts     → analiza frames de vídeo con Claude Vision
```

## APIs NASA disponibles
```
# PSI — metadata investigaciones (SIN autenticación)
GET https://psi.nasa.gov/geode-py/ws/repo/investigations/{accession}
# Ej: PSI-69, PSI-25, PSI-39, PSI-98, PSI-100, PSI-101, PSI-159

# PSI — búsqueda
GET https://psi.nasa.gov/geode-py/ws/repo/search?source=psi&type=investigation&size=50

# NTRS — papers (SIN autenticación, REST API real)
GET https://ntrs.nasa.gov/api/citations/search?q=microgravity+fire&rows=20

# Vídeos BASS-II (296 MP4s reales de llamas en ISS)
# Pattern: https://psi.ndc.nasa.gov/mpglobal/api/athena/file/{id}/?inline=1&log=1
# Primer vídeo (5.5 MB): https://psi.ndc.nasa.gov/mpglobal/api/athena/file/4435701/?inline=1&log=1
```

## Investigaciones PSI clave (con DOIs)
| ID | Nombre | DOI | Filas | Relevancia |
|----|--------|-----|-------|------------|
| PSI-25 | BASS-II | 10.60555/4qc4-de67 | 129 | Sólidos en ISS, alta |
| PSI-26 | BASS | 10.60555/58h4-dy80 | - | Sólidos en ISS |
| PSI-69 | FLEX | 10.60555/mbq8-0451 | 274 | Extinción líquidos, alta |
| PSI-68 | FLEX-2 | 10.60555/byp8-h018 | - | Extinción extendida |
| PSI-39 | CFI | 10.60555/m6pj-a914 | 146 | Cool flames |
| PSI-98 | SAFFIRE-I | - | - | Fuego nave real |
| PSI-99 | SAFFIRE-II | - | - | Fuego nave real |
| PSI-100 | SAFFIRE-III | - | - | Telemetría fuego |
| PSI-101 | SAME-R | - | 134 | Detectores humo ISS |
| PSI-102 | SAME | - | - | Humo microgravedad |
| PSI-159 | ACME CFI-G | 10.60555/cyt1-kh64 | 272 | hasta 85% O2 — crítico Luna |
| PSI-20 | ACME BRE | 10.60555/vb93-3y72 | - | Tasa combustión |

## Contexto científico (imprescindible para prompts)
- **Tierra:** 21% O2, 14.7 psi, 1g — referencia
- **ISS:** 21% O2, 14.7 psi, 0g — sin convección, llamas esféricas azules
- **Base Lunar:** ~30% O2, ~10.2 psi, 0.16g — 40% más inflamable que Tierra
- **Marte:** ~0.13% O2 ambiente, presión baja, 0.38g
- **Traje espacial:** 100% O2, 4.3 psi — extremadamente inflamable
- **GAP crítico:** NO existe ningún dato experimental de gravedad parcial (Luna/Marte)
- **LUCI y FM2** son las futuras misiones que medirán esto
- **Llama en microgravedad:** esférica, azul, ~1800K, difusión pura (sin convección)
- **Llama en 1g:** teardrop, amarilla/naranja, ~2000K, convección dominante

## Reglas de desarrollo
1. SIEMPRE citar PSI ID + DOI en cualquier dato científico que se muestre
2. NUNCA inventar datos — solo usar lo que viene de PSI/NTRS
3. Marcar explícitamente qué es "medido" vs "predicho" vs "estimado"
4. UI accesible para no-especialistas (profesores, estudiantes, prensa, jurados)
5. Mobile responsive en todo momento
6. Respuestas de Claude deben incluir citas a investigaciones específicas
7. Componentes en PascalCase, funciones en camelCase
8. Tailwind para estilos, sin CSS modules

## Variables de entorno requeridas
```
ANTHROPIC_API_KEY=     # console.anthropic.com
BRAVE_SEARCH_API_KEY=  # brave.com/search/api (2000 gratis/mes)
```

## Comandos útiles
```bash
npm run dev          # desarrollo local → http://localhost:3000
npm run build        # build producción
npm run type-check   # tsc sin emit
npx ts-node scripts/fetch-psi.ts   # descargar datos PSI
npx ts-node scripts/analyze-frames.ts  # analizar frames con Claude Vision
```

## Criterios del jurado (5 pesos iguales)
- Impact: puede salvar vidas reales en misiones Luna/Marte
- Creativity: Claude Vision sobre vídeos NASA + diseño profesional
- Validity: datos citados con PSI ID + DOI + número de filas
- Relevance: usa exactamente los datasets del challenge
- Presentation: URL Vercel funcional + demo video 2 min

## Setup en portátil (hackathon)
```bash
git clone <repo-url>
cd firecompass
npm install
cp .env.example .env.local
# Rellenar ANTHROPIC_API_KEY y BRAVE_SEARCH_API_KEY
npm run dev
```
