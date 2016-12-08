#! /bin/bash

#方式一：生成1M文件
dd if=/dev/zero of=file.txt count=1024 bs=1024

#方式二：生成3G文件
dd if=/dev/urandom of=file.txt bs=1048576 count=3000

#方式三：从输入端输入两行可读的随机数据
cat - > file.txt
#ctrl+d
#生成2^(n+1)行数据
for i in {1...n}; do cat file.txt file.txt > file2.txt && mv file2.txt file.txt; done

#方式四：X:所需的行数，Y:每行的单词数，读字典到数组，随机选取单词，循环操作
ruby -e 'a=STDIN.readlines;X.times do;b=[];Y.times do; b << a[rand(a.size)].chomp end; puts b.join(" "); end' < /usr/share/dict/words > file.txt
