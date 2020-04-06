sed -i 's/_MAX_PATH/MAX_PATH/g' mklist.c
sed -i 's/return(strlen(shortpath);/return(strlen(shortpath));/g' mklist.c
sed -i 's/#include "string.h"/#include "string.h"\n#include "libgen.h"/g' mklist.c
if errorlevel 1 exit 1
gcc -I./include -o mklist mklist.c
if errorlevel 1 exit 1
xcopy mklist.exe %LIBRARY_PREFIX%\bin\ /y
if errorlevel 1 exit 1

