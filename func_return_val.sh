function myfunc() {
    local  __result=$1
    local  myresult='some value'
    eval $__result="'$myresult'"
}

myfunc result
echo $result
