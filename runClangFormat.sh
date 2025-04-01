#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

PROJECT_FOLDER=$( dirname "$(realpath "$0")" )
cd $PROJECT_FOLDER || exit 1

FILES_TO_CHECK=$(find tests src include -type f -iregex '.*\.\(h\|hpp\|c\|cpp\)')


printf "Code files to be checked:\n"
for FILE in $FILES_TO_CHECK; do printf " \t$FILE \n"; done


CLANG_FORMAT_OUTPUT=$(for FILE in $FILES_TO_CHECK; do clang-format -style=file:$PROJECT_FOLDER\/.clang_format -i $PROJECT_FOLDER\/$FILE --dry-run --Werror; done 2>&1)
for FILE in $FILES_TO_CHECK; do clang-format -style=file:$PROJECT_FOLDER\/.clang_format -i $PROJECT_FOLDER\/$FILE --Werror; done
if [[ $CLANG_FORMAT_OUTPUT ]]; then

        printf "\n\t ${RED}[ERROR] clang-format check FAILED!${NC} All errors will be automatically fixed\n"
else
        printf "\t ${GREEN}[PASS] No clang-format violations!${NC}\n"
fi
