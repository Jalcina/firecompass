# FireCompass — NASA Space Apps Challenge 2026

## Proyecto
Dashboard web con IA para seguridad contra incendios en exploración espacial.
**Reto:** Flame in Freefall — "SI-Powered Fire Safety Insights from Microgravity Combustion Data"
**Objetivo oficial del reto:** Construir un dashboard que resuma, clasifique y explique décadas de resultados de combustión en microgravedad de NASA para informar la seguridad contra incendios en misiones a la Luna y Marte.
**Hackathon:** Sevilla, Agencia Espacial Española, 14-15 Noviembre 2026. Tema: "The Next Frontier".
**Equipo:** 2 personas. Premio objetivo: Best Use of Data + Most Inspirational.

## Audiencia objetivo (según el reto oficial)
Profesores, estudiantes de posgrado, investigadores y ingenieros aeroespaciales.
La app debe hacer accesibles datos complejos a todos estos perfiles — no solo a expertos.

## Tres dominios de seguridad contra incendios en el espacio
El reto organiza las investigaciones en estas 3 áreas — úsalas para estructurar la UI:
- **Prevención** — selección de materiales, control de fuentes de ignición (BASS, BASS-II, FLEX, ACME)
- **Detección** — medición de humo y aerosoles (SAME, SAME-R, DAFT, DAFT-2)
- **Supresión** — técnicas de dilución con CO2 y helio (FLEX, Cool Flames)

## Incidentes históricos reales (usar en la demo — criterio Impact)
Estos incidentes son reales y los jueces los reconocerán. Úsalos para contextualizar por qué esto importa:
- **Apollo 1 (1967)** — incendio en tierra mató a 3 astronautas en cabina con 100% O2
- **Apollo 13 (1970)** — explosión del tanque de oxígeno en tránsito lunar
- **Mir (1997)** — incendio por generador de oxígeno a bordo de la estación
- **Artemis II (reciente)** — alarma de humo a ~80.000 millas de la Tierra

## Aplicaciones derivadas en la Tierra (criterio Impact + Storytelling)
La investigación de combustión espacial ya ha generado beneficios terrestres:
- Tanques de aire para bomberos (spinoff directo de trajes espaciales)
- Detectores de humo modernos (tecnología derivada de SAME)
- Ropa ignífuga de protección

## Objetivos específicos del dashboard (según el reto oficial)
1. Identificar investigaciones relevantes para naves, estaciones, bases lunares, superficies marcianas y rovers presurizados
2. Extraer datos de modelado predictivo para predicciones de inflamabilidad y escenarios de incendio
3. Destacar investigación que informe el desarrollo de equipos de seguridad de nueva generación

## Atributos a resumir por investigación (según el reto oficial)
Para cada investigación mostrar: objetivos experimentales, tipos de combustible (formas, tamaños, especificaciones), condiciones de prueba (concentración O2, velocidad de flujo de aire), diferencias entre variables dentro de la investigación, tipos de sensores y metodologías de medición.

## Misiones futuras relevantes
- **LUCI** (Lunar-g Combustion Investigation) — medirá combustión en gravedad parcial lunar por primera vez
- **FM2** (Flammability of Materials on the Moon) — inflamabilidad de materiales en la Luna
Mención clave: hoy NO existen datos experimentales de gravedad parcial — LUCI y FM2 son el futuro que FireCompass está preparando.

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

## ECC — Comandos disponibles
Ver ECC-COMMANDS.md para la referencia completa. Los más importantes:
- `/plan` — antes de cada feature
- `/react-build` — cuando falla el build de Next.js
- `/react-review` — después de escribir componentes
- `/code-review` — revisión general
- `/save-session` / `/resume-session` — guardar y recuperar contexto cada 45 min
- `/security-scan` — antes de hacer deploy
- `/orch-add-feature` — feature completa end-to-end con TDD

## Comandos útiles
```bash
npm run dev          # desarrollo local → http://localhost:3000
npm run build        # build producción
npm run type-check   # tsc sin emit
npx ts-node scripts/fetch-psi.ts   # descargar datos PSI
npx ts-node scripts/analyze-frames.ts  # analizar frames con Claude Vision
```

## Criterios del jurado — RÚBRICA OFICIAL (escala 1-5, pesos iguales)

### Impact (puntuación 5 — Outstanding Impact)
"Demuestra impacto excepcional, aborda un problema significativo con soluciones propuestas. Su alcance es extenso, inspira, beneficia a una audiencia amplia, o podría cambiar el mundo."
→ FireCompass: vidas reales en Luna/Marte, spinoffs terrestres (bomberos, detectores de humo), 30 años de datos NASA accesibles por primera vez

