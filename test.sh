#!/bin/bash
cat temp.md | awk '$2!=prev{print (prev=$2 ":") }  {print $s}' | sort -g   > test.md