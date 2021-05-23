function [IG s n]=entropy(attribute)
N=length(attribute);
%信息熵 计算各个种类数量
num=zeros(1,3);
gain=zeros(1,4);
value=zeros(1,4);
num(1)=sum(attribute(:,1)==1);
num(2)=sum(attribute(:,1)==2);
num(3)=sum(attribute(:,1)==3);
%总信息熵;
EntD=-(num(1)/N*mylog(num(1)/N)+num(2)/N*mylog(num(2)/N)+num(3)/N*mylog(num(3)/N));
%处理第一组特征
[gain(1) value(1)]=entropy1(attribute,2,EntD);
[gain(2) value(2)]=entropy1(attribute,3,EntD);
[gain(3) value(3)]=entropy1(attribute,4,EntD);
[gain(4) value(4)]=entropy1(attribute,5,EntD);
[IG idx]=max(gain);
s=value(idx);
n=idx+1;
end