### Creativity (puntuación 5 — Highly Creative and Innovative)
"Presenta un enfoque revolucionario que nunca ha sido intentado antes. Desafía métodos convencionales, presenta una solución original e inventiva que destaca en su campo."
→ FireCompass: Claude Vision sobre vídeos reales de llamas en ISS + dashboard interactivo único — no existe nada igual en acceso público a datos PSI

### Validity (puntuación 5 — Highly Valid and Feasible)
"Científicamente sólido y técnicamente factible. Totalmente desarrollado y listo para implementación en el mundo real, altamente usable y accesible."
→ FireCompass: datos reales de NASA con PSI ID + DOI + número de filas, marcar siempre "medido" vs "predicho"

### Relevance (puntuación 5 — Highly Relevant and Strong NASA Data Integration)
"Comprometido profundamente con el challenge. Los datos NASA son INTEGRALES al éxito del proyecto — no una adición superficial."
→ FireCompass: PSI API como backend real, DOIs citados en cada dato, investigations.json como core del dashboard

### Presentation (puntuación 5 — Exceptional Communication and Storytelling)
"Presentación bien estructurada y convincente, articula claramente el challenge, la solución propuesta y la importancia del proyecto. Storytelling atractivo."
→ FireCompass: URL Vercel pública + demo video 30s con estructura oficial (ver abajo)

## Demo — Requisitos oficiales OBLIGATORIOS
- **Formato:** Video de 30 segundos O slide deck de máximo 7 slides (incluye portada e intro)
- **Idioma:** Inglés obligatorio. Excepción: vídeo puede ser en otro idioma CON subtítulos en inglés
- **Hosting:** Subir a YouTube/Drive/GitHub — URL pública sin login ni contraseña
- **Si excedes estos límites → NO elegible para Global Judging**

### Estructura del vídeo de 30 segundos (seguir este guión)
- [0:00] Preséntate: nombre y equipo
- [0:02] Lead us in: ¿qué challenge aborda? ¿qué os inspiró?
- [0:05] Nombre del proyecto y tagline
- [0:10] Describe la idea: cómo funciona, qué hace, cómo los datos NASA lo hacen posible
- [0:20-0:30] Look into the future: ¿qué impacto tendrá? ¿cómo cambia el mundo?

### Si haces slide deck (7 slides)
Incluir obligatoriamente: nombre del equipo, nombres de miembros, challenge seleccionado.
Usar imágenes fuertes del dashboard. Mostrar cómo los datos NASA hacen posible la solución.

## Formulario de proyecto — Campos que rellenarás en spaceappschallenge.org
El jurado evalúa este formulario. Preparar respuestas de antemano:
1. **Project Name:** FireCompass
2. **High-Level Summary:** ¿Qué desarrollaste? ¿Cómo aborda el challenge? ¿Por qué importa?
3. **Link to Project Demo:** URL pública (YouTube o Google Drive) del vídeo de 30s
4. **Link to Final Project:** URL de Vercel (pública, sin login)
5. **Detailed Description:** qué hace, cómo funciona, beneficios, herramientas usadas (Next.js, Claude API, PSI API)
6. **Use of SI (Super Intelligence):** Declarar uso de Claude — es obligatorio. Citar que el código fue generado/asistido con Claude Code + Claude API como feature del producto
7. **NASA Data:** PSI API (psi.nasa.gov/geode-py/ws), NTRS API, datasets PSI-25, PSI-69, PSI-39, PSI-98, PSI-101, PSI-159 con sus DOIs
8. **References:** Listar todos los recursos externos usados

**IMPORTANTE:** Puedes guardar y volver a enviar tantas veces como quieras hasta las 23:59 del 15 Nov. Solo se revisa la última versión enviada.

## 10 Premios Globales — Objetivos de FireCompass
- **Best Use of Data** ← OBJETIVO PRINCIPAL: "El proyecto que mejor hace accesibles los datos espaciales o los aprovecha de forma única"
- **Most Inspirational** ← OBJETIVO SECUNDARIO: "El proyecto que captura nuestros corazones"
- Best Use of Science: mejor uso del método científico
- Best Use of Technology: uso más innovador de tecnología
- Galactic Impact: mayor potencial para mejorar la vida en la Tierra o el universo
- Best Mission Concept: concepto y diseño más plausible
- Best Storytelling Award: comunica mejor el potencial de open data
- Global Connection Award: conecta mejor a personas a través de tecnología
- Art & Technology Award: combina más efectivamente habilidades técnicas y creativas
- Local Impact Award: mayor potencial en la comunidad local

