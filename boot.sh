#!/bin/sh
set -e

while true; do
    flask deploy
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo "Deploy command failed, retrying in 5 secs..."
    sleep 5
done


gunicorn -b :5000 --access-logfile - --error-logfile - search:app
