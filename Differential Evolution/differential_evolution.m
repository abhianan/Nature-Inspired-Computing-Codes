clc;
clear all;
close all;

cr=0.5;
f=0.8;

p=rand(10,2)*2*pi-pi;
p(:,3)=sin(p(:,1))+cos(p(:,2));

for i=1:40
    for j=1:10
        rval=randperm(10,3);
        p(11,1:2)=(p(rval(1),1:2)-p(rval(2),1:2))*f+p(rval(3),1:2);
        if p(11,1)< -pi || p(11,1)>pi
            p(11,1)=-pi;
        end
        if p(11,2)< -pi || p(11,2)>pi
            p(11,2)=pi;
        end
        for k=1:2
            randcr=rand;
            if randcr<=cr
                p(12,k)=p(j,k);
            else
                p(12,k)=p(11,k);
            end
        end
        p(12,3)=sin(p(12,1))+cos(p(12,2));
        if p(12,3)>p(j,3)
            p(j,:)=p(12,:);
        end
    end
    q(i)=p(12,3);
end
plot(q);
q