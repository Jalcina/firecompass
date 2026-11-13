#!/bin/bash
# ============================================
# FireCompass — Setup rápido en portátil
# Ejecutar UNA vez cuando llegas al hackathon
# Lee HACKATHON_SETUP.md para la guía completa
# ============================================

echo "FireCompass Setup"
echo "================="

# 1. Instalar ECC (si no está instalado)
if ! claude --version &>/dev/null; then
  echo "Instalando Claude Code..."
  npm install -g @anthropic-ai/claude-code
fi

echo "Instalando ECC (Everything Claude Code)..."
echo "Cuando pregunte: elige opcion 1 (Global user) y opcion 3 (Standard hooks)"
npx ecc-universal@2.2.3 setup

# 2. Instalar dependencias del proyecto
echo "Instalando dependencias del proyecto..."
npm install

# 3. Verificar .env.local
if [ ! -f .env.local ]; then
  cp .env.example .env.local
  echo ""
  echo "IMPORTANTE: Abre .env.local y añade tu ANTHROPIC_API_KEY"
  echo "Consíguela en: https://console.anthropic.com"
  echo ""
  read -p "Pulsa Enter cuando hayas añadido la API key..."
fi

# 4. Verificar que la API key está configurada
if grep -q "sk-ant-" .env.local 2>/dev/null; then
  echo "ANTHROPIC_API_KEY configurada"
else
  echo "AVISO: Recuerda añadir tu ANTHROPIC_API_KEY en .env.local"
fi

echo ""
echo "Setup completo!"
echo ""
echo "Para arrancar la app:   npm run dev"
echo "Para abrir Claude Code: claude"
echo ""
echo "Lee HACKATHON_SETUP.md para saber cómo trabajar con ECC."
