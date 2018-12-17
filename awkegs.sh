awk '/Thomas/ {print;} /Nisha/ {print;}' employee.txt

echo
awk '{print $2,$5;}' employee.txt

echo
awk 'BEGIN {print "Name\tDesignation\tDepartment\tSalary";} {print $2,"\t",$3,"\t",$4,"\t",$NF;} END {print "Report Generated\n--------------";}' employee.txt

echo
awk '$1 >200' employee.txt

echo
awk '$4 ~/Technology/' employee.txt

echo
awk '{ if ($4 == "Technology") print; }' employee.txt

echo
awk 'BEGIN { count=0;} $4 ~/Technology/ { count++; } END { print "Number of employees in Technology Dept =",count;}' employee.txt

echo
awk 'BEGIN { count=0;} /Technology/ { count++; } END { print "Number of employees in Technology Dept =",count;}' employee.txt

echo
echo one two | awk '{print $1; print $2}'

echo
echo one two | awk '{print $0}'

