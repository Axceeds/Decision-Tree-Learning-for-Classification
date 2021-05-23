clear;
clc;
%读取处理完的数据
iris_data=load('iris.txt');
attribute(:,1:5)=iris_data(:,1:5);%特征
%特征按照从小
%由于本人水平有限，递归出高精度的决策树暂时无法实现，这里手动构建决策树
C=cell(1,10);
V=cell(1,10);
K=cell(1,10);
E=cell(1,10);
G=cell(1,10);
C{1,1}=attribute;
%第一层 C{1,1}
[G{1,1} V{1,1} K{1,1}]=entropy(C{1,1});
[C{1,2} C{1,3}]=process_attribute(C{1,1},K{1,1},V{1,1});
%第二层 C{1,2}全为第一类不须再分 C{1,3}可以再分
[G{1,2} V{1,2} K{1,2}]=entropy(C{1,3});
[C{1,4} C{1,5}]=process_attribute(C{1,1},K{1,2},V{1,2});
%第三层 C{1,4}可以再分 C{1,5}可以再分
[G{1,3} V{1,3} K{1,3}]=entropy(C{1,4});
[C{1,6} C{1,7}]=process_attribute(C{1,4},K{1,3},V{1,3});
%第四层 C{1,6} C{1,7}不用再分，可以直接为1、2类
[G{1,4} V{1,4} K{1,4}]=entropy(C{1,7});
[C{1,8} C{1,9}]=process_attribute(C{1,7},K{1,4},V{1,4});
%第三层 C{1,5}不用再分 为第三类
%[G{1,5} V{1,5} K{1,5}]=entropy(C{1,5});
num171=sum(C{1,7}(:,1)==1)
num172=sum(C{1,7}(:,1)==2)
num173=sum(C{1,7}(:,1)==3)
num151=sum(C{1,5}(:,1)==1)
num152=sum(C{1,5}(:,1)==2)
num153=sum(C{1,5}(:,1)==3)

treeVec = [0 1 1 3 3 4 4];
treeplot(treeVec);
 count = size(treeVec,2);
 [x,y] = treelayout(treeVec);
 x = x';
 y = y';
 s=[V{1,1}(1,1),1,V{1,2}(1,1),V{1,3}(1,1),3,1,2]
 name1 = cellstr(num2str(s'));
 text(x(:,1),y(:,1),name1,'VerticalAlignment','bottom','HorizontalAlignment','right');







