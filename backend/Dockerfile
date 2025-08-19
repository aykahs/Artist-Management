# Use PHP 8.2 with Alpine
FROM php:8.2-fpm-alpine

# Install dependencies
RUN apk update && apk add --no-cache \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    zlib-dev \
    libzip-dev \
    unzip \
    mysql-client \
    bash \
    shadow \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

# Set working directory
WORKDIR /var/www/app

# Add non-root user
ARG UID=1000
ARG GID=1000
RUN addgroup -g ${GID} nginx \
 && adduser -D -u ${UID} -G nginx appuser

# Copy Composer binary
COPY --from=composer:2.6.5 /usr/bin/composer /usr/local/bin/composer

# Copy composer files early for layer caching
COPY composer.json composer.lock ./

# Install PHP dependencies (optional if you have vendor folder)
# RUN composer install --no-scripts --no-autoloader

# Copy application source
COPY . .

# Ensure writable directories exist and are owned properly
RUN mkdir -p storage bootstrap/cache \
 && chown -R appuser:nginx storage bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache
RUN chown -R $(id -u):$(id -g) /var/www/app/storage /var/www/app/bootstrap/cache
RUN chmod -R 775 /var/www/app/storage /var/www/app/bootstrap/cache
# Set correct permissions for Laravel
RUN chown -R appuser:nginx /var/www/app

# Switch to non-root user
USER appuser

# Expose port (optional)
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
