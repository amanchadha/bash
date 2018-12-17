linecount=0

printf '%s %s\n' foo bar |
{
#echo "foo bar" |
while IFS= read -r line
do
    echo $line
    linecount=$((linecount + 1))
done

echo "total number of lines: $linecount"
}

linecount=0
while IFS= read -r line
do
    echo $line
    linecount=$((linecount + 1))
done <<< "foo bar"

echo "total number of lines: $linecount"

#The problem also occurs without a loop
printf '%s\n' foo bar | read -r var
echo $var

printf '%s\n' foo bar | var=200
echo $var

f() {
   read -r var

   echo $var
}

f
echo "$var"
