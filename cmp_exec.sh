#!/bin/bash

debug=$2
if [[ $debug == "-j" ]]; then
    echo "Debug mode enabled"
fi
touch cmp_exec.temp
diff $1 cmp_exec.temp &> /dev/null
if [ $? -eq 0 ]; then
    echo "No changes detected"
else
    cat $1 > cmp_exec.temp
    ./asm.sh $1
fi
if [[ $? -ne 0 ]]; then
    echo "Compilation error"
    exit 1
fi
./bootloader.sh build/kernel.disk $2
