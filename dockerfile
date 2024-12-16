# Verwende ein offizielles PHP-Image als Basis
FROM php:8.2-apache

# Installiere Abhängigkeiten (optional, falls notwendig)
# RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
#     docker-php-ext-configure gd --with-freetype --with-jpeg && \
#     docker-php-ext-install gd

# Kopiere die Anwendung ins Container-Dateisystem
COPY . /var/www/html/

# Setze das Arbeitsverzeichnis
WORKDIR /var/www/html

# Setze die richtigen Dateiberechtigungen (optional)
RUN chown -R www-data:www-data /var/www/html

# Setze die Umgebungsvariable für den Webserver (optional)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Aktiviert mod_rewrite (falls benötigt)
RUN a2enmod rewrite

# Exponiere den Port 80 für den Webserver
EXPOSE 80

# Starte den Apache-Server im Vordergrund
CMD ["apache2-foreground"]
