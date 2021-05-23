function [attribute1 attribute2]=process_attribute(attribute,k,value)
N=length(attribute)
j=1;
s=1;
for i=1:N
    if attribute(i,k)<value 
        attribute1(j,1:5)=attribute(i,1:5);
        j=j+1;
    else   attribute(i,k)>=value 
        attribute2(s,1:5)=attribute(i,1:5);
        s=s+1;
    end
end
end


