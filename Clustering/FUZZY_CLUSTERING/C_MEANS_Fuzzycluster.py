# -*- coding: utf-8 -*-
"""
Created on Mon Apr 17 03:03:48 2017

@author: Abhishek
"""

import pandas
import numpy as np, numpy.random
import math

df=pandas.read_csv('IIT Gandhinagar_official Page_data.csv')
likes=df['likes_count'].tolist()
message=df['message'].tolist()

num_cluster=4
num_datapoint=len(likes)

g=1.25

mu_matrix=[]
for i in range(num_datapoint):
    mu_matrix+=[np.random.dirichlet(np.ones(4)).tolist()]


def center(center_num):
    sum_num=0
    sum_denm=0
    for j in range(num_datapoint):
        sum_num+=math.pow(mu_matrix[j][center_num],g) * likes[j]
        sum_denm+=math.pow(mu_matrix[j][center_num],g)
    return sum_num*1.0/sum_denm

centres=[center(0),center(1),center(2),center(3)]

for iterate in range(100):
    updated_mumatrix=np.zeros(shape=(num_datapoint,num_cluster))
    for j in range(num_datapoint):
        for m in range(num_cluster):
            sum_mu=0
            for k in range(num_cluster):
                sum_mu+=math.pow((abs(likes[j]-centres[m])*1.0)/abs(likes[j]-centres[k]),(2.0/(g-1)))
            updated_mumatrix[j][m]=1.0/sum_mu
    
    def updated_center(center_num):
        sum_num=0
        sum_denm=0
        for j in range(num_datapoint):
            sum_num+=math.pow(updated_mumatrix[j][center_num],g) * likes[j]
            sum_denm+=math.pow(updated_mumatrix[j][center_num],g)
        return sum_num*1.0/sum_denm
        
    updates_centres=[updated_center(0),updated_center(1),updated_center(2),updated_center(3)]

#print updated_mumatrix
final_cluster=[]    
for final_iter in range(num_datapoint):
    final_cluster+=[numpy.argmax(updated_mumatrix[final_iter])]    
#print final_cluster

new_cluster={}
new_message={}
for fin in range(num_datapoint):
    new_cluster.setdefault(final_cluster[fin], [])
    new_cluster[final_cluster[fin]].append(likes[fin])
    new_message.setdefault(final_cluster[fin], [])
    new_message[final_cluster[fin]].append(message[fin])

import csv
from itertools import izip_longest
rows = izip_longest(new_message[0],new_cluster[0], new_message[1],new_cluster[1], new_message[2],new_cluster[2], new_message[3],new_cluster[3])

with open("out_fuzzycluster.csv", "w") as f:
    csv.writer(f).writerows(rows)    
        
        
        
