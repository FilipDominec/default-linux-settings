#!/bin/bash
while true; do	
	osdctl -s "`echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]`                              "
done 
