FROM php:8.2-apache

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy application source
COPY . /var/www/html

# Set permissions.
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache


# Set working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Copy custom Apache configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
