#!/usr/bin/env bash

# Exit on error

set -o errexit


# ติดตั้ง Dependencies

pip install -r requirements.txt


# รวบรวม Static Files (CSS, JS, Images)

python manage.py collectstatic --no-input


# อัปเดตโครงสร้างฐานข้อมูล

python manage.py migrate


# Create superuser if it doesn't exist
if [ "$DJANGO_SUPERUSER_USERNAME" ]; then
    python manage.py createsuperuser --no-input || true
fi