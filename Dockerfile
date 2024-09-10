# Etapa 1: Backend PHP con Slim
FROM php:8.1-fpm

# Instala las dependencias necesarias para Slim
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mysqli

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Copia el código del backend
COPY backend/ /var/www/html

# Instala Composer para manejar las dependencias de PHP
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instala las dependencias de Composer
RUN composer install

# Exponemos el puerto 9000 para PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
