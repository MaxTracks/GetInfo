#!/bin/bash
cat $1 | grep -v "USER" | grep -v "load average" | awk '{print $1 " \t" $8 " \t" $3}' | sort | uniq
