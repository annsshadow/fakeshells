#author:shadowwen
#date:2016-07-18
#function:print number of same line in file1,file2

if [ $# -ne 2 ]
then
        echo "Usage: $0 file1 file2"
        exit
fi

file1=$1
file2=$2

if [ -e $file1 ] && [ -e $file2 ]
then
        #echo "$file1 and $file2 exist"
        if [ -f "$file1" ] && [ -f "$file2" ]
        then
                #echo "$file1 and $file2 are normal files"
                if [ -r $file1 ] && [ -r $file2 ]
                then
                        #echo "$file1 and $file2 can read"
                        (awk '{NR==FNR a[$0]++; if(NR>FNR&&a[$0]){print}} END{for(k in a){print k,a[k]}}' $file1 $file2 | wc -l)
                else
                        echo "$file1 or $file2 can't read"
                fi
        else
                echo "$file1 or $file2 not normal files"
        fi
else
        echo "$file1 or $file2 not exist"
fi
