#! /bin/bash
name="zx"
echo ${name}
echo ${#name}
echo "my name is ${name}"
echo "my name is "$name""
echo "my name is "${name}""
echo my name is ${name} 

age=(21 22 24 52)
echo "${age[0]}"
echo ${age[@]}
echo ${age[*]}
echo "${#age[@]}"

echo "my age is ${age[1]}"
echo my age is $1
echo my age is $2
echo my age is $3

echo my age num $#
echo my age numlast $*

for i in "$@";do
	echo $i
	echo $*
done

val=`expr 2 + 2`
echo "val: $val"
val1=`expr 2 \* 2`
echo "val1 : $val1"


file="/home/zx/test/shelltest.sh"
if [ -e $file ]
then 
   echo "cunzai"
else
   echo "!cun"
fi
if [ -r $file ]
then
   echo "read"
else
   echo "!read"
fi


if [ -w $file ]
then 
   echo "write"
else
   echo "!write"
fi


printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4d\n" 郭靖 男 66
printf "%-10s %-8s %-4f\n" 郭芙 女 47.9876

echo "num1:"
read num1
echo "num2:"
read num2
:<<eo
if test $[num1] -eq $[num2]
then
   echo "equal"
else
   echo "!equal"
fi

if test $[num1] = $[num2]
then
   echo "equal1"
else
   echo "!equal1"
fi
eo
:<<we
if test $[num1] -eq $[num2]
then 
	echo "equal"
elif test $[num1] -gt $[num2]
then 
	echo "$[num1]"
else
	echo "$[num2]"
fi
we
echo "======="
for ag in ${age[*]}
do
	echo "${ag}"
done

for lop in 1 2 3 4 z x 
do 
	echo "${lop}"
done

echo "---------"
echo ${age[1]}
echo "----------"
for lp in ${age[@]}
do 
	echo $lp
done

echo "+++++++++++"
i=1
while ((${age[i]} -e ))
do 
	echo "${age[i]}"
	let "i++"
done

case ${num1} in
	1) echo "${age[$num1]}"
	;;
	2) echo "${num1}"
	;;
	3) echo "${num2}"
	;;
	*) echo "beyond"
	;;
esac

echo "++++++++++"
:<<re
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
#            continue
            echo "游戏结束"
        ;;
    esac
done
re
showtest(){
	echo $1 $2
	if test $1 -eq $2
	then
		echo "equal"
	else
		echo "!equal"
	fi 
	
	echo "${age[$1]}"

}
showtest ${num1} ${num2}


