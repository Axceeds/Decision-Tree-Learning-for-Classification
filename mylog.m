function [y]=mylog(x)
if x==0
    y=0;
end
if x~=0
    y=log10(x)/log10(3);
end
end
