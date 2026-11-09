#!/bin/bash
# ============================================
# FireCompass — Setup rápido en portátil
# Ejecutar UNA vez cuando llegas al hackathon
# ============================================

echo "🚀 FireCompass Setup"
echo "===================="

# 1. Instalar dependencias
echo "📦 Instalando dependencias..."
npm install

# 2. Instalar paquetes adicionales necesarios
echo "📦 Instalando Anthropic SDK y librerías..."
npm install @anthropic-ai/sdk recharts lucide-react swr

# 3. Verificar .env.local
if [ ! -f .env.local ]; then
  echo "⚠️  Copiando .env.example → .env.local"
  cp .env.example .env.local
  echo "🔑 IMPORTANTE: Rellena ANTHROPIC_API_KEY en .env.local"
else
  echo "✅ .env.local ya existe"
fi

# 4. Verificar que la API key está configurada
if grep -q "sk-ant-" .env.local 2>/dev/null; then
  echo "✅ ANTHROPIC_API_KEY configurada"
else
  echo "⚠️  Recuerda añadir tu ANTHROPIC_API_KEY en .env.local"
fi

echo ""
echo "✅ Setup completo!"
echo "👉 Siguiente paso: npm run dev"
echo "👉 Abre: http://localhost:3000"
