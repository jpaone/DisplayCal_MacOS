# DisplayCAL (macOS Automated Setup)

This repository provides a simple, automated way to install and run the Python 3 fork of DisplayCAL on macOS using Homebrew.

It handles:
- Python 3.10 installation
- ArgyllCMS installation
- DisplayCAL setup
- Virtual environment configuration
- Creation of a reusable launcher script

---

## 🚀 Quick Start

### 1. Clone this repository

```bash
git clone https://github.com/YOUR_USERNAME/displaycal-macos-setup.git
cd displaycal-macos-setup
```

### 2. Run the installer

```bash
chmod +x displaycal_installer.sh
./displaycal_installer.sh
```

---

## ▶️ Launching DisplayCAL

After installation, run:

```bash
~/DisplayCAL/run-displaycal.sh
```

You can also create a macOS Automator app that points to:

```bash
/Users/YOUR_USERNAME/DisplayCAL/run-displaycal.sh
```

---

## 🖥 Requirements

- macOS (tested on Apple Silicon / M1+)
- Homebrew (installed automatically if missing)
- A supported color calibration device (e.g. X-Rite, Spyder)

---

## 📦 What This Script Installs

- Python 3.10 (via Homebrew)
- ArgyllCMS (required for calibration)
- DisplayCAL Python 3 fork:
  https://github.com/eoyilmaz/displaycal-py3

---

## ⚙️ Notes

- The script creates a virtual environment in:
  ~/DisplayCAL/venv

- DisplayCAL is launched using:
  python -m DisplayCAL

---

## ⚠️ Troubleshooting

### DisplayCAL won't launch
Try running manually:

```bash
cd ~/DisplayCAL
source venv/bin/activate
python -m DisplayCAL
```

---

### Re-running installer
The script will update the existing installation if it already exists.

---

## 🎯 Recommended Calibration Settings (Apple Studio Display)

- Whitepoint: 6500K (D65)
- Gamma: 2.2
- Brightness: ~120 cd/m²
- Correction: LCD PFS Phosphor WLED

---

## 🙌 Credits

- DisplayCAL Python 3 fork:
  https://github.com/eoyilmaz/displaycal-py3
- ArgyllCMS:
  https://www.argyllcms.com/

---

## 📄 License

MIT
