#!/bin/bash
# basic script to generate gtags for source code
# wyu@2020

echo Gtags Creating V1.0
echo -ne '  [1/2] Searching files '

# find . -name *.[ch] > gtags.files
# ignore "./frc_core" -o(or)
if [ -n "$1" -a "$1" == 'all' ];
then
    echo '[all] ... '
    find . -name '*.c' -o -name '*.cpp' -o -name '*.h' > gtags.files
else
    echo '[faz] ... '
    find ./faz_core ./common ./include ./src -name '*.c' -o -name '*.cpp' -o -name '*.h' > gtags.files
fi

echo '        Done.'

echo '  [2/2] Generating tag files ...'

gtags

echo '        Done.'
