echo Start

#if syntax
if [ -f $1 ]; then
   echo Passed path is actually a file.
fi

#else syntax check -- no then
TEST=2
if [ $TEST -eq 0 ]; then
   echo "TEST is 0"
elif [ $TEST -eq 1 ] ; then 
   echo "$TEST is 1"
else
   echo "$TEST is neither 0 or 1"
   echo "<double> $TEST is neither 0 or 1"
fi

#one line if
if [ 1 -eq 1 ]; then echo "PASS"; fi

#clear

X="hello world"
echo $X #ok
if [ "$X" = "hello world" ]; then #if [ "$X" == "hello world" ]; then
   echo "Found hello world"
fi

#clear

X=hello
if [ $X = hello ]; then 
   echo "Found hello"
fi

#clear

#for variables that consist of integers, can use integer or string comparison
X=1 #OR X="1"
if [ "$X" -eq 1 ]; then 
   echo "Found 1"
fi

if [ "$X" = 1 ]; then 
   echo "Found 1"
fi

if [ "$X" = "1" ]; then 
   echo "Found 1"
fi

#clear

#works but dangerous
#TEST=0
#if ! TEST ; then
#   echo "TEST is 0"
#fi

#doesnt work -- [...] test operator only detects NULL strings or not 
#if ! [ $TEST ] ; then
#   echo "TEST is 0"
#fi

#detect empty string by -z or comparing it with the empty string or doing a null check
TEST=""
if [ -z $TEST ]; then
   echo "TEST is blank str"
fi

if [ "$TEST" = "" ]; then
   echo "TEST is blank str"
fi

#null check
if [ "$TEST" ]; then
   echo "TEST is not NULL"
else
   echo "TEST is NULL"
fi

#prefer this, the one after this works too
if [ ! "$TEST" ]; then
   echo "TEST is NULL"
fi

if ! [ "$TEST" ]; then
   echo "TEST is NULL"
fi

#check if string has a non-zero length
TEST="a"
if [ -n "$TEST" ]; then
   echo "TEST has non-zero length"
fi

if [ $TEST ]; then
   echo "TEST is 1"
fi

#compound if conditions
TEST=0
if [ $TEST == 0 ] || [ -z $TEST ] ; then
   echo "Either condition is true..."
fi

if [ $TEST == 0 ] || [ $TEST == "" ] ; then
   echo "Either condition is true..."
fi

if [[ $TEST == 0 ]] || [[ -z $TEST ]] ; then
   echo "Either condition is true..."
fi

if [[ $TEST == 0 || -z $TEST ]] ; then
   echo "Either condition is true..."
fi

#not conditions
if [ $TEST == 0 ] || ! [ $TEST != "" ] ; then
   echo "Either condition is true..."
fi

if [ $TEST == 0 ] || [ ! $TEST != "" ] ; then
   echo "Either condition is true..."
fi

if [[ $TEST == 0 || ! $TEST != "" ]] ; then
   echo "Either condition is true..."
fi

#doesnt work
#if [ $TEST == 0 || ! $TEST != "" ] ; then
#   echo "Either condition is true..."
#fi

#clear

TEST=2
#string lt comparison
if [[ $TEST < 3 ]]; then
   echo "TEST is 2"
fi

#arithmetic lt comparison
if (($TEST < 3)); then 
   echo "TEST is 2"
fi

#find files with .py extension
FILENAME="test.py"
if [[ "$FILENAME" == *.py ]]; then
   echo "FILENAME is a PY file"
fi

echo '*.py'
