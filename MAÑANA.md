# Qué hacer mañana — Guía paso a paso

## Al llegar al hackathon (5 minutos)

```bash
cd /home/jaime/firecompass
npm run dev
```

Abre otra terminal en la misma carpeta:

```bash
cd /home/jaime/firecompass
claude
```

Listo. Ya estás dentro. No tienes que hacer nada más de configuración.

---

## ¿ECC funciona solo o tengo que usar comandos?

**La respuesta corta: funciona solo para lo importante.**

### Lo que ECC hace automáticamente (sin que toques nada)
- Los hooks se ejecutan solos cuando Claude escribe código — detectan problemas, resumen la sesión, etc.
- Claude elige qué agente usar internamente según lo que le pidas (si pides revisar código TypeScript, activa el `typescript-reviewer` solo)
- El contexto del proyecto (CLAUDE.md) se carga solo al abrir Claude Code en esta carpeta

### Lo que tú activas manualmente (cuando lo necesites)
Estos son los 4 comandos que vas a usar de verdad mañana:

| Cuándo | Escribe esto |
|---|---|
| Antes de empezar una feature nueva | `/ecc:plan` |
| Si el build da error | `/build-fix` |
| Después de escribir código importante | `/code-review` |
| Cada 45 minutos para limpiar contexto | `/compact` |

Eso es todo. No necesitas saber más comandos.

---

## El primer mensaje que le mandas a Claude mañana

Copia y pega esto tal cual:

```
Vamos a construir FireCompass. Lee el CLAUDE.md y empieza por la Fase 1:

1. app/page.tsx — Home con la frase del jurado y contexto del proyecto
2. app/simulator/page.tsx — Comparador de entornos (Tierra/ISS/Luna/Marte) con datos estáticos
3. app/explorer/page.tsx — Las 20 investigaciones NASA con filtros por dominio
4. app/dashboard/page.tsx — Vista general con acceso a las secciones

Sin API key de momento. Todo con datos de data/investigations.json.
Empieza por el Home.
```

---

## Flujo de trabajo durante el día

```
1. Le dices qué quieres construir
2. Claude lo construye
3. Tú lo ves en http://localhost:3000
4. Si algo no funciona → describe el problema a Claude
5. Si el build falla → escribe /build-fix
6. Cada 45 min → escribe /compact (evita que Claude "se olvide" de cosas)
7. Siguiente feature → vuelve al paso 1
```

---

## Cuando tengas la API key de Anthropic

Abre `.env.local` y pon:
```
ANTHROPIC_API_KEY=sk-ant-...
```

Reinicia el servidor (`Ctrl+C` y `npm run dev` otra vez) y dile a Claude:
```
Ahora tenemos la API key. Construye app/ask/page.tsx — el chat Ask the Data
donde el usuario pregunta y Claude responde citando investigaciones PSI.
```

---

## Desplegar en Vercel (hazlo lo antes posible — el jurado necesita URL)

```bash
npm install -g vercel
vercel
```

Sigue los pasos, elige el proyecto, y te da una URL pública en 2 minutos.
Después cada `git push` actualiza la URL automáticamente.

---

## Si algo va mal

| Problema | Solución |
|---|---|
| Build falla | Escribe `/build-fix` |
| Claude parece confundido | Escribe `/compact` y repite la pregunta |
| Claude no sabe del proyecto | Sal con `Ctrl+C`, vuelve a entrar con `claude` desde la carpeta del repo |
| Error de API key | Comprueba `.env.local`, reinicia con `npm run dev` |
| Cambios no se ven | Guarda el archivo, el navegador se refresca solo |

---

## Resumen en 3 líneas

1. `cd /home/jaime/firecompass` → `claude`
2. Pega el primer mensaje, Claude construye todo
3. Si algo falla: `/build-fix`. Cada 45 min: `/compact`
