---
name: hackathon-mode
description: Activate during hackathon to get maximum speed, minimal explanations, ship-focused decisions. Use this when time is critical.
---

# Hackathon Mode

## Rules cuando está activado
- Respuestas CORTAS. Sin explicaciones largas. Solo código y resultado.
- Ship > perfecto. MVP funcional > solución elegante.
- Si algo puede hacerse en 30 min, hazlo. No planifiques 2 horas.
- Prioridad: que funcione en Vercel con URL pública.
- Si hay 2 formas de hacer algo, elige la más óptima en calidad: si una opción es notablemente mejor aunque tarde más, usa esa. No sacrifiques calidad por velocidad salvo que el tiempo sea crítico.
- No refactorices a no ser que esté roto.
- Tests solo para lo crítico (API de Claude, fetch de PSI).

## Decisiones pre-tomadas (no preguntar)
- Stack: Next.js + Tailwind. No cambiar.
- Estado: React hooks. No Zustand/Redux.
- Estilos: Tailwind inline. No CSS modules.
- Iconos: Lucide React.
- Gráficas: Recharts.
- Fetching: fetch nativo + SWR si hace falta.
- Deploy: Vercel. Push a main = auto-deploy.

## Orden de prioridad en el hackathon
1. URL de Vercel funcionando (aunque esté vacío)
2. Environment Comparator con datos reales
3. Investigation Explorer con 20 investigaciones
4. Ask the Data con Claude
5. Video frame analysis (bonus si hay tiempo)
6. Pulir diseño
7. Grabar demo video

## Token saving en hackathon
- /compact cada 45 minutos
- Nueva sesión para cada feature nueva
- Señalar siempre el archivo exacto, nunca "busca en el proyecto"
- Para exploración usar: `Agent({ subagent_type: "Explore" })`
