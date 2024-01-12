FROM bitnami/laravel

RUN apt update && apt install vim -y

# Install prerequis

# RUN apt install -y \
#     ca-certificates \ 
#     apt-transport-https \ 
#     software-properties-common \
#     wget \
#     curl \
#     lsb-release

# # INSTALL PHP
# # Ajout du dépot 
# RUN curl -sSL https://packages.sury.org/php/README.txt | bash -x
# RUN apt update
# RUN apt install -y php8.2 php-xml

# # INSTALL LARAVEL
# # install composer
# RUN curl -sS https://getcomposer.org/installer | php && \
#     mv composer.phar /usr/local/bin/composer

# INSTALL NODE
RUN apt install -y nodejs

# INSTALL NGINX
RUN apt install -y nginx

COPY nginx.conf /etc/nginx/site-available/default

WORKDIR /project

# Copie des fichiers

COPY . .

# Installation du projet
RUN composer update
RUN composer install 
RUN npm i
RUN php artisan key:generate

COPY ./entrypoint.sh .

RUN chmod +x ./entrypoint.sh

CMD ./entrypoint.sh