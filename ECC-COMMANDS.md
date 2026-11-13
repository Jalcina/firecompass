# ECC — Referencia de comandos para FireCompass

Todos los comandos disponibles organizados por situación.
Claude los conoce automáticamente — puedes pedírselos por nombre o usarlos tú directamente.

---

## Los 6 que más vas a usar en el hackathon

| Comando | Cuándo usarlo |
|---|---|
| `/plan` | Antes de empezar cualquier feature nueva |
| `/react-build` | Cuando Next.js da un error de build |
| `/build-fix` | Error de build general (no específico de React) |
| `/react-review` | Después de escribir un componente React/TSX |
| `/code-review` | Revisión general de código |
| `/save-session` | Cada 45 min para no perder contexto |
| `/resume-session` | Al volver de un descanso o nueva sesión |

---

## Planificación y features

| Comando | Qué hace |
|---|---|
| `/plan` | Genera un plan paso a paso antes de tocar código. Espera tu confirmación antes de ejecutar |
| `/plan [descripción]` | Plan para una feature específica: `/plan página comparador de entornos` |
| `/feature-dev` | Desarrollo guiado: primero entiende el código existente, luego construye |
| `/prp-plan [descripción]` | Plan más detallado con análisis del codebase |
| `/prp-implement [archivo]` | Ejecuta un plan ya creado con validaciones |
| `/orch-add-feature` | Feature completa end-to-end: research → plan → TDD → review → commit |
| `/orch-build-mvp` | Construye un MVP completo desde un doc de diseño/spec |

**Para FireCompass usar:**
```
/plan construir la página del comparador de entornos con Tierra, ISS, Luna y Marte
```

---

## Cuando algo se rompe

| Comando | Qué hace |
|---|---|
| `/react-build` | Arregla errores de build de Next.js, Vite, hydration, server/client boundaries |
| `/build-fix` | Detecta el sistema de build y arregla errores de compilación/tipos |
| `/orch-fix-defect` | Bug concreto: reproduce como test fallido → arregla → confirma verde |

**Para FireCompass usar primero `/react-build`** (es específico de Next.js).

---

## Revisión de código

| Comando | Qué hace |
|---|---|
| `/react-review` | Revisa componentes React: hooks, rendimiento, server/client, accesibilidad |
| `/code-review` | Revisión general de cambios locales o PR de GitHub |
| `/code-review [número PR]` | Revisa un PR específico de GitHub |
| `/security-scan` | Detecta secrets expuestos, SSRF, injection, API keys en el código |
| `/quality-gate` | Comprueba formato y calidad de un archivo concreto |

**Antes de hacer deploy a Vercel ejecuta `/security-scan`** — evita subir la API key accidentalmente.

---

## Gestión de sesión (crítico en hackathon)

| Comando | Qué hace |
|---|---|
| `/save-session` | Guarda el estado actual de la sesión en `~/.claude/session-data/` |
| `/resume-session` | Carga la última sesión guardada con todo el contexto |
| `/checkpoint` | Crea un checkpoint de verificación del estado actual |
| `/learn` | Extrae patrones útiles de la sesión y los guarda como skills reutilizables |

**Rutina recomendada en el hackathon:**
- Cada 45 minutos: `/save-session`
- Al volver de descanso o nueva terminal: `/resume-session`
- Al acabar una feature importante: `/checkpoint`

---

## Orquestación avanzada (para features complejas)

| Comando | Qué hace |
|---|---|
| `/orch-add-feature` | Feature nueva end-to-end con TDD y code review integrado |
| `/orch-fix-defect` | Arregla un bug con test de regresión automático |
| `/orch-build-mvp` | MVP completo desde un spec/doc |
| `/orch-review` | Code review multi-agente con verificación adversarial |
| `/orch-change-feature` | Modifica una feature existente de forma controlada |
| `/orch-refine-code` | Refina y mejora código ya existente |

**Para FireCompass usar cuando quieras una feature sólida:**
```
/orch-add-feature construir el chat Ask the Data con citations a PSI IDs
```

---

## Tests y calidad

| Comando | Qué hace |
|---|---|
| `/react-test` | Genera y ejecuta tests para componentes React |
| `/test-coverage` | Analiza cobertura de tests del proyecto |
| `/refactor-clean` | Detecta y elimina código muerto de forma segura |

---

## Utilidades

| Comando | Qué hace |
|---|---|
| `/cost-report` | Muestra cuánto has gastado en la API de Anthropic |
| `/cost-report csv` | Exporta el reporte de costes a CSV |
| `/update-docs` | Sincroniza la documentación desde los archivos fuente |
| `/ecc-guide` | Guía completa de ECC dentro de Claude |

---

## Cómo pedirle a Claude que use un comando

No tienes que escribir el comando tú mismo. Puedes decírselo en lenguaje natural:

```
Antes de construir esto, haz un plan
→ Claude ejecuta /plan automáticamente

Revisa el componente que acabas de escribir
→ Claude ejecuta /react-review

El build está fallando, arréglalo
→ Claude ejecuta /react-build

Guarda la sesión antes de que nos vayamos
→ Claude ejecuta /save-session
```

---

## Comandos que NO necesitas en este hackathon

Estos existen en ECC pero no son relevantes para FireCompass:
`/cpp-build`, `/go-build`, `/rust-build`, `/kotlin-build`, `/flutter-build` — son para otros lenguajes
`/marketing-campaign`, `/jira`, `/epic-*` — gestión de proyectos empresariales
`/multi-plan` — requiere runtime externo no instalado
`/santa-loop` — Easter egg de ECC
