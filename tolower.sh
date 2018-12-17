#!/bin/bash
echo $1 | awk '{printf("  %s       %s\n", $1, tolower($1))}'

exit 0
