function [gain value]=entropy1(attribute,k,END0)
N=length(attribute);
attribute=sortrows(attribute,k);
N=length(attribute);
attri=zeros(1,N-1);
a=zeros(1,3);
b=zeros(1,3);
gain=0;
s=0;
for i=1:N-1
    attri(i)=(attribute(i,k)+attribute(i+1,k))/2; 
end
for i=1:N-1
    ix=find(attribute(:,k)>=attri(i),1);
%     DN(1:ix-1)=attribute(1:ix-1,k);
%     DP(1:N-ix+1)=attribute(ix:N,k);
    for j=1:ix-1
        if attribute(j,1)==1
           a(1)=a(1)+1;
        end
        if attribute(j,1)==2
           a(2)=a(2)+1;
        end
        if attribute(j,1)==3
           a(3)=a(3)+1;
        end
    end
    for j=ix:N
        if attribute(j,1)==1
           b(1)=b(1)+1;
        end
        if attribute(j,1)==2
           b(2)=b(2)+1;
        end
        if attribute(j,1)==3
           b(3)=b(3)+1;
        end
    end
    END1=-(a(1)/(ix-1)*mylog(a(1)/(ix-1))+a(2)/(ix-1)*mylog(a(2)/(ix-1))+a(2)/(ix-1)*mylog(a(2)/(ix-1)));
    END2=-(b(1)/(N-ix+1)*mylog(b(1)/(N-ix+1))+b(2)/(N-ix+1)*mylog(b(2)/(N-ix+1))+b(2)/(N-ix+1)*mylog(b(2)/(N-ix+1)));
    END=END0-(END1*(ix-1)/N+END2*(N-ix+1)/N);
    if END>gain
        gain=END;
        s=i;
    end
    a(1:3)=0;
    b(1:3)=0;
    
end
value=attri(s);
end




    