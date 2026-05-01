#!/bin/bash
set -e

echo "🔧 Clean DisplayCAL setup..."

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "🐍 Installing Python 3.10..."
brew install python@3.10 || true

echo "📦 Installing ArgyllCMS..."
brew install argyll-cms || true

PY310="$(brew --prefix python@3.10)/bin/python3.10"

echo "📦 Cloning DisplayCAL..."
git clone https://github.com/eoyilmaz/displaycal-py3.git "$HOME/DisplayCAL"

cd "$HOME/DisplayCAL"

echo "🧪 Creating venv..."
"$PY310" -m venv venv
source venv/bin/activate

echo "📦 Installing dependencies..."
pip install -U pip
pip install -r requirements.txt

echo "🚀 Creating launcher..."
cat > "$HOME/DisplayCAL/run-displaycal.sh" << 'EOF'
#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

cd "$HOME/DisplayCAL" || exit 1
source venv/bin/activate

python -m DisplayCAL
EOF

chmod +x "$HOME/DisplayCAL/run-displaycal.sh"

echo "✅ Done. Launching DisplayCAL..."
"$HOME/DisplayCAL/run-displaycal.sh"