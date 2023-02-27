#!/bin/bash

# Save the path to the "vars" folder in a variable

echo
echo "> Copying the example variables file..."

cp vars/main.yml.example vars/staging.yml
cp vars/main.yml.example vars/production.yml
cp vars/main.yml.example vars/development.yml
cp vars/main.yml.example vars/testing.yml
cp vars/main.yml.example vars/main.yml

echo
echo "> Copying the example inventory file..."

cp inventory_custom.ini.example inventory_custom.ini
cp inventory_custom.ini.example inventory_staging.ini
cp inventory_custom.ini.example inventory_production.ini
cp inventory_custom.ini.example inventory_development.ini
cp inventory_custom.ini.example inventory_testing.ini

echo
echo "> Copying the extra playbook files..."

cp main.yml staging.yml
sed -i 's/vars\/main.yml/vars\/staging.yml/g' staging.yml
cp main.yml production.yml
sed -i 's/vars\/main.yml/vars\/production.yml/g' production.yml
cp main.yml development.yml
sed -i 's/vars\/main.yml/vars\/development.yml/g' development.yml
cp main.yml testing.yml
sed -i 's/vars\/main.yml/vars\/testing.yml/g' testing.yml

echo
echo "> Done."