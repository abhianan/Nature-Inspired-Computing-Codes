clc;
clear all;
close all;

load ('dist_mat.mat');

num_iteration=200;

iterator=200;
num_child=0.8*iterator;

path=[1,2,3,4,5,6,7,8,9,10,1];
num_path=length(path);

perm_path=path(2:num_path-1);
init_val=path(1);
num_perm_path=length(perm_path);

permuted_path=zeros(iterator,num_path);
for i =1:iterator
    permuted_path(i,:)=[init_val perm_path(randperm(num_perm_path)) init_val];
end

for j=1:iterator
    path_extract=permuted_path(j,:);
    sumval=0;
    for k=1:num_path-1
        sumval=sumval+m(path_extract(k),path_extract(k+1));
    permuted_path(j,num_path+1)=sumval;
    end
end

permuted_path=sortrows(permuted_path,num_path+1);

for iter=1:num_iteration
    index=randperm(num_child);
    for child_div=1:(num_child/2)
        parent1=permuted_path(index(2*child_div-1),2:num_path-1);
        parent2=permuted_path(index(2*child_div),2:num_path-1);
        cross_pos=ceil(rand*num_perm_path);
        first_item=permuted_path(1);
        
        child1=[parent1(1:cross_pos) parent2(cross_pos+1:num_perm_path)];
        unq_child1=unique(child1,'stable');
        rem_child1=setdiff(parent1,unq_child1,'stable');
        child1=[first_item unq_child1 rem_child1 first_item];
        
        child2=[parent2(1:cross_pos) parent1(cross_pos+1:num_perm_path)];
        unq_child2=unique(child2,'stable');
        rem_child2=setdiff(parent2,unq_child2,'stable');
        child2=[first_item unq_child2 rem_child2 first_item];
        
        permuted_path(iterator+2*child_div-1,1:num_path)=child1;
        permuted_path(iterator+2*child_div,1:num_path)=child2;
    
    end
    
    for fin_j=1:length(permuted_path)
        fin_path_extract=permuted_path(fin_j,:);
        fin_sumval=0;
        for fin_k=1:num_path-1
            fin_sumval=fin_sumval+m(fin_path_extract(fin_k),fin_path_extract(fin_k+1));
        permuted_path(fin_j,num_path+1)=fin_sumval;
        end
    end
    permuted_path=sortrows(permuted_path,num_path+1);
    permuted_path=permuted_path(1:iterator,:);
end



