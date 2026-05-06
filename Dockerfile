# Step 1: Use the official WordPress image with PHP 8.1 and Apache
FROM wordpress:php8.1-apache

# Step 2: Set working directory inside the container
WORKDIR /var/www/html

# Step 3: Copy all your local project files into the container
COPY . /var/www/html/

# Step 4: Install extra PHP extensions (Optional but recommended for E-commerce)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd mysqli \
    && docker-php-ext-enable mysqli

# Step 5: Set the correct ownership for WordPress
# Taake aap images upload kar sakein aur plugins install kar sakein
RUN chown -R www-data:www-data /var/www/html

# Step 6: Expose Port 80
EXPOSE 80