**Para Best Use of Data:** mostrar en la UI qué fuentes PSI se usan y cuántas filas de datos.
**Para Most Inspirational:** conectar los datos con historias humanas reales (Apollo 1, bomberos, Artemis II).

## Timeline del jurado (post-hackathon)
- **15 Nov 2026 23:59** — Cierre de entregas (hora local Sevilla)
- **3 Dic 2026** — Anuncio de Global Nominees
- **17 Dic 2026** — Anuncio de Global Finalists + Honorable Mentions
- **26 Ene 2027** — Anuncio de Global Winners

## SI (Super Intelligence) — Reglas de divulgación
El uso de Claude está permitido y es obligatorio declararlo:
- En la descripción del proyecto: indicar que el código fue asistido con Claude Code
- En la feature "Ask the Data": indicar que usa Claude API
- NO usar imágenes generadas por IA sin watermark visible
- El campo "Use of SI" en el formulario NO lo ven los jueces directamente — es para datos internos de NASA
- Los jueces SÍ verán indicadores de SI dentro del proyecto en sí

## Logística del hackathon — Reglas críticas

**Tema 2026:** "The Next Frontier" — de tu patio trasero a los confines del universo.

**Project Tab abre el 14 Nov a las 9:00 a.m. (hora local).** Antes de esa hora no puedes editar la página del proyecto. Es la página que ven los jueces — rellenarla bien es tan importante como la app.

**Elegibilidad para premios:** Todos los miembros del equipo deben ser participantes confirmados del mismo Local Event (Sevilla). Si alguien está en lista de espera, contactar al Local Lead antes del hackathon.

**Space Apps Connect** = GitHub Discussions en `github.com/nasa/spaceapps`
- Para preguntas sobre el reto: categoría "Challenges" + filtrar por label "Flame in Freefall"
- Para buscar compañeros: categoría "Find A Team"
- Para herramientas gratis: categoría "Global Offers" (recursos y créditos de partners)
- Anuncios del GO Team: categoría "Announcements" (revisar frecuentemente)
- Para problemas de envío: categoría "Project Submission Help"

## Setup en portátil (hackathon)
```bash
git clone <repo-url>
cd firecompass
npm install
cp .env.example .env.local
# Rellenar ANTHROPIC_API_KEY y BRAVE_SEARCH_API_KEY
npm run dev
```

## Estrategia de build — orden de prioridad

**IMPORTANTE:** La mayoría de la app usa datos estáticos de `data/investigations.json`.
La API de Anthropic solo es necesaria para las funciones de IA en tiempo real.

### Fase 1 — Sin API key (construir primero)
Todo esto usa datos de `investigations.json` y no llama a ninguna API:
1. `app/page.tsx` — Home: frase del jurado, misión del proyecto, CTA al dashboard
2. `app/simulator/page.tsx` — Comparador Tierra / ISS / Luna / Marte (datos hardcodeados en CLAUDE.md)
3. `app/explorer/page.tsx` — Las 20 investigaciones NASA con DOIs, hallazgos, relevancia lunar
4. `app/dashboard/page.tsx` — Vista general con métricas y acceso a las secciones

### Fase 2 — Con API key (añadir después)
Requiere `ANTHROPIC_API_KEY` en `.env.local`:
5. `app/ask/page.tsx` — Chat: el usuario pregunta, Claude responde citando PSI IDs en tiempo real
6. *(opcional)* Análisis de frames de vídeo con Claude Vision

### Fase 3 — Bonus visual (solo si sobra tiempo)
Solo intentar si Fase 1 + Fase 2 están completas y desplegadas antes de las 15:00 del domingo:
7. Llama 3D animada en el comparador de entornos — mostrar visualmente la diferencia entre llama terrestre (teardrop, naranja) y llama en microgravedad (esférica, azul)
   - Librería: React Three Fiber (`@react-three/fiber` + `@react-three/drei`)
   - Colocarla dentro de `app/simulator/page.tsx` como componente visual
   - Si no funciona bien en 1 hora → revertir, no vale la pena

### Regla
Construye la Fase 1 completa y despliega en Vercel antes de tocar la Fase 2.
Una app funcional sin chat vale más que una app rota con chat.
