#!/bin/bash
rm -f apache-tomcat-8.0.46/logs/*
git pull
git add .
git commit -m "$1"
git push
