#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out
git push >> .local.git.out || echo


#Your code here
COUNT=0
password=$(<$1)
length=${#password}
if [ $length -lt 6 ] || [ $length -gt 32 ]; then
	echo "Error: Password length invalid."
	exit
else 	
	let COUNT=COUNT+length
fi

if /bin/egrep -q [#$\+%@] $1; then
	let COUNT=COUNT+5
fi

if /bin/egrep -q [0-9] $1; then
	let COUNT=COUNT+5
fi

if /bin/egrep -q [A-Za-z] $1; then
	let COUNT=COUNT+5
fi

if /bin/egrep -q '([A-Za-z0-9])\1+' $1; then
	let COUNT=COUNT-10
fi

if /bin/egrep -q [a-z][a-z][a-z]+ $1; then
	let COUNT=COUNT-3
fi

if /bin/egrep -q [A-Z][A-Z][A-Z]+ $1; then
	let COUNT=COUNT-3
fi

if /bin/egrep -q [0-9][0-9][0-9]+ $1; then
	let COUNT=COUNT-3
fi

echo "Password Score:" $COUNT
