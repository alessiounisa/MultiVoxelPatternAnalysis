function [cLBest,maxJ] = myFeatureSelection(matrix,Labels,featuresNum)
%author Simone Romano 0522500294

class1 = matrix(find(Labels(:,1)==2),:);
class2 = matrix(find(Labels(:,1)==3),:);
 
[cLBest,maxJ]=SequentialBackwardSelection(class1',class2','ScatterMatrices',featuresNum);