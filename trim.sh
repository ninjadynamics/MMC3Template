#!/bin/bash
sed -i 's/\s*$//g'   *.c
sed -i 's/\s*$//g'   *.h
git ls-files -z | while IFS= read -rd '' f; do
    if [[ $f =~ .*\.(c$|h$|py$|bat$|sh$) ]]; then
        tail -c1 < "$f" | read -r _ || echo >> "$f"; #unix2dos "$f";
    fi
done
dos2unix *.sh
