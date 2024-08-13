# compile.sh

This script is designed for compiling and running C code for the NES (Nintendo Entertainment System) platform. It is structured as a Bash script that automates the entire process from compilation to execution in an emulator. Here's a detailed breakdown of what each part of the script does:

### Script Breakdown

1. **Project Name Setup**:
   ```bash
   name="$1"
   if [[ "$name" = "" ]]; then
       name='game'
   fi
   ```
   - This block initializes the project name with the first command-line argument. If no name is provided, it defaults to 'game'.

2. **Clean Old Files**:
   ```bash
   rm -f *.o
   rm -rf bin
   ```
   - Removes all object files (`*.o`) and the `bin` directory to start fresh.

3. **Source File Collection**:
   ```bash
   src=`echo *.c`
   ```
   - Gathers all C source files in the current directory.

4. **Cleanup Assembly Files**:
   ```bash
   for f in $src; do
       rm -f ${f%%.c}.s
   done
   ```
   - Iterates over each source file and deletes the corresponding assembly file to ensure no leftovers affect the build.

5. **C to Assembly Compilation**:
   ```bash
   for f in $src; do
       cc65 -D OFFLINE_COMPILER -Or -g -j $f --add-source --target nes
   done
   ```
   - Compiles each C source file into an assembly file specifically for the NES target, using the `cc65` compiler with optimizations and debugging symbols.

6. **Selective Assembly Compilation**:
   ```bash
   asm=`echo *.s`
   cmd='head -n 1 $f | grep -i compile > /dev/null'
   for f in $asm; do
       eval $cmd && ca65 $f --feature string_escapes
   done
   ```
   - This block first identifies all assembly files. It then uses a command stored in a variable to check if the first line of each assembly file contains the word "compile" (case-insensitive), and if so, compiles it using `ca65`.

7. **Binary Object Compilation**:
   ```bash
   src=`echo $src | sed 's/main.c//'`
   for f in $src; do
       ca65 ${f%%.c}.s
   done
   ca65 main.s -g
   ```
   - Compiles all non-main assembly files into binary objects, excluding the main file initially for specific handling. It then compiles the `main.s` with debugging information.

8. **Linking**:
   ```bash
   ld65 -C mmc3.cfg -o "$name.nes" *.o nes.lib -Ln labels.txt --dbgfile "$name.dbg"
   ```
   - Links all object files along with the NES library into an NES executable, specifying a config file (`mmc3.cfg`), outputting debug information, and saving label info.

9. **Organization and Cleanup**:
   ```bash
   mkdir -p bin
   mv labels.txt bin
   mv "$name.nes" bin
   mv "$name.dbg" bin
   cp *.s bin
   rm *.o
   rm main.s
   for f in $src; do
       rm -f ${f%%.c}.s
   done
   ```
   - Moves all important files into a `bin` directory, copies all assembly files for potential review, and cleans up the rest, including object and assembly files.

10. **Execution**:
    ```bash
    eval 'mono $MESEN_HOME/Mesen.exe "bin/$name.nes" 2>/dev/null || nestopia "bin/$name.nes" 2>/dev/null' &
    ```
    - Attempts to run the compiled NES file using Mesen or Nestopia emulators. It suppresses error messages and runs this process in the background.

### General Notes

- The script is robust in handling compilation and linking for an NES project, assuming all tools (`cc65`, `ca65`, `ld65`, and the emulators) are properly installed and configured.
- It automates error-prone steps and ensures a clean workspace before and after the build process.
- Debugging support and configuration options are tailored to a typical NES development setup.

This thorough explanation should provide clarity on each step and the overall flow of the NES compilation process scripted here.