NUM_ARGS=0
while [ $NUM_ARGS -lt $# ]; do
   eval echo '$'$NUM_ARGS
   NUM_ARGS=$((NUM_ARGS+1))
done
