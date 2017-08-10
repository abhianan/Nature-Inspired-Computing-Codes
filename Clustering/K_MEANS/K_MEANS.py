# -*- coding: utf-8 -*-
"""
Created on Sun Apr 09 04:33:44 2017

@author: Abhishek
"""

import pandas
import random
import numpy as np

df=pandas.read_csv('IIT Gandhinagar_official Page_data.csv')
likes=df['likes_count'].tolist()
message=df['message'].tolist()

num_cluster=4

#---------------------------------------------------------------------------
#intial cluster formation

init_center=random.sample(likes, num_cluster)
init_cluster={}
init_message={}

for i in range(len(likes)):
    minim=float("inf")
    jval=0
    for j in range(num_cluster):
        if(abs(init_center[j]-likes[i])<=minim):
            minim=abs(init_center[j]-likes[i])
            jval=j
    init_cluster.setdefault(jval, [])
    init_cluster[jval].append(likes[i])
    init_message.setdefault(jval, [])
    init_message[jval].append(message[i])

#print init_cluster
#--------------------------------------------------------------------------

init_mean=[]
for i in range(num_cluster):
    init_mean.append(np.mean(init_cluster[i]))
#print init_mean
    
#------------------------------------------------------------------------

for m in range(100):    
    new_center=init_mean
    new_cluster={}
    new_message={}
    
    for i in range(len(likes)):
        minim=float("inf")
        jval=0
        for j in range(num_cluster):
            if(abs(new_center[j]-likes[i])<=minim):
                minim=abs(new_center[j]-likes[i])
                jval=j
        new_cluster.setdefault(jval, [])
        new_cluster[jval].append(likes[i])
        new_message.setdefault(jval, [])
        new_message[jval].append(message[i])
            
    new_mean=[]
    for i in range(num_cluster):
        new_mean.append(np.mean(new_cluster[i]))
    
#print new_cluster
#print new_message
#print new_mean

import csv
from itertools import izip_longest
rows = izip_longest(new_message[0],new_cluster[0], new_message[1],new_cluster[1], new_message[2],new_cluster[2], new_message[3],new_cluster[3])

with open("out_Kmeans.csv", "w") as f:
    csv.writer(f).writerows(rows)