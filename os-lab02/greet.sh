mkdir -p ~/os-lab02 && cd ~/os-lab02

cat > greet.sh << 'EOF'
#!/bin/bash
set -euo pipefail

echo "Привет, $(whoami)!"
echo "Дата: $(date +%Y-%m-%d)"
echo "Ядро: $(uname -r)"
echo "Текущая директория: $PWD"
EOF

chmod +x greet.sh
./greet.sh
