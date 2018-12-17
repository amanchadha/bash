#!/bin/bash

# Adds up a specified column (of numbers) in the target file.
# Floating-point (decimal) numbers okay, because awk can handle them.

ARGS=2
E_WRONGARGS=85

usage()
{
   echo "Usage: `basename $0` filename column-number"
   exit $E_WRONGARGS
}

if [ $# -ne "$ARGS" ] # Check for proper number of command-line args.
then
   echo "Improper number of command-line args"
   usage
fi

if [ ! -f "$1" ] ; then
   echo "$1: No such file." 
   usage                 # Print usage message and exit.
fi 

if [ -z "$2" ] ; then
   echo "'$2': No letters specified."
   usage
fi 

filename=$1
column_number=$2

#  Passing shell variables to the awk part of the script is a bit tricky.
#  One method is to strong-quote the Bash-script variable
#+ within the awk script.
#     $'$BASH_SCRIPT_VAR'
#      ^                ^
#  This is done in the embedded awk script below.
#  See the awk documentation for more details.

# A multi-line awk script is here invoked by
#   awk '
#   ...
#   ...
#   ...
#   '


# Begin awk script.
# -----------------------------
#awk '{total += $'"${column_number}"'} END {print total}' "$filename"
#awk -v column_number=$column_number '{total += $column_number} END {print total}' "$filename"
awk -v column_number=$column_number 'BEGIN {total = 0} {total += $column_number} END {print total}' "$filename"
# -----------------------------
# End awk script.


#   It may not be safe to pass shell variables to an embedded awk script,
#+  so Stephane Chazelas proposes the following alternative:
#   ---------------------------------------
#   awk -v column_number="$column_number" '
#   { total += $column_number
#   }
#   END {
#       print total
#   }' "$filename"
#   ---------------------------------------


exit 0