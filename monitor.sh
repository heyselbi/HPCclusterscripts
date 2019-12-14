#!/bin/bash

# Author: Selbi Nuryyeva
# Date: Nov 19, 2019

# Shell code that retrieves time, goes through houk nodes and retrieves info of active jobs

# To run the code, in your terminal, type: "./monitor.sh > jobsinfo.txt"
# Sometimes code needs to be executable by typing "chmod +x run.sh"
# What will appear in the jobsinfo.txt is info on all active jobs on houk nodes
# at the time of code execution. To obtain info at time intervals, crontab can be used.
# After generation of jobsinfo file for each time point, they need to be further analyzed
# and plotted into a graph --> work in progress

# Let's first list the nodes. List of nodes can be obtained by executing following commands:
# qconf -sql | grep houk; qconf -sq houk_pod.q | grep hostlist; qconf -shgrp @houk_pod; qconf -shgrp @houk_pod_smp
HOSTS="n6074 n6075 n6076 n6077 n7073 n7074 n7075 n7076 n7077 n6033 n6034 n6035 n6003 n6004 n6012 n7003 n7004 n7011 n7012 n6362 n6363 n6364 n7362 n7363 n7364 n7432 n6406 n7071 n7072"

# Let's record the date and time we run the code
echo `date `

# Now enter each node, tell me which node you are in, and execute top command
# Top command lists all active jobs, most of which are not important.
# Only the ones ending with ".exe" are the ones we are interested
# Hence, grep finds the job ending with ".exe" and copies them into jobsinfo.txt
for HOSTNAME in ${HOSTS} ; do
echo ${HOSTNAME} 
ssh ${HOSTNAME} "top -b -n1 | grep -w exe"
done
