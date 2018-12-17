if grep -R xxyyzz cache_line/ > /dev/null 2>&1
then
   echo "OK"
fi

if grep -R hypot * > /dev/null 2>&1
then
   echo "OK"
fi

if grep -R hypot *
then
   echo "OK"
fi
