#!/usr/bin/env zsh

mkdir -p build

arm-none-eabi-as -mcpu=cortex-m33 -mthumb \
    startup_ADuCM410.s \
    -o build/startup_ADuCM410.o 2>&1
