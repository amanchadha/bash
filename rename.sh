usage() {
	echo 'rename renames all .html.* files in a folder to *.html'
	echo 'usage: ./rename.sh <folderName>'
}

if [ $# != 1 ]; then
	usage
	exit 1
fi

for file in `ls -1 $1`; do
	echo $file | grep 'html' #index.html.1
	if [ $? -eq 0 ]; then
		NUMSUFFIX=`echo $file | grep -o '[0-9]+$'`
		echo "NUMSUFFIX = $NUMSUFFIX"
		FILEPREFIX=`echo $file | sed -e 's/[.0-9]//g' | sed -e 's/html//'` #index
		echo "new filename: ${FILEPREFIX}${NUMSUFFIX}.html"
		#mv $file "${FILEPREFIX}${NUMSUFFIX}"'.html' #index.1.html
		mv $1/$file "$1/$file"'.html'
	fi
done