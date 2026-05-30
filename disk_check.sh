#!/bin/bash

# 1. שליפת אחוז השימוש בדיסק וניקוי סימן האחוז
USAGE=$(df -h | grep " /$" | awk '{print $5}' | sed 's/%//g')

# 2. שמירת התאריך והשעה הנוכחיים במחרוזת עיצוב נקייה
NOW=$(date "+%Y-%m-%d %H:%M:%S")

# 3. בדיקת הלוגיקה וכתיבה לקובץ הלוג
if [ "$USAGE" -gt 80 ]; then
    echo "[$NOW] Warning: Disk usage is critical! Current usage: $USAGE%" >> /tmp/disk_monitor.log
else
    echo "[$NOW] Disk usage is normal. Current usage: $USAGE%" >> /tmp/disk_monitor.log
fi
