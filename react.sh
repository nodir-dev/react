#!/bin/bash

echo -e "\e[1;36m"
figlet "Gojo Developer" 2>/dev/null || echo "Gojo Developer"
echo -e "\e[0m"

read -p "📝 Loyiha nomini kiriting: " projectName
echo -e "\n🚀 $projectName loyihasi yaratilmoqda...\n"

# Vite + React loyihasini yaratish (chiqishni yashiramiz)
npx create-vite@latest "$projectName" --template react > /dev/null 2>&1

cd "$projectName"

# Paketlarni o‘rnatish (chiqishni butunlay tozalaymiz)
npm install --silent
npm install -D tailwindcss postcss autoprefixer @tailwindcss/vite @vitejs/plugin-react --silent
npx tailwindcss init -p > /dev/null 2>&1

# Router va Icons (ham yashirin)
npm install react-router-dom --silent
npm install react-icons --silent

# App.css ni o‘chirish
rm -f src/App.css

# App.jsx faylini yozamiz
cat > src/App.jsx <<EOF
import React from 'react'

const App = () => {
  return (
    <div className="text-3xl font-bold text-blue-600">
      Salom, Gojo Developer!
    </div>
  )
}

export default App
EOF

# main.jsx faylini yozamiz
cat > src/main.jsx <<EOF
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
EOF

# index.css faylini yozamiz
echo '@import "tailwindcss";' > src/index.css

# vite.config.js faylini yozamiz
cat > vite.config.js <<EOF
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
})
EOF

echo -e "\n✅ Tayyor! Loyihani ishga tushurish uchun:"
echo -e "\e[1;32mcd $projectName && npm run dev\e[0m"

exit 0
