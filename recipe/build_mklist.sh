set -e

if [ $(uname) == Darwin ]; then
    INPLACE_SED="sed -i \"\" -e"
else
    INPLACE_SED="sed -i"
fi

$INPLACE_SED 's/_MAX_PATH/MAX_PATH/g' mklist.c
$INPLACE_SED 's/return(strlen(shortpath);/return(strlen(shortpath));/g' mklist.c
$INPLACE_SED 's/#include "string.h"/#include "string.h"\n#include "libgen.h"/g' mklist.c

$CC -I./include -o mklist mklist.c

mkdir ${PREFIX}/bin
mv mklist ${PREFIX}/bin/
