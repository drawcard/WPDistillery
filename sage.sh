#!/usr/bin/env bash
#
# Script to install and setup Sage 9.0
#
#

echo "Install Composer...";

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

echo "Fetch Sage..."
composer create-project roots/sage dc-theme dev-master

echo "Run NPM Installer..."
cd dc-theme
git checkout -b build
npm install

echo "Build initial theme..."
npm run build

echo "Build finished. run 'npm run start' to watch the theme folder, after editing the 'devURL' value in assets/config.json. Happy coding!"


