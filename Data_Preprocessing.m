clear
clc
% ����iris���ݼ�

% f=fopen('iris.txt');
f=fopen('iris.data');% ���ļ�
data=textscan(f,'%f,%f,%f,%f,%s'); % ��ȡ����

D=[];% D�д������ֵ
for i=1:length(data)-1
    D=[D data{1,i}];
end
fclose(f);


lable=data{1,length(data)};
n1=0;n2=0;n3=0;
% �ҵ�ÿ�����ݵ�����
for j=1:length(lable)
   if strcmp(lable{j,1},'Iris-setosa')
       n1=n1+1;
       index_1(n1)=j;% ��¼�����ڡ�Iris-setosa���������
       
   elseif strcmp(lable{j,1},'Iris-versicolor')
       n2=n2+1;
       index_2(n2)=j;
       
   elseif strcmp(lable{j,1},'Iris-virginica')
       n3=n3+1;
       index_3(n3)=j;
       
   end
end

% ��������ȡ��ÿ�����ݣ��������
class_1=D(index_1,:);
class_2=D(index_2,:);
class_3=D(index_3,:);
Attributes=[class_1;class_2;class_3];

I=[1*ones(n1,1);2*ones(n2,1);3*ones(n3,1)];
Iris=[I Attributes];% Ϊ����������ֱ��


%save Iris.mat Iris % ����.mat�ļ�
save Iris -ascii Iris; % ����data�ļ�


f=fopen('iris.txt','w');
[m,n]=size(Iris);
for i=1:m
    for j=1:n
        if j==n
            fprintf(f,'%g \n',Iris(i,j));
        else
             fprintf(f,'%g,',Iris(i,j));
        end
    end
end

fclose(f);


% save iris.txt -ascii Iris 
% dlmwrite('iris.txt',Iris);