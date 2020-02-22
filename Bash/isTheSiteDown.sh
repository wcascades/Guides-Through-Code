#!/bin/bash
# simple script to show handling arguments
# and conditional control flow

WEBSITE=$1;
ping $WEBSITE -c 5 || echo "The website is down";
