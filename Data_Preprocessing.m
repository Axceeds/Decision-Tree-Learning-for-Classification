clear
clc
% 整理iris数据集

% f=fopen('iris.txt');
f=fopen('iris.data');% 打开文件
data=textscan(f,'%f,%f,%f,%f,%s'); % 读取数据

D=[];% D中存放属性值
for i=1:length(data)-1
    D=[D data{1,i}];
end
fclose(f);


lable=data{1,length(data)};
n1=0;n2=0;n3=0;
% 找到每类数据的索引
for j=1:length(lable)
   if strcmp(lable{j,1},'Iris-setosa')
       n1=n1+1;
       index_1(n1)=j;% 记录下属于“Iris-setosa”类的索引
       
   elseif strcmp(lable{j,1},'Iris-versicolor')
       n2=n2+1;
       index_2(n2)=j;
       
   elseif strcmp(lable{j,1},'Iris-virginica')
       n3=n3+1;
       index_3(n3)=j;
       
   end
end

% 按照索引取出每类数据，重新组合
class_1=D(index_1,:);
class_2=D(index_2,:);
class_3=D(index_3,:);
Attributes=[class_1;class_2;class_3];

I=[1*ones(n1,1);2*ones(n2,1);3*ones(n3,1)];
Iris=[I Attributes];% 为各类添加数字标记


%save Iris.mat Iris % 保存.mat文件
save Iris -ascii Iris; % 保存data文件


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