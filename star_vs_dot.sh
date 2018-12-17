#same
grep hi *
grep hi .

#same
find *
find .

clear

#ok
for file in *; do
   echo $file
done

echo

#doesnt work
for file in .; do
   echo $file
done
