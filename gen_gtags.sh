#!/bin/sh
# basic script to generate gtags for source code
# wyu 2017

echo Gtags Creating V0.01
echo [1/2] Searching files ...

# find . -name *.[ch] > gtags.files
# ignore "./frc_core"
find . d \( -path ./frc_core -o -path ./faz_core/tools \) -prune -o -name '*.c' -o -name '*.cpp' -o -name '*.h' > gtags.files

echo Done.

echo [2/2] Generating tags ...

gtags

echo Done.
