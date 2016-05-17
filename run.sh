#!/bin/bash
#cd /home/docker/code/app
#gunicorn -w 5 -b :8001 --env DJANGO_SETTINGS_MODULE=accessToken.settings --worker-class="egg:meinheld#gunicorn_worker" accessToken.wsgi:application --reload
sed -Ei 's/\$APP/'$APP_NAME'/g' /etc/supervisor/conf.d/supervisor-app.conf
#cat /etc/supervisor/conf.d/supervisor-app.conf
supervisord -n
