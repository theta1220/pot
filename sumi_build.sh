#!/bin/bash
cd `dirname $0`
out="$1.so"
if [ -z $1 ]; then
    echo "出力名を入力してください"
    return
fi

echo "" > ${out}
for file in `find . -type f -name '*.ss'`; do
    echo ${file}
    nkf --overwrite --oc=UTF-8 ${file}
    echo "// ${file}" >> ${out}
    cat ${file} >> ${out}
    echo -e "\n\n" >> ${out}
done