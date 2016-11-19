#! /bin/bash
#�����������Ƿ����Ҫ��
if [ $# -ne 1 ]
then
     echo How to use: $0 ---> basepath!
     exit -1
fi
#��ȡ�����·������
path=$1
#����һ����������
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