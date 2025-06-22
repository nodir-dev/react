#!/bin/bash

# 🎨 RANGLAR
GREEN="\e[1;32m"
CYAN="\e[1;36m"
RESET="\e[0m"

# 📝 Loyiha nomi
echo -e "$CYAN"
read -p "📝 Loyiha nomini kiriting: " projectName
echo -e "$RESET\n🚀 ${GREEN}$projectName${RESET} loyihasi yaratilmoqda...\n"

# 🛠 Vite + React loyihasi yaratish
npm create vite@latest "$projectName" -- --template react > /dev/null 2>&1

# 📁 Loyihaga kiramiz
cd "$projectName" || exit 1

# 📦 Tailwind va zarur paketlar
npm install --silent
npm install -D tailwindcss postcss autoprefixer @tailwindcss/vite @vitejs/plugin-react --silent
npm install react-router-dom react-icons --silent

# ⚙️ Tailwind konfiguratsiyasi
npx tailwindcss init -p > /dev/null 2>&1

# 🧹 Keraksiz fayllarni tozalaymiz
rm -f src/App.css
echo '@import "tailwindcss";' > src/index.css

# 🧠 App.jsx
cat > src/App.jsx <<EOF
import React from "react";

const App = () => {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-br from-black via-gray-900 to-blue-950 px-4">
      <h1 className="text-9xl sm:text-8xl md:text-8xl font-extrabold text-blue-400 animate-pulse drop-shadow-lg text-center">
        Gojo Developer
      </h1>

      <p className="mt-4 text-lg sm:text-xl text-gray-300 text-center">
        "Go‘zallik, tezlik va kuch — barchasi bir frontendda!"
      </p>

      <div className="flex gap-8 mt-10 items-center">
        {/* React logo – default animatsiya bilan (spin) */}
        <img
          src="https://img.icons8.com/?size=100&id=asWSSTBrDlTW&format=png&color=000000"
          alt="React Logo"
          className="w-24 h-24 animate-spin"
          style={{ animationDuration: "6s" }}
        />

        {/* Tailwind logo */}
        <img
          src="https://img.icons8.com/?size=100&id=CIAZz2CYc6Kc&format=png&color=000000"
          alt="Tailwind CSS Logo"
          className="w-24 h-24 hover:scale-110 transition-transform duration-300"
        />
        {/* React Router logo */}
        <img
          src="https://www.svgrepo.com/show/354262/react-router.svg"
          alt="React Router Logo"
          className="w-24 h-24 hover:scale-110 transition-transform duration-300"
        />
      </div>
    </div>
  );
};

export default App;


EOF

# 🔌 main.jsx
cat > src/main.jsx <<EOF
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>
)
EOF


# 🔌 index.html
cat > index.html <<EOF
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite + React + Tailwind</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF



# ⚙️ vite.config.js
cat > vite.config.js <<EOF
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from "@tailwindcss/vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
})
EOF

# ✅ YAKUNIY
echo -e "\n✅ ${GREEN}Loyiha tayyor!${RESET}"
echo -e "▶️ Ishga tushirish:${GREEN}cd $projectName${RESET}&& ${GREEN}npm run dev${RESET}"

exit 0
