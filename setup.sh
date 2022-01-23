#!/usr/bin/env bash

## This script will create a folder called "phplist-dev"
## and check out various repositories in there.
## after that it will initialise the Docker setup and start it
##

rm -rf phplist-dev
mkdir phplist-dev
cd phplist-dev
git clone https://github.com/phplist/phplist3
mkdir phpListPlugins
mkdir phpListThemes

cd phpListThemes 
git clone https://github.com/phpList/phplist-ui-bootlist.git
cd ..
cd phpListPlugins
git clone https://github.com/phpList/phplist-plugin-subjectLinePlaceholdersPlugin.git

## add here any other plugins that you want to check out 

cd ..
git clone https://github.com/phpList/phplist-docker.git
cp phplist-docker/.env-dist phplist-docker/.env
echo THEME_DEV_PATH=$(pwd)/phpListThemes >> phplist-docker/.env
echo CODE_PATH=$(pwd)/phplist3/public_html/ >> phplist-docker/.env
echo PLUGIN_DEV_PATH=$(pwd)/phpListPlugins >> phplist-docker/.env
cd phplist-docker
docker-compose -f phplist-dev.yml up

