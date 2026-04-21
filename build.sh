#!/usr/bin/env zsh
PROJECT_NAME=blink
rm -rf build
mkdir -p build

armasm --cpu=cortex-m33 --thumb \
    startup_ADuCM410.s \
    -o build/startup_ADuCM410.o

FLAGS=(--target=arm-arm-none-eabi -mcpu=cortex-m33 -mthumb)
INCLUDES=(-Ithird_party/CMSIS/Include -Ithird_party/ADuCM410/common)

SOURCES=(
    third_party/ADuCM410/common/DioLib.c
    third_party/ADuCM410/common/system_ADuCM410.c
    third_party/ADuCM410/common/FeeLib.c
    main.c
)

for src in $SOURCES; do
    name=$(basename $src .c)
    echo "Compiling $src..."
    armclang $FLAGS $INCLUDES -c $src -o build/${name}.o
done

armlink build/*.o --scatter ADuCM410.sct --output build/${PROJECT_NAME}.elf && rm build/*.o

echo "Inspecting ELF file"
echo "-----------------------------------"
arm-none-eabi-objdump -h build/${PROJECT_NAME}.elf
echo "-----------------------------------"

fromelf --disassemble build/blink.elf > build/${PROJECT_NAME}.dis

fromelf --bin build/blink.elf --output build/blink.bin
