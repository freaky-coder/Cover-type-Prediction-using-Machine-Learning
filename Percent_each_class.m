%function g=Percent_each_class(percent)
clear all;
percent=0.30;
data=csvread('covtype_2.csv');
matt1=zeros(7,3);
matt1(:,2)=[211840,283301,35754,2747,9493,17367,20510];
k=1;
ind=0;
sz=0;
flag=0;
matt1(:,1)=1:7;
count=zeros(7,1);
for i=1:7
matt1(i,3)=ceil(matt1(i,2)*percent);
sz=sz+matt1(i,3);
end

train=zeros(sz,55);

while(flag==0)
%trainds_sz = ceil(size(ids,1)*trainds_percent);
r = ceil(rand*size(data,1));
class=data(r,55);

    
if(ind(:)~=r)
if(count(class,1)<matt1(class,3))
    train(k,:)=data(r,:);
    ind(k)=r;
    k=k+1;
    display(k);
    count(class,1)=count(class,1)+1;
   
elseif(count(:,1)==matt1(:,3))
    flag=1;
end
end
end
not_ind = setdiff(1:1:size(data,1),ind);
test=data(not_ind,:);
