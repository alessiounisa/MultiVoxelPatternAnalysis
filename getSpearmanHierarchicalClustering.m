function[Z_Euclidean, clustered_data, distance] = getSpearmanHierarchicalClustering(matrix4cluster, clusterNum)
%author Simone Romano 0522500294
%this method return a matrix 3xk where:
%first 2 column are 2 point and last column their distance

matrix4cluster = matrix4cluster';
%getting euclidean dissimilartiy matrix
Y=pdist(matrix4cluster,'spearman'); 
distance=squareform(Y); %different view of distance   
%linkage
Z_Euclidean = linkage(Y, 'ward');
%figure('Name','Euclidean Hierarchical Linkage');
%dendrogram(Z_Euclidean,0);
%here cut to have cluster (100-200-300)
clustered_data = cluster(Z_Euclidean,'maxclust',clusterNum);