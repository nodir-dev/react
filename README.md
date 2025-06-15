# ⚡ Gojo React Starter Script

![bash](https://img.shields.io/badge/bash-script-green) ![vite](https://img.shields.io/badge/vite-react-blue) ![tailwind](https://img.shields.io/badge/tailwindcss-ready-blue)

Gojo Developer tomonidan tayyorlangan, React loyihalarini avtomatik yaratuvchi kuchli bash skript!  
Bu script yordamida 1 ta `react` so‘zini yozib, quyidagilarni avtomatik olasiz:

---

## 🚀 Nimalar bo‘ladi?

✅ Vite + React loyihasi yaratiladi  
✅ Tailwind CSS to‘liq sozlanadi  
✅ `App.jsx`, `main.jsx`, `index.css`, `vite.config.js` fayllari tayyor holatda yoziladi  
✅ `react-router-dom` va `react-icons` o‘rnatiladi  
✅ `figlet` banner chiqadi (agar mavjud bo‘lsa)

---

## ⚙️ O‘rnatish

```bash
# 1. figlet o‘rnatish (ixtiyoriy)
sudo apt install figlet

# 2. Skriptni saqlash
mkdir -p ~/.local/bin
nano ~/.local/bin/react
# 👆 Ushbu fayl ichiga skriptni joylashtiring

# 3. Ruxsat berish
chmod +x ~/.local/bin/react

# 4. PATH ga qo‘shish (agar kerak bo‘lsa)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
# yoki zsh uchun
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
