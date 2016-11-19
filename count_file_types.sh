#! /bin/bash
#检查参数数量是否符合要求
if [ $# -ne 1 ]
then
     echo How to use: $0 ---> basepath!
     exit -1
fi
#获取传入的路径参数
path=$1
#声明一个关联数组
declare -A typearray

while read fileinfo
do
    ftype=`file -b "$fileinfo" | cut -d , -f 1`
    let typearray["$ftype"]++
done< <( find $path -type f -print )

echo '==File==Type==Stastics=='
for ftype in "${!typearray[@]}"
do
     echo $ftype : ${typearray["$ftype"]}
done