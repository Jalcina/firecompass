# FireCompass — Guía de setup para el hackathon

Guía completa para llegar al hackathon y trabajar con Claude Code + ECC desde cero.

---

## Antes de empezar: ¿qué es ECC y por qué lo usamos?

**ECC** (Everything Claude Code) es el sistema que montó Affaan Mustafa para ganar el hackathon de Anthropic. Convierte Claude Code en un equipo de agentes especializados:

- **71 agentes** — cada uno experto en algo: planificar, revisar código TypeScript/React, resolver errores de build, hacer testing...
- **314 skills** — flujos de trabajo que Claude ejecuta paso a paso
- **Comandos rápidos** — `/tdd`, `/code-review`, `/build-fix`, `/ecc:plan`
- **Hooks automáticos** — detectan problemas sin que los pidas

**El repo de FireCompass** añade encima el contexto específico del hackathon: qué es el proyecto, los datos de la NASA, qué criterios valoran los jueces, cómo citar investigaciones PSI.

Los dos juntos = trabajas como si tuvieras un equipo completo.

---

## Paso 1 — Requisitos previos

Necesitas tener instalado:

```bash
node --version   # necesitas v18 o superior
npm --version    # viene con Node
```

Si no tienes Node: https://nodejs.org (descarga la versión LTS)

Necesitas también **Claude Code**:

```bash
npm install -g @anthropic-ai/claude-code
```

---

## Paso 2 — Clonar el repositorio

```bash
git clone https://github.com/Jalcina/firecompass.git
cd firecompass
```

---

## Paso 3 — Instalar ECC (una sola vez en tu máquina)

```bash
npx ecc-universal@2.2.3 setup
```

El instalador te hace 2 preguntas:

**Pregunta 1 — Dónde instalar:**
```
1. Global user — Available in every project for this user.   ← ELIGE ESTA
2. Shared project
3. Private project
```
Escribe `1` y pulsa Enter.

**Pregunta 2 — Nivel de hooks:**
```
1. Off
2. Minimal
3. Standard    ← ELIGE ESTA
4. Strict
```
Escribe `3` y pulsa Enter (o pulsa Enter directamente, es el valor por defecto).

Confirma con `y`. Listo. ECC queda instalado globalmente — no hace falta repetirlo nunca más.

---

## Paso 4 — Configurar las API keys

```bash
cp .env.example .env.local
```

Abre `.env.local` y rellena:

```
ANTHROPIC_API_KEY=sk-ant-...   # de console.anthropic.com
```

La `BRAVE_SEARCH_API_KEY` es opcional para el hackathon.

---

## Paso 5 — Instalar dependencias y arrancar

```bash
npm install
npm run dev
```

Abre http://localhost:3000 — deberías ver la app funcionando.

---

## Paso 6 — Abrir Claude Code en el proyecto

```bash
# Desde la carpeta del repo:
claude
```

Esto abre Claude Code. Al arrancar carga automáticamente:
- El `CLAUDE.md` del proyecto → Claude sabe todo sobre FireCompass, los datos NASA, el stack, los criterios del jurado
- Las skills específicas → `hackathon-mode`, `fire-science`, `psi-expert`
- ECC global → todos los agentes y comandos

**No necesitas decirle nada especial al principio.** Claude ya sabe en qué proyecto está.

---

## Cómo trabajar con Claude durante el hackathon

### La regla más importante

Describe **qué quieres construir**, no cómo. Claude decide la implementación. Tú decides qué construir.

Mal: "escríbeme un componente React con useState que..."
Bien: "quiero una página que muestre el comparador de entornos (Tierra, ISS, Luna, Marte) con sus niveles de riesgo de incendio"

---

### Comandos ECC más útiles para FireCompass

| Comando | Para qué |
|---|---|
| `/ecc:plan` | Antes de construir algo nuevo. Genera un plan de implementación |
| `/tdd` | Construir con tests. Escribe primero el test, luego el código |
| `/code-review` | Revisar el código que acabas de escribir |
| `/build-fix` | Si el build falla, lo resuelve solo |

**Ejemplo de uso:**
```
/ecc:plan quiero añadir la página Ask the Data donde el usuario 
puede hacer preguntas sobre los experimentos NASA y Claude responde 
citando los PSI IDs
```

---

### Agentes que más vas a usar

Claude los activa automáticamente, pero puedes pedirlos explícitamente:

- **`planner`** — para planificar una feature compleja antes de codear
- **`react-reviewer`** — revisa componentes React que escribas
- **`typescript-reviewer`** — revisa tipos y código TypeScript
- **`build-error-resolver`** — cuando Next.js te da un error raro
- **`security-reviewer`** — antes de hacer deploy, revisa la API key exposure

Para usar un agente explícitamente escribe `←` en el prompt de Claude Code y selecciona el agente.

---

### Flujo de trabajo recomendado para el hackathon

```
1. Describe la feature que quieres construir
        ↓
2. Claude hace el plan (/ecc:plan)
        ↓
3. Claude construye el código
        ↓
4. Si hay error de build → /build-fix
        ↓
5. /code-review antes de continuar
        ↓
6. Siguiente feature
```

---

### Skills específicos del proyecto

Además de ECC, el repo tiene 3 skills propios del proyecto:

- `/hackathon-mode` — activa el modo sprint: sin refactoring innecesario, MVP primero, deploy en Vercel como prioridad
- `/fire-science` — Claude como experto en combustión en microgravedad
- `/psi-expert` — Claude como experto en la base de datos PSI de la NASA

---

### Contexto que Claude ya sabe (no necesitas explicarle)

Gracias al `CLAUDE.md` del proyecto, Claude sabe desde el primer mensaje:

- Qué es FireCompass y para qué sirve
- Stack: Next.js 16, TypeScript, Tailwind CSS 4, Claude API
- Los 20 datasets NASA con sus PSI IDs y DOIs
- Que Luna Base es 40% más inflamable que la Tierra
- Que NO existen datos experimentales de gravedad parcial
- Los 5 criterios del jurado (Impact, Creativity, Validity, Relevance, Presentation)
- Que todo dato científico debe citar PSI ID + DOI

---

## Prioridades del hackathon (en orden)

1. **URL de Vercel funcionando** — el jurado necesita una URL pública
2. **Comparador de entornos** — Tierra vs ISS vs Luna vs Marte
3. **Investigation Explorer** — explorar los 20 datasets NASA
4. **Ask the Data** — chat con Claude que cita investigaciones PSI
5. *(opcional)* Análisis de vídeos con Claude Vision

---

## Si algo va mal

**Build falla:**
```
/build-fix
```

**Claude no sabe del proyecto:**
Sal de Claude Code, vuelve a entrar desde la carpeta del repo con `claude`.

**Error de API:**
Comprueba que `ANTHROPIC_API_KEY` está en `.env.local` y empieza por `sk-ant-`.

**Git — subir cambios:**
```bash
git add -A
git commit -m "descripción del cambio"
git push
```

---

## Resumen de setup en 5 comandos

```bash
git clone https://github.com/Jalcina/firecompass.git
cd firecompass
npx ecc-universal@2.2.3 setup     # solo la primera vez
cp .env.example .env.local         # luego añade la API key
npm install && npm run dev
```

Luego en otra terminal:
```bash
claude
```

Y a construir.
