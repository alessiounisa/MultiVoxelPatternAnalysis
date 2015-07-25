function [ clusteredData,result,clusterCenter_id ] = clusteringPearsonPAM(matrix4cluster, numberOfCluster)
    %author Simone Romano 0522500294
    %This method does a cluster on the input matrix4cluster(96x2018).
    %It returns a 96x200 matrix.
    
    [result,clusteredData,sumd,x,clusterCenter_id] = kmedoids(matrix4cluster', numberOfCluster, 'Algorithm', 'pam', 'Distance', 'correlation');
    clusteredData = clusteredData';
end