echo Start

#IFS='\n'
for line in `cat $1`; do
   echo $line
done

clear

while IFS= read -r line; do
   echo "$line"
done < $1

clear

cat $1 | while IFS= read line; do
   echo "$line"
done
