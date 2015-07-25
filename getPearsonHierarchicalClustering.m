function[Z_pearson, clustered_data, distance] = getPearsonHierarchicalClustering(matrix4cluster, clusterNum)
%author Simone Romano 0522500294

Y = corr(matrix4cluster);   %Pearson by default
Y = 1-Y;
distance = Y; %different view of distance   
Z_pearson = linkage(Y,'ward');
%figure('Name','Pearson Hierarchical Linkage');
%dendrogram(Z_pearson,0)
%here cut to have cluster (100-200-300)
clustered_data = cluster(Z_pearson,'maxclust',clusterNum);