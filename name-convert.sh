#!/bin/sh
# 浏览器下载文件名乱码转换
for f in "$@"
do
    fileName=$(basename ${f})
    filePath=$(dirname ${f})

    # 两种乱码类型 GBK、UTF-8
    { fileNewName=$(echo $fileName | iconv -f UTF-8-Mac -t latin1 | iconv -f gbk)
    } || { fileNewName=$(echo $fileName | iconv -f UTF-8-Mac -t latin1)
    }

    # 文件名正常或乱码类型不属上述两种时，新文件名为空，则跳过
    if [ -n "$fileNewName" ]; then
        # 避免文件重复：如果已存在修复后的文件名，则在新文件名后加上随机字符串。
        if [ -e ${filePath}/$fileNewName ]; then
            mv "$f" "${filePath}/${fileNewName}-${RANDOM}"
        else
            mv "$f" "${filePath}/${fileNewName}"
        fi
    fi
done