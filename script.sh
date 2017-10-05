#!/bin/bash
chmod 755 apache-tomcat-8.0.46/bin/shutdown.sh
./apache-tomcat-8.0.46/bin/shutdown.sh
rm -f apache-tomcat-8.0.46/logs/*
git pull
git add .
git commit -m "$1"
git push
