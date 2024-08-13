#!/bin/bash

# Get the project name
name="$1"
if [[ "$name" = "" ]]; then
    name='game'
fi

# Remove any old files
rm -f *.o
rm -rf bin

# Get the list of C source files
src=`echo *.c`

# Remove any C source assembly
# files that were left behind
for f in $src; do
    rm -f ${f%%.c}.s
done

# Compile the C sources
# into assembly files
for f in $src; do
    cc65 -D OFFLINE_COMPILER -Or -g -j $f --add-source --target nes
done

# Compile the project's assembly
# files into binary objects
asm=`echo *.s`
cmd='head -n 1 $f | grep -i compile > /dev/null'
for f in $asm; do
    eval $cmd && ca65 $f --feature string_escapes
done

# Compile the generated assembly
# files into binary objects
src=`echo $src | sed 's/main.c//'`
for f in $src; do
    ca65 ${f%%.c}.s
done
ca65 main.s -g

# Link
ld65 -C mmc3.cfg -o "$name.nes" *.o nes.lib -Ln labels.txt --dbgfile "$name.dbg"

# Copy the assembly files
mkdir -p bin
mv labels.txt bin
mv "$name.nes" bin
mv "$name.dbg" bin
cp *.s bin

# Clean-up the mess
rm *.o
rm main.s
for f in $src; do
    rm -f ${f%%.c}.s
done

# Run the project on the emulator
eval 'mono $MESEN_HOME/Mesen.exe "bin/$name.nes" 2>/dev/null || nestopia "bin/$name.nes" 2>/dev/null' &
