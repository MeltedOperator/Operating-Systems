#!/usr/bin/env bash
set -euo pipefail

show_mounted_fs() {
	echo "=== Смонтированные файловые системы ==="
	df -Th | grep -E 'ext4|tmpfs|Filesystem'
}

show_dir_files() {
	echo "=== Статистика: /etc ==="

	echo "Files:     $(find /etc -type f 2>/dev/null | wc -l)"
	echo "Dirs:      $(find /etc -type d 2>/dev/null | wc -l)"
	echo "Symlinks:  $(find /etc -type l 2>/dev/null | wc -l)"
}

show_top_files() {
        echo "=== Топ-5 крупнейших файлов в /etc ==="
        sudo find /etc -type f -printf '%i\t%s\t%p\n' | sort -t$'\t' -k2 -rn | head -5
      
}
show_df_vs_du() {
	echo "=== df vs du (/) ==="
	echo "Суперблок:        $(df --output=used / | tail -1)"
	echo "Обход дерева:     $(sudo du -sk / 2>/dev/null | awk '{print $1}')"
	echo ""
	df_used_kb=$(df / | tail -n | awk '{print $3}')
	du_used_kb=$(sudo du -s / 2>/dev/null | awk 'print $1')

	difference_kb=$((df_used_kb - du_used_kb))
	echo "Разница:          ${difference_kb} КВ"
}
main() {
	show_mounted_fs
	echo ""
	show_dir_files
	echo ""
	show_top_files
	echo ""
	show_df_vs_du
}

main "$@"


chmod +x fs_audit.sh
./fs_audit.sh
