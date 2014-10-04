#!/bin/bash

UNIFILE=.uni.txt

[ -f ${UNIFILE} ] || (echo Please enter your UNI and press Enter ; read uni_string; (echo $uni_string > $UNIFILE))

tar -cvf sdn-hw-2-`cat $UNIFILE`.tar src
