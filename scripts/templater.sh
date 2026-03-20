#!/bin/bash

read -p "Enter the name of your project directory: " dir_name

mkdir "$dir_name" &&
cd "$dir_name" &&

mkdir includes/ src/  &&
touch Makefile README.md
