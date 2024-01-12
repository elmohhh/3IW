#!/bin/sh

cd /project

npm run build
php artisan migrate:fresh --seed
php artisan serve --host=0.0.0.0 --port=8080