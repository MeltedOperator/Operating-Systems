#!/bin/bash
#analyze.sh - полный скрипт
#запуск ./analyze.sh sample_access.log
#
#TODO 1: Топ-5 IP по числу запросов
LOG="$1"

echo "=== ТОП-5 IP-АДРЕСОВ ==="
cat "$LOG" | awk '{print $1}' | sort | uniq -c | sort -rn | head -5

#TODO 2: Посчитать кол-во запросов с кодом 404
echo ""
echo "=== ЗАПРОСЫ С КОДОМ 404 ==="
grep -c " 404 " "$LOG"

#TODO 3: Самый популярный URL
echo "=== САМЫЙ ПОПУЛЯРНЫЙ URL ==="
cat "$LOG" | awk '{print $7}' | sort | uniq -c | sort -nr | head -1

#TODO 4: Общее количество строк
echo "=== ОБЩЕЕ КОЛИЧЕСТВО СТРОК ==="
cat "$LOG" | wc -l 
