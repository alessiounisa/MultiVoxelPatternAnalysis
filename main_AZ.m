%author Simone Romano 0522500294
clear variables;
close all;
Subject = 'AZ'; % it can be 'AZ', 'GV' or 'JE';
maskPath = 'C:\Users\Simone\Google Drive\Magistrale_IntelligenzaComputazionale\IntelligenzaComputazionale\progetto\progetto neuroscienze\Data\AZ\AZ\AZ_Pre&PostCGsmall.msk';
outputPath = 'C:\Users\Simone\Google Drive\Magistrale_IntelligenzaComputazionale\IntelligenzaComputazionale\progetto\progetto neuroscienze\progetto_SimoneRomano_AlessioPetrozziello\matlab_code\extracted_data_AZ\';
% add Neuroelf to the path (change the path accordingly!
%addpath(genpath('../Toolboxes/NeuroElf_v10_4562'))
% adding Spider to the path (change the path accordingly!)
%addpath(genpath('./Toolboxes/spider'));
try
    % some initialization: getting the names of files, masks and the
    % parameters.
    NameFiles                       =  GV_getNameFiles_Salerno(Subject);
    Params                          =  GV_initializeParams_Salerno;
    
    
    % read data and protocols
    [Data,Params]                   = GV_importfMRIdata_Salerno(NameFiles,Params);
    [DM,Labels,Params]              = GV_importProtocol_Salerno(NameFiles,Params);
    % extract Trials
    [Trials]                        = GV_getTrials_Salerno(Data,Labels,Params);
catch
    % if for some reason the BV reader does not work or the data are not
    % accessible, all the data are here
    load([Subject '_data.mat']);
end


%this shows flow of operation by calling defined function.
delimiters1 = 2;
delimiters2 = 7;

%compression of Trials matrix
newTrials = dataCompression( Trials, delimiters1, delimiters2 );
%assembly of 96x2018 rows disperse in newTrials structures
matrix4cluster = assemblySingleData(newTrials);
%----------here split matrix4cluster to reserve 10 record for testing
%matrix4cluster = matrix4cluster(11:96,:);
%----------

%******************CLUSTERING******************%
%pam cluster spearman
[clusteredData_PAM_spearman_10,result_PAM_spearman_10,clusterCenterID_spearman_PAM_10] = clusteringSpearmanPAM(matrix4cluster, 10);
[clusteredData_PAM_spearman_20,result_PAM_spearman_20,clusterCenterID_spearman_PAM_20] = clusteringSpearmanPAM(matrix4cluster, 20);
[clusteredData_PAM_spearman_30,result_PAM_spearman_30,clusterCenterID_spearman_PAM_30] = clusteringSpearmanPAM(matrix4cluster, 30);
[clusteredData_PAM_spearman_40,result_PAM_spearman_40,clusterCenterID_spearman_PAM_40] = clusteringSpearmanPAM(matrix4cluster, 40);
[clusteredData_PAM_spearman_50,result_PAM_spearman_50,clusterCenterID_spearman_PAM_50] = clusteringSpearmanPAM(matrix4cluster, 50);
[clusteredData_PAM_spearman_60,result_PAM_spearman_60,clusterCenterID_spearman_PAM_60] = clusteringSpearmanPAM(matrix4cluster, 60);
[clusteredData_PAM_spearman_70,result_PAM_spearman_70,clusterCenterID_spearman_PAM_70] = clusteringSpearmanPAM(matrix4cluster, 70);
[clusteredData_PAM_spearman_80,result_PAM_spearman_80,clusterCenterID_spearman_PAM_80] = clusteringSpearmanPAM(matrix4cluster, 80);
[clusteredData_PAM_spearman_90,result_PAM_spearman_90,clusterCenterID_spearman_PAM_90] = clusteringSpearmanPAM(matrix4cluster, 90);
[clusteredData_PAM_spearman_100,result_PAM_spearman_100,clusterCenterID_spearman_PAM_100] = clusteringSpearmanPAM(matrix4cluster, 100);
%pam cluster pearson
[clusteredData_PAM_pearson_10,result_PAM_pearson_10,clusterCenterID_pearson_PAM_10] = clusteringPearsonPAM(matrix4cluster, 10);
[clusteredData_PAM_pearson_20,result_PAM_pearson_20,clusterCenterID_pearson_PAM_20] = clusteringPearsonPAM(matrix4cluster, 20);
[clusteredData_PAM_pearson_30,result_PAM_pearson_30,clusterCenterID_pearson_PAM_30] = clusteringPearsonPAM(matrix4cluster, 30);
[clusteredData_PAM_pearson_40,result_PAM_pearson_40,clusterCenterID_pearson_PAM_40] = clusteringPearsonPAM(matrix4cluster, 40);
[clusteredData_PAM_pearson_50,result_PAM_pearson_50,clusterCenterID_pearson_PAM_50] = clusteringPearsonPAM(matrix4cluster, 50);
[clusteredData_PAM_pearson_60,result_PAM_pearson_60,clusterCenterID_pearson_PAM_60] = clusteringPearsonPAM(matrix4cluster, 60);
[clusteredData_PAM_pearson_70,result_PAM_pearson_70,clusterCenterID_pearson_PAM_70] = clusteringPearsonPAM(matrix4cluster, 70);
[clusteredData_PAM_pearson_80,result_PAM_pearson_80,clusterCenterID_pearson_PAM_80] = clusteringPearsonPAM(matrix4cluster, 80);
[clusteredData_PAM_pearson_90,result_PAM_pearson_90,clusterCenterID_pearson_PAM_90] = clusteringPearsonPAM(matrix4cluster, 90);
[clusteredData_PAM_pearson_100,result_PAM_pearson_100,clusterCenterID_pearson_PAM_100] = clusteringPearsonPAM(matrix4cluster, 100);
%Hierarchical Pearson clustering
[Z_pearson_10, cluster_Hierarchical_Pearson_10, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 10);
[Z_pearson_20, cluster_Hierarchical_Pearson_20, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 20);
[Z_pearson_30, cluster_Hierarchical_Pearson_30, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 30);
[Z_pearson_40, cluster_Hierarchical_Pearson_40, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 40);
[Z_pearson_50, cluster_Hierarchical_Pearson_50, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 50);
[Z_pearson_60, cluster_Hierarchical_Pearson_60, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 60);
[Z_pearson_70, cluster_Hierarchical_Pearson_70, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 70);
[Z_pearson_80, cluster_Hierarchical_Pearson_80, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 80);
[Z_pearson_90, cluster_Hierarchical_Pearson_90, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 90);
[Z_pearson_100, cluster_Hierarchical_Pearson_100, dissimilarity_Pearson] = getPearsonHierarchicalClustering(matrix4cluster, 100);
%Hierarchical Spearman clustering
[Z_Spearman_10, cluster_Hierarchical_Spearman_10, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 10);
[Z_Spearman_20, cluster_Hierarchical_Spearman_20, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 20);
[Z_Spearman_30, cluster_Hierarchical_Spearman_30, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 30);
[Z_Spearman_40, cluster_Hierarchical_Spearman_40, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 40);
[Z_Spearman_50, cluster_Hierarchical_Spearman_50, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 50);
[Z_Spearman_60, cluster_Hierarchical_Spearman_60, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 60);
[Z_Spearman_70, cluster_Hierarchical_Spearman_70, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 70);
[Z_Spearman_80, cluster_Hierarchical_Spearman_80, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 80);
[Z_Spearman_90, cluster_Hierarchical_Spearman_90, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 90);
[Z_Spearman_100, cluster_Hierarchical_Spearman_100, dissimilarity_Spearman] = getSpearmanHierarchicalClustering(matrix4cluster, 100);

%******************GENERATION OF NeuroElf MAPS WITH CLUSTERED DATA******************%
%pam spearman maps
neuroElfVisualization(maskPath, result_PAM_spearman_10, strcat(outputPath,'MAP_cluster_PAM_Spearman_10'), 0);
neuroElfVisualization(maskPath, result_PAM_spearman_20, strcat(outputPath,'MAP_cluster_PAM_Spearman_20'), 0);
neuroElfVisualization(maskPath, result_PAM_spearman_30, strcat(outputPath,'MAP_cluster_PAM_Spearman_30'), 0);
neuroElfVisualization(maskPath, result_PAM_spearman_40, strcat(outputPath,'MAP_cluster_PAM_Spearman_40'), 0);
neuroElfVisualization(maskPath, result_PAM_spearman_50, strcat(outputPath,'MAP_cluster_PAM_Spearman_50'), 0);
% neuroElfVisualization(maskPath, result_PAM_spearman_60, strcat(outputPath,'MAP_cluster_PAM_Spearman_60'), 0);
% neuroElfVisualization(maskPath, result_PAM_spearman_70, strcat(outputPath,'MAP_cluster_PAM_Spearman_70'), 0);
% neuroElfVisualization(maskPath, result_PAM_spearman_80, strcat(outputPath,'MAP_cluster_PAM_Spearman_80'), 0);
% neuroElfVisualization(maskPath, result_PAM_spearman_90, strcat(outputPath,'MAP_cluster_PAM_Spearman_90'), 0);
% neuroElfVisualization(maskPath, result_PAM_spearman_100, strcat(outputPath,'MAP_cluster_PAM_Spearman_100'), 0);
%pam pearson maps
neuroElfVisualization(maskPath, result_PAM_pearson_10, strcat(outputPath,'MAP_cluster_PAM_Pearson_10'), 0);
neuroElfVisualization(maskPath, result_PAM_pearson_20, strcat(outputPath,'MAP_cluster_PAM_Pearson_20'), 0);
neuroElfVisualization(maskPath, result_PAM_pearson_30, strcat(outputPath,'MAP_cluster_PAM_Pearson_30'), 0);
neuroElfVisualization(maskPath, result_PAM_pearson_40, strcat(outputPath,'MAP_cluster_PAM_Pearson_40'), 0);
neuroElfVisualization(maskPath, result_PAM_pearson_50, strcat(outputPath,'MAP_cluster_PAM_Pearson_50'), 0);
% neuroElfVisualization(maskPath, result_PAM_pearson_60, strcat(outputPath,'MAP_cluster_PAM_Pearson_60'), 0);
% neuroElfVisualization(maskPath, result_PAM_pearson_70, strcat(outputPath,'MAP_cluster_PAM_Pearson_70'), 0);
% neuroElfVisualization(maskPath, result_PAM_pearson_80, strcat(outputPath,'MAP_cluster_PAM_Pearson_80'), 0);
% neuroElfVisualization(maskPath, result_PAM_pearson_90, strcat(outputPath,'MAP_cluster_PAM_Pearson_90'), 0);
% neuroElfVisualization(maskPath, result_PAM_pearson_100, strcat(outputPath,'MAP_cluster_PAM_Pearson_100'), 0);
%Hierarchical spearman maps
neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_10, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_10'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_20, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_20'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_30, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_30'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_40, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_40'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_50, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_50'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_60, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_60'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_70, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_70'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_80, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_80'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_90, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_90'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Spearman_100, strcat(outputPath,'MAP_cluster_Hierarchical_Spearman_100'), 0);
%Hierarchical pearson maps
neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_10, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_10'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_20, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_20'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_30, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_30'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_40, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_40'), 0);
neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_50, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_50'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_60, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_60'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_70, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_70'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_80, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_80'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_90, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_90'), 0);
% neuroElfVisualization(maskPath, cluster_Hierarchical_Pearson_100, strcat(outputPath,'MAP_cluster_Hierarchical_Pearson_100'), 0);

%******************EXTRACTION OF SELECTED ELEMENTS IN START MATRIX******************%
%pam spearman
newData_10_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_10);
newData_20_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_20);
newData_30_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_30);
newData_40_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_40);
newData_50_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_50);
newData_60_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_60);
newData_70_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_70);
newData_80_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_80);
newData_90_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_90);
newData_100_PAM_spearman = Data(:,clusterCenterID_spearman_PAM_100);
%pam pearson
newData_10_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_10);
newData_20_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_20);
newData_30_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_30);
newData_40_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_40);
newData_50_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_50);
newData_60_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_60);
newData_70_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_70);
newData_80_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_80);
newData_90_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_90);
newData_100_PAM_pearson = Data(:,clusterCenterID_pearson_PAM_100);
%linkage pearson
[clusterCeneterID_pearson_Linkage_10, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_10,'sum');
newData_10_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_10);
[clusterCeneterID_pearson_Linkage_20, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_20,'sum');
newData_20_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_20);
[clusterCeneterID_pearson_Linkage_30, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_30,'sum');
newData_30_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_30);
[clusterCeneterID_pearson_Linkage_40, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_40,'sum');
newData_40_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_40);
[clusterCeneterID_pearson_Linkage_50, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_50,'sum');
newData_50_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_50);
[clusterCeneterID_pearson_Linkage_60, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_60,'sum');
newData_60_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_60);
[clusterCeneterID_pearson_Linkage_70, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_70,'sum');
newData_70_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_70);
[clusterCeneterID_pearson_Linkage_80, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_80,'sum');
newData_80_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_80);
[clusterCeneterID_pearson_Linkage_90, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_90,'sum');
newData_90_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_90);
[clusterCeneterID_pearson_Linkage_100, meancorr] = medoids(dissimilarity_Pearson,cluster_Hierarchical_Pearson_100,'sum');
newData_100_Hierarchical_Pearson = Data(:,clusterCeneterID_pearson_Linkage_100);
%linkage spearman
[clusterCeneterID_spearman_Linkage_10, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_10,'sum');
newData_10_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_10);
[clusterCeneterID_spearman_Linkage_20, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_20,'sum');
newData_20_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_20);
[clusterCeneterID_spearman_Linkage_30, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_30,'sum');
newData_30_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_30);
[clusterCeneterID_spearman_Linkage_40, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_40,'sum');
newData_40_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_40);
[clusterCeneterID_spearman_Linkage_50, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_50,'sum');
newData_50_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_50);
[clusterCeneterID_spearman_Linkage_60, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_60,'sum');
newData_60_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_60);
[clusterCeneterID_spearman_Linkage_70, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_70,'sum');
newData_70_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_70);
[clusterCeneterID_spearman_Linkage_80, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_80,'sum');
newData_80_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_80);
[clusterCeneterID_spearman_Linkage_90, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_90,'sum');
newData_90_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_90);
[clusterCeneterID_spearman_Linkage_100, meancorr] = medoids(dissimilarity_Spearman,cluster_Hierarchical_Spearman_100,'sum');
newData_100_Hierarchical_Spearman = Data(:,clusterCeneterID_spearman_Linkage_100);

%STIMA EMODINAMICA
%from trials structure to 3dMatrix 96x8x2018
trials_as_3d_matrix = trialsTo3dMatrix(Trials); 
%-------PAM PEARSON-------%
%Pam Pearson 10 stima emodinamica
Pam_Pearson_10_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_10);  %96x8x10
Pam_Pearson_10_hemodynamic = mean(Pam_Pearson_10_3dMatrix,1);  %1x8x10
tmp = zeros(8,10);
tmp(:,:) = Pam_Pearson_10_hemodynamic(:,:,:);
Pam_Pearson_10_hemodynamic = tmp;
%Pam Pearson 20 stima emodinamica
Pam_Pearson_20_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_20);  %96x8x20
Pam_Pearson_20_hemodynamic = mean(Pam_Pearson_20_3dMatrix,1);  %1x8x20
tmp = zeros(8,20);
tmp(:,:) = Pam_Pearson_20_hemodynamic(:,:,:);
Pam_Pearson_20_hemodynamic = tmp;
%Pam Pearson 30 stima emodinamica
Pam_Pearson_30_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_30);  %96x8x30
Pam_Pearson_30_hemodynamic = mean(Pam_Pearson_30_3dMatrix,1);  %1x8x30
tmp = zeros(8,30);
tmp(:,:) = Pam_Pearson_30_hemodynamic(:,:,:);
Pam_Pearson_30_hemodynamic = tmp;
%Pam Pearson 40 stima emodinamica
Pam_Pearson_40_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_40);  %96x8x40
Pam_Pearson_40_hemodynamic = mean(Pam_Pearson_40_3dMatrix,1);  %1x8x40
tmp = zeros(8,40);
tmp(:,:) = Pam_Pearson_40_hemodynamic(:,:,:);
Pam_Pearson_40_hemodynamic = tmp;
%Pam Pearson 50 stima emodinamica
Pam_Pearson_50_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_50);  %96x8x50
Pam_Pearson_50_hemodynamic = mean(Pam_Pearson_50_3dMatrix,1);  %1x8x50
tmp = zeros(8,50);
tmp(:,:) = Pam_Pearson_50_hemodynamic(:,:,:);
Pam_Pearson_50_hemodynamic = tmp;
%Pam Pearson 60 stima emodinamica
Pam_Pearson_60_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_60);  %96x8x60
Pam_Pearson_60_hemodynamic = mean(Pam_Pearson_60_3dMatrix,1);  %1x8x60
tmp = zeros(8,60);
tmp(:,:) = Pam_Pearson_60_hemodynamic(:,:,:);
Pam_Pearson_60_hemodynamic = tmp;
%Pam Pearson 70 stima emodinamica
Pam_Pearson_70_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_70);  %96x8x70
Pam_Pearson_70_hemodynamic = mean(Pam_Pearson_70_3dMatrix,1);  %1x8x70
tmp = zeros(8,70);
tmp(:,:) = Pam_Pearson_70_hemodynamic(:,:,:);
Pam_Pearson_70_hemodynamic = tmp;
%Pam Pearson 80 stima emodinamica
Pam_Pearson_80_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_80);  %96x8x80
Pam_Pearson_80_hemodynamic = mean(Pam_Pearson_80_3dMatrix,1);  %1x8x80
tmp = zeros(8,80);
tmp(:,:) = Pam_Pearson_80_hemodynamic(:,:,:);
Pam_Pearson_80_hemodynamic = tmp;
%Pam Pearson 90 stima emodinamica
Pam_Pearson_90_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_90);  %96x8x90
Pam_Pearson_90_hemodynamic = mean(Pam_Pearson_90_3dMatrix,1);  %1x8x90
tmp = zeros(8,90);
tmp(:,:) = Pam_Pearson_90_hemodynamic(:,:,:);
Pam_Pearson_90_hemodynamic = tmp;
%Pam Pearson 90 stima emodinamica
Pam_Pearson_100_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_pearson_PAM_100);  %96x8x100
Pam_Pearson_100_hemodynamic = mean(Pam_Pearson_100_3dMatrix,1);  %1x8x100
tmp = zeros(8,100);
tmp(:,:) = Pam_Pearson_100_hemodynamic(:,:,:);
Pam_Pearson_100_hemodynamic = tmp;
%-------PAM SPEARMAN-------%
%Pam Spearman 10 stima emodinamica
Pam_Spearman_10_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_10);  %96x8x10
Pam_Spearman_10_hemodynamic = mean(Pam_Spearman_10_3dMatrix,1);  %1x8x10
tmp = zeros(8,10);
tmp(:,:) = Pam_Spearman_10_hemodynamic(:,:,:);
Pam_Spearman_10_hemodynamic = tmp;
%Pam Spearman 20 stima emodinamica
Pam_Spearman_20_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_20);  %96x8x20
Pam_Spearman_20_hemodynamic = mean(Pam_Spearman_20_3dMatrix,1);  %1x8x20
tmp = zeros(8,20);
tmp(:,:) = Pam_Spearman_20_hemodynamic(:,:,:);
Pam_Spearman_20_hemodynamic = tmp;
%Pam Spearman 30 stima emodinamica
Pam_Spearman_30_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_30);  %96x8x30
Pam_Spearman_30_hemodynamic = mean(Pam_Spearman_30_3dMatrix,1);  %1x8x30
tmp = zeros(8,30);
tmp(:,:) = Pam_Spearman_30_hemodynamic(:,:,:);
Pam_Spearman_30_hemodynamic = tmp;
%Pam Spearman 40 stima emodinamica
Pam_Spearman_40_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_40);  %96x8x40
Pam_Spearman_40_hemodynamic = mean(Pam_Spearman_40_3dMatrix,1);  %1x8x40
tmp = zeros(8,40);
tmp(:,:) = Pam_Spearman_40_hemodynamic(:,:,:);
Pam_Spearman_40_hemodynamic = tmp;
%Pam Spearman 50 stima emodinamica
Pam_Spearman_50_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_50);  %96x8x50
Pam_Spearman_50_hemodynamic = mean(Pam_Spearman_50_3dMatrix,1);  %1x8x50
tmp = zeros(8,50);
tmp(:,:) = Pam_Spearman_50_hemodynamic(:,:,:);
Pam_Spearman_50_hemodynamic = tmp;
%Pam Spearman 60 stima emodinamica
Pam_Spearman_60_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_60);  %96x8x60
Pam_Spearman_60_hemodynamic = mean(Pam_Spearman_60_3dMatrix,1);  %1x8x60
tmp = zeros(8,60);
tmp(:,:) = Pam_Spearman_60_hemodynamic(:,:,:);
Pam_Spearman_60_hemodynamic = tmp;
%Pam Spearman 70 stima emodinamica
Pam_Spearman_70_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_70);  %96x8x70
Pam_Spearman_70_hemodynamic = mean(Pam_Spearman_70_3dMatrix,1);  %1x8x70
tmp = zeros(8,70);
tmp(:,:) = Pam_Spearman_70_hemodynamic(:,:,:);
Pam_Spearman_70_hemodynamic = tmp;
%Pam Spearman 80 stima emodinamica
Pam_Spearman_80_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_80);  %96x8x80
Pam_Spearman_80_hemodynamic = mean(Pam_Spearman_80_3dMatrix,1);  %1x8x80
tmp = zeros(8,80);
tmp(:,:) = Pam_Spearman_80_hemodynamic(:,:,:);
Pam_Spearman_80_hemodynamic = tmp;
%Pam Spearman 90 stima emodinamica
Pam_Spearman_90_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_90);  %96x8x90
Pam_Spearman_90_hemodynamic = mean(Pam_Spearman_90_3dMatrix,1);  %1x8x90
tmp = zeros(8,90);
tmp(:,:) = Pam_Spearman_90_hemodynamic(:,:,:);
Pam_Spearman_90_hemodynamic = tmp;
%Pam Spearman 100 stima emodinamica
Pam_Spearman_100_3dMatrix = trials_as_3d_matrix(:,:,clusterCenterID_spearman_PAM_100);  %96x8x100
Pam_Spearman_100_hemodynamic = mean(Pam_Spearman_100_3dMatrix,1);  %1x8x100
tmp = zeros(8,100);
tmp(:,:) = Pam_Spearman_100_hemodynamic(:,:,:);
Pam_Spearman_100_hemodynamic = tmp;

%-------LINKAGE PEARSON-------%
%Linkage Pearson 10 stima emodinamica
Linkage_Pearson_10_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_10);  %96x8x10
Linkage_Pearson_10_hemodynamic = mean(Linkage_Pearson_10_3dMatrix,1);  %1x8x10
tmp = zeros(8,10);
tmp(:,:) = Linkage_Pearson_10_hemodynamic(:,:,:);
Linkage_Pearson_10_hemodynamic = tmp;
%Linkage Pearson 20 stima emodinamica
Linkage_Pearson_20_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_20);  %96x8x20
Linkage_Pearson_20_hemodynamic = mean(Linkage_Pearson_20_3dMatrix,1);  %1x8x20
tmp = zeros(8,20);
tmp(:,:) = Linkage_Pearson_20_hemodynamic(:,:,:);
Linkage_Pearson_20_hemodynamic = tmp;
%Linkage Pearson 30 stima emodinamica
Linkage_Pearson_30_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_30);  %96x8x30
Linkage_Pearson_30_hemodynamic = mean(Linkage_Pearson_30_3dMatrix,1);  %1x8x30
tmp = zeros(8,30);
tmp(:,:) = Linkage_Pearson_30_hemodynamic(:,:,:);
Linkage_Pearson_30_hemodynamic = tmp;
%Linkage Pearson 40 stima emodinamica
Linkage_Pearson_40_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_40);  %96x8x40
Linkage_Pearson_40_hemodynamic = mean(Linkage_Pearson_40_3dMatrix,1);  %1x8x40
tmp = zeros(8,40);
tmp(:,:) = Linkage_Pearson_40_hemodynamic(:,:,:);
Linkage_Pearson_40_hemodynamic = tmp;
%Linkage Pearson 50 stima emodinamica
Linkage_Pearson_50_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_50);  %96x8x50
Linkage_Pearson_50_hemodynamic = mean(Linkage_Pearson_50_3dMatrix,1);  %1x8x50
tmp = zeros(8,50);
tmp(:,:) = Linkage_Pearson_50_hemodynamic(:,:,:);
Linkage_Pearson_50_hemodynamic = tmp;
%Linkage Pearson 60 stima emodinamica
Linkage_Pearson_60_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_60);  %96x8x60
Linkage_Pearson_60_hemodynamic = mean(Linkage_Pearson_60_3dMatrix,1);  %1x8x60
tmp = zeros(8,60);
tmp(:,:) = Linkage_Pearson_60_hemodynamic(:,:,:);
Linkage_Pearson_60_hemodynamic = tmp;
%Linkage Pearson 70 stima emodinamica
Linkage_Pearson_70_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_70);  %96x8x70
Linkage_Pearson_70_hemodynamic = mean(Linkage_Pearson_70_3dMatrix,1);  %1x8x70
tmp = zeros(8,70);
tmp(:,:) = Linkage_Pearson_70_hemodynamic(:,:,:);
Linkage_Pearson_70_hemodynamic = tmp;
%Linkage Pearson 80 stima emodinamica
Linkage_Pearson_80_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_80);  %96x8x80
Linkage_Pearson_80_hemodynamic = mean(Linkage_Pearson_80_3dMatrix,1);  %1x8x80
tmp = zeros(8,80);
tmp(:,:) = Linkage_Pearson_80_hemodynamic(:,:,:);
Linkage_Pearson_80_hemodynamic = tmp;
%Linkage Pearson 90 stima emodinamica
Linkage_Pearson_90_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_90);  %96x8x90
Linkage_Pearson_90_hemodynamic = mean(Linkage_Pearson_90_3dMatrix,1);  %1x8x90
tmp = zeros(8,90);
tmp(:,:) = Linkage_Pearson_90_hemodynamic(:,:,:);
Linkage_Pearson_90_hemodynamic = tmp;
%Linkage Pearson 100 stima emodinamica
Linkage_Pearson_100_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_pearson_Linkage_100);  %96x8x100
Linkage_Pearson_100_hemodynamic = mean(Linkage_Pearson_100_3dMatrix,1);  %1x8x100
tmp = zeros(8,100);
tmp(:,:) = Linkage_Pearson_100_hemodynamic(:,:,:);
Linkage_Pearson_100_hemodynamic = tmp;
%-------LINKAGE SPEARMAN-------%
%Linkage Spearman 10 stima emodinamica
Linkage_Spearman_10_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_10);  %96x8x10
Linkage_Spearman_10_hemodynamic = mean(Linkage_Spearman_10_3dMatrix,1);  %1x8x10
tmp = zeros(8,10);
tmp(:,:) = Linkage_Spearman_10_hemodynamic(:,:,:);
Linkage_Spearman_10_hemodynamic = tmp;
%Linkage Spearman 20 stima emodinamica
Linkage_Spearman_20_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_20);  %96x8x20
Linkage_Spearman_20_hemodynamic = mean(Linkage_Spearman_20_3dMatrix,1);  %1x8x20
tmp = zeros(8,20);
tmp(:,:) = Linkage_Spearman_20_hemodynamic(:,:,:);
Linkage_Spearman_20_hemodynamic = tmp;
%Linkage Spearman 30 stima emodinamica
Linkage_Spearman_30_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_30);  %96x8x30
Linkage_Spearman_30_hemodynamic = mean(Linkage_Spearman_30_3dMatrix,1);  %1x8x30
tmp = zeros(8,30);
tmp(:,:) = Linkage_Spearman_30_hemodynamic(:,:,:);
Linkage_Spearman_30_hemodynamic = tmp;
%Linkage Spearman 40 stima emodinamica
Linkage_Spearman_40_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_40);  %96x8x40
Linkage_Spearman_40_hemodynamic = mean(Linkage_Spearman_40_3dMatrix,1);  %1x8x40
tmp = zeros(8,40);
tmp(:,:) = Linkage_Spearman_40_hemodynamic(:,:,:);
Linkage_Spearman_40_hemodynamic = tmp;
%Linkage Spearman 50 stima emodinamica
Linkage_Spearman_50_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_50);  %96x8x50
Linkage_Spearman_50_hemodynamic = mean(Linkage_Spearman_50_3dMatrix,1);  %1x8x50
tmp = zeros(8,50);
tmp(:,:) = Linkage_Spearman_50_hemodynamic(:,:,:);
Linkage_Spearman_50_hemodynamic = tmp;
%Linkage Spearman 60 stima emodinamica
Linkage_Spearman_60_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_60);  %96x8x60
Linkage_Spearman_60_hemodynamic = mean(Linkage_Spearman_60_3dMatrix,1);  %1x8x60
tmp = zeros(8,60);
tmp(:,:) = Linkage_Spearman_60_hemodynamic(:,:,:);
Linkage_Spearman_60_hemodynamic = tmp;
%Linkage Spearman 70 stima emodinamica
Linkage_Spearman_70_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_70);  %96x8x70
Linkage_Spearman_70_hemodynamic = mean(Linkage_Spearman_70_3dMatrix,1);  %1x8x70
tmp = zeros(8,70);
tmp(:,:) = Linkage_Spearman_70_hemodynamic(:,:,:);
Linkage_Spearman_70_hemodynamic = tmp;
%Linkage Spearman 80 stima emodinamica
Linkage_Spearman_80_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_80);  %96x8x80
Linkage_Spearman_80_hemodynamic = mean(Linkage_Spearman_80_3dMatrix,1);  %1x8x80
tmp = zeros(8,80);
tmp(:,:) = Linkage_Spearman_80_hemodynamic(:,:,:);
Linkage_Spearman_80_hemodynamic = tmp;
%Linkage Spearman 90 stima emodinamica
Linkage_Spearman_90_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_90);  %96x8x90
Linkage_Spearman_90_hemodynamic = mean(Linkage_Spearman_90_3dMatrix,1);  %1x8x90
tmp = zeros(8,90);
tmp(:,:) = Linkage_Spearman_90_hemodynamic(:,:,:);
Linkage_Spearman_90_hemodynamic = tmp;
%Linkage Spearman 100 stima emodinamica
Linkage_Spearman_100_3dMatrix = trials_as_3d_matrix(:,:,clusterCeneterID_spearman_Linkage_100);  %96x8x100
Linkage_Spearman_100_hemodynamic = mean(Linkage_Spearman_100_3dMatrix,1);  %1x8x100
tmp = zeros(8,100);
tmp(:,:) = Linkage_Spearman_100_hemodynamic(:,:,:);
Linkage_Spearman_100_hemodynamic = tmp;

%PLOT hemodynamic to pdf
set(gcf, 'PaperPositionMode', 'auto'); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [20 20]); %Set the paper to have width 5 and height 5.
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperType', 'A4');

plot(Pam_Pearson_10_hemodynamic);
title('Pam Pearson 10 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_10_hemodynamic'), 'pdf'); %Save figur
plot([Pam_Pearson_10_hemodynamic Trials(1).HRF]);
title('Pam Pearson 10 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_10_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Pearson_20_hemodynamic);
title('Pam Pearson 20 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_20_hemodynamic'), 'pdf'); %Save figure
plot(Pam_Pearson_20_hemodynamic);
title('Pam Pearson 20 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_20_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Pearson_30_hemodynamic);
title('Pam Pearson 30 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_30_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Pearson_30_hemodynamic Trials(1).HRF]);
title('Pam Pearson 30 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_30_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Pearson_40_hemodynamic);
title('Pam Pearson 40 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_40_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Pearson_40_hemodynamic Trials(1).HRF]);
title('Pam Pearson 40 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_40_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Pearson_50_hemodynamic);
title('Pam Pearson 50 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_50_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Pearson_50_hemodynamic Trials(1).HRF]);
title('Pam Pearson 50 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Pearson_50_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Spearman_10_hemodynamic);
title('Pam Spearman 10 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_10'), 'pdf'); %Save figure
plot([Pam_Spearman_10_hemodynamic Trials(1).HRF]);
title('Pam Spearman 10 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_10_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Spearman_20_hemodynamic);
title('Pam Spearman 20 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_20_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Spearman_20_hemodynamic Trials(1).HRF]);
title('Pam Spearman 20 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_20_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Spearman_30_hemodynamic);
title('Pam Spearman 30 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_30_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Spearman_30_hemodynamic Trials(1).HRF]);
title('Pam Spearman 30 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_30_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Spearman_40_hemodynamic);
title('Pam Spearman 40 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_40_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Spearman_40_hemodynamic Trials(1).HRF]);
title('Pam Spearman 40 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_40_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Pam_Spearman_50_hemodynamic);
title('Pam Spearman 50 hemodynamic');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_50_hemodynamic'), 'pdf'); %Save figure
plot([Pam_Spearman_50_hemodynamic Trials(1).HRF]);
title('Pam Spearman 50 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Pam_Spearman_50_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Pearson_10_hemodynamic);
title('Linkage Pearson 10 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_10_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Pearson_10_hemodynamic Trials(1).HRF]);
title('Linkage Pearson 10 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_10_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Pearson_20_hemodynamic);
title('Linkage Pearson 20 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_20_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Pearson_20_hemodynamic Trials(1).HRF]);
title('Linkage Pearson 20 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_20_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Pearson_30_hemodynamic);
title('Linkage Pearson 30 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_30_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Pearson_30_hemodynamic Trials(1).HRF]);
title('Linkage Pearson 30 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_30_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Pearson_40_hemodynamic);
title('Linkage Pearson 40 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_40_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Pearson_40_hemodynamic Trials(1).HRF]);
title('Linkage Pearson 40 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_40_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Pearson_50_hemodynamic);
title('Linkage Pearson 50 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_50_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Pearson_50_hemodynamic Trials(1).HRF]);
title('Linkage Pearson 50 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Pearson_50_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Spearman_10_hemodynamic);
title('Linkage Spearman 10 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_10_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Spearman_10_hemodynamic Trials(1).HRF]);
title('Linkage Spearman 10 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_10_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Spearman_20_hemodynamic);
title('Linkage Spearman 20 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_20_hemodynamic'), 'pdf'); %Save figures
plot([Linkage_Spearman_20_hemodynamic Trials(1).HRF]);
title('Linkage Spearman 20 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_20_hemodynamic_with_standard'), 'pdf'); %Save figures

plot(Linkage_Spearman_30_hemodynamic);
title('Linkage Spearman 30 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_30_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Spearman_30_hemodynamic Trials(1).HRF]);
title('Linkage Spearman 30 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_30_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Spearman_40_hemodynamic);
title('Linkage Spearman 40 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_40_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Spearman_40_hemodynamic Trials(1).HRF]);
title('Linkage Spearman 40 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_40_hemodynamic_with_standard'), 'pdf'); %Save figure

plot(Linkage_Spearman_50_hemodynamic);
title('Linkage Spearman 50 hemodynamic');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_50_hemodynamic'), 'pdf'); %Save figure
plot([Linkage_Spearman_50_hemodynamic Trials(1).HRF]);
title('Linkage Spearman 50 hemodynamic - with standard');
saveas(gcf, strcat(outputPath, 'Linkage_Spearman_50_hemodynamic_with_standard'), 'pdf'); %Save figure

%**************CLASSIFICATION**************%
%Meanwhile to hemodynamic estimation has been
%used start matrix with only cluster centroid,
%to execute classification will be used again
%compress matrix(96xk).
Pam_Pearson_10_compressMatrix = matrix4cluster(:,clusterCenterID_pearson_PAM_10);
Pam_Pearson_20_compressMatrix = matrix4cluster(:,clusterCenterID_pearson_PAM_20);
Pam_Pearson_30_compressMatrix = matrix4cluster(:,clusterCenterID_pearson_PAM_30);
Pam_Pearson_40_compressMatrix = matrix4cluster(:,clusterCenterID_pearson_PAM_40);
Pam_Pearson_50_compressMatrix = matrix4cluster(:,clusterCenterID_pearson_PAM_50);
Pam_Spearman_10_compressMatrix = matrix4cluster(:,clusterCenterID_spearman_PAM_10);
Pam_Spearman_20_compressMatrix = matrix4cluster(:,clusterCenterID_spearman_PAM_20);
Pam_Spearman_30_compressMatrix = matrix4cluster(:,clusterCenterID_spearman_PAM_30);
Pam_Spearman_40_compressMatrix = matrix4cluster(:,clusterCenterID_spearman_PAM_40);
Pam_Spearman_50_compressMatrix = matrix4cluster(:,clusterCenterID_spearman_PAM_50);
Linkage_Pearson_10_compressMatrix = matrix4cluster(:,clusterCeneterID_pearson_Linkage_10);
Linkage_Pearson_20_compressMatrix = matrix4cluster(:,clusterCeneterID_pearson_Linkage_20);
Linkage_Pearson_30_compressMatrix = matrix4cluster(:,clusterCeneterID_pearson_Linkage_30);
Linkage_Pearson_40_compressMatrix = matrix4cluster(:,clusterCeneterID_pearson_Linkage_40);
Linkage_Pearson_50_compressMatrix = matrix4cluster(:,clusterCeneterID_pearson_Linkage_50);
Linkage_Spearman_10_compressMatrix = matrix4cluster(:,clusterCeneterID_spearman_Linkage_10);
Linkage_Spearman_20_compressMatrix = matrix4cluster(:,clusterCeneterID_spearman_Linkage_20);
Linkage_Spearman_30_compressMatrix = matrix4cluster(:,clusterCeneterID_spearman_Linkage_30);
Linkage_Spearman_40_compressMatrix = matrix4cluster(:,clusterCeneterID_spearman_Linkage_40);
Linkage_Spearman_50_compressMatrix = matrix4cluster(:,clusterCeneterID_spearman_Linkage_50);

%SVM CLASSIFICATION - matlab functions
% [svm_pam_pearson_10, pred_pam_pearson_10] = kfoldAndSvm_Classification(Pam_Pearson_10_compressMatrix, Labels);
% [svm_pam_pearson_20, pred_pam_pearson_20] = kfoldAndSvm_Classification(Pam_Pearson_20_compressMatrix, Labels);
% [svm_pam_pearson_30, pred_pam_pearson_30] = kfoldAndSvm_Classification(Pam_Pearson_30_compressMatrix, Labels);
% [svm_pam_pearson_40, pred_pam_pearson_40] = kfoldAndSvm_Classification(Pam_Pearson_40_compressMatrix, Labels);
% [svm_pam_pearson_50, pred_pam_pearson_50] = kfoldAndSvm_Classification(Pam_Pearson_50_compressMatrix, Labels);
% 
% [svm_pam_spearman_10, pred_pam_spearman_10] = kfoldAndSvm_Classification(Pam_Spearman_10_compressMatrix, Labels);
% [svm_pam_spearman_20, pred_pam_spearman_20] = kfoldAndSvm_Classification(Pam_Spearman_20_compressMatrix, Labels);
% [svm_pam_spearman_30, pred_pam_spearman_30] = kfoldAndSvm_Classification(Pam_Spearman_30_compressMatrix, Labels);
% [svm_pam_spearman_40, pred_pam_spearman_40] = kfoldAndSvm_Classification(Pam_Spearman_40_compressMatrix, Labels);
% [svm_pam_spearman_50, pred_pam_spearman_50] = kfoldAndSvm_Classification(Pam_Spearman_50_compressMatrix, Labels);
% 
% [svm_linkage_pearson_10, pred_linkage_pearson_10] = kfoldAndSvm_Classification(Linkage_Pearson_10_compressMatrix, Labels);
% [svm_linkage_pearson_20, pred_linkage_pearson_20] = kfoldAndSvm_Classification(Linkage_Pearson_20_compressMatrix, Labels);
% [svm_linkage_pearson_30, pred_linkage_pearson_30] = kfoldAndSvm_Classification(Linkage_Pearson_30_compressMatrix, Labels);
% [svm_linkage_pearson_40, pred_linkage_pearson_40] = kfoldAndSvm_Classification(Linkage_Pearson_40_compressMatrix, Labels);
% [svm_linkage_pearson_50, pred_linkage_pearson_50] = kfoldAndSvm_Classification(Linkage_Pearson_40_compressMatrix, Labels);
% 
% [svm_linkage_spearman_10, pred_linkage_spearman_10] = kfoldAndSvm_Classification(Linkage_Spearman_10_compressMatrix, Labels);
% [svm_linkage_spearman_20, pred_linkage_spearman_20] = kfoldAndSvm_Classification(Linkage_Spearman_20_compressMatrix, Labels);
% [svm_linkage_spearman_30, pred_linkage_spearman_30] = kfoldAndSvm_Classification(Linkage_Spearman_30_compressMatrix, Labels);
% [svm_linkage_spearman_40, pred_linkage_spearman_40] = kfoldAndSvm_Classification(Linkage_Spearman_40_compressMatrix, Labels);
% [svm_linkage_spearman_50, pred_linkage_spearman_50] = kfoldAndSvm_Classification(Linkage_Spearman_50_compressMatrix, Labels);

%GV classifier
[X]                             = GV_extractFeatures_Salerno(Trials,Splits,Params);
% classify GV
[Results]                       = GV_classifyCrossVal_Salerno(X,Labels,Splits);
GV_mean_err = [Results.mean_err Results.mean_err Results.mean_err Results.mean_err Results.mean_err]';

%SVM CLASSIFICATION - script Giancarlo Valente - LINEAR KERNEL
[Splits]                        = GV_createSplits_Salerno(Labels,Params);
for i=10:10:50
    eval(sprintf('svm_GV_pam_pearson_%d = GV_classifyCrossVal_Salerno(Pam_Pearson_%d_compressMatrix, Labels, Splits);', i, i));
    eval(sprintf('svm_GV_pam_spearman_%d = GV_classifyCrossVal_Salerno(Pam_Spearman_%d_compressMatrix, Labels, Splits);', i, i));
    eval(sprintf('svm_GV_linkage_pearson_%d = GV_classifyCrossVal_Salerno(Linkage_Pearson_%d_compressMatrix, Labels, Splits);', i, i));
    eval(sprintf('svm_GV_linkage_spearman_%d = GV_classifyCrossVal_Salerno(Linkage_Spearman_%d_compressMatrix, Labels, Splits);', i, i));
end

%SVM CLASSIFICATION - with FEATURES SELECTION
FEATURES_PERCENTAGE = 20;   %percentage of features to use for features selection (es. 20% of 96x10 = 96x2)

%RBF KERNEL
kernel = 'rbf';    %since we have few features we use non-linear kernel
for i=10:10:50
    eval(sprintf('[svm_pam_pearson_%s_%d_FS, featuresHistory_svm_pam_pearson_%s_%d_FS] = my_GV_classifyCrossVal_Salerno(Pam_Pearson_%d_compressMatrix, Labels, Splits, FEATURES_PERCENTAGE, kernel);',kernel,i,kernel,i,i));     
    eval(sprintf('[svm_pam_spearman_%s_%d_FS, featuresHistory_svm_pam_spearman_%s_%d_FS]  = my_GV_classifyCrossVal_Salerno(Pam_Spearman_%d_compressMatrix, Labels, Splits, FEATURES_PERCENTAGE, kernel);',kernel,i,kernel,i,i));     
    eval(sprintf('[svm_linkage_pearson_%s_%d_FS, featuresHistory_svm_linkage_pearson_%s_%d_FS] = my_GV_classifyCrossVal_Salerno(Linkage_Pearson_%d_compressMatrix, Labels, Splits, FEATURES_PERCENTAGE, kernel);',kernel,i,kernel,i,i));     
    eval(sprintf('[svm_linkage_spearman_%s_%d_FS, featuresHistory_svm_linkage_spearman_%s_%d_FS] = my_GV_classifyCrossVal_Salerno(Linkage_Spearman_%d_compressMatrix, Labels, Splits, FEATURES_PERCENTAGE, kernel);',kernel,i,kernel,i,i)); 
end

%-----------------Errors plot-----------------%
%PAM PEARSON
figure(1)
timeVector_pam_pearson = zeros(1,5)';
for i=1:5
    eval(sprintf('timeVector_pam_pearson(i,1) = svm_GV_pam_pearson_%d.mean_err;',i*10));
end
timeVector_pam_pearson_FS = zeros(1,5);
for i=1:5
    eval(sprintf('timeVector_pam_pearson_FS(i,1) = svm_pam_pearson_%s_%d_FS.mean_err;',kernel,i*10));
end
%PAM SPEARMAN
figure(2)
timeVector_pam_spearman = zeros(1,5)';
for i=1:5
    eval(sprintf('timeVector_pam_spearman(i,1) = svm_GV_pam_spearman_%d.mean_err;',i*10));
end
timeVector_pam_spearman_FS = zeros(1,5);
for i=1:5
    eval(sprintf('timeVector_pam_spearman_FS(i,1) = svm_pam_spearman_%s_%d_FS.mean_err;',kernel,i*10));
end
%LINKAGE PEARSON
figure(3)
timeVector_linkage_pearson = zeros(1,5)';
for i=1:5
    eval(sprintf('timeVector_linkage_pearson(i,1) = svm_GV_linkage_pearson_%d.mean_err;',i*10));
end
timeVector_linkage_pearson_FS = zeros(1,5);
for i=1:5
    eval(sprintf('timeVector_linkage_pearson_FS(i,1) = svm_linkage_pearson_%s_%d_FS.mean_err;',kernel,i*10));
end
%LINKAGE SPEARMAN
figure(4)
timeVector_linkage_spearman = zeros(1,5)';
for i=1:5
    eval(sprintf('timeVector_linkage_spearman(i,1) = svm_GV_linkage_spearman_%d.mean_err;',i*10));
end
timeVector_linkage_spearman_FS = zeros(1,5);
for i=1:5
    eval(sprintf('timeVector_linkage_spearman_FS(i,1) = svm_linkage_spearman_%s_%d_FS.mean_err;',kernel,i*10));
end

%PAM PEARSON
bar(10:10:50,[timeVector_pam_pearson, timeVector_pam_pearson_FS(:,1), GV_mean_err]);
legend('pam pearson', sprintf('pam pearson FS %s', kernel), 'GV err');
axis([0 60 0 1]);
title('Error Pam Perason');
xlabel('cluster num');
ylabel('err value');
saveas(gcf, strcat(outputPath, sprintf('Pam_Pearson_classification_error_%s',kernel)), 'pdf'); %Save figure
%PAM SPEARMAN
bar(10:10:50,[timeVector_pam_spearman, timeVector_pam_spearman_FS(:,1), GV_mean_err]);
legend('pam spearman', sprintf('pam spearman FS %s', kernel), 'GV err');
axis([0 60 0 1]);
title('Error Pam Spearman');
xlabel('cluster num');
ylabel('err value');
saveas(gcf, strcat(outputPath, sprintf('Pam_Spearman_classification_error_%s',kernel)), 'pdf'); %Save figure
%LINKAGE PEARSON
bar(10:10:50,[timeVector_linkage_pearson, timeVector_linkage_pearson_FS(:,1), GV_mean_err]);
legend('linkage pearson', sprintf('linkage pearson FS %s', kernel), 'GV err');
axis([0 60 0 1]);
title('Error Linkage Pearson');
xlabel('cluster num');
ylabel('err value');
saveas(gcf, strcat(outputPath, sprintf('Linkage_Pearson_classification_error_%s',kernel)), 'pdf'); %Save figure
%LINKAGE SPEARMAN
bar(10:10:50,[timeVector_linkage_spearman, timeVector_linkage_spearman_FS(:,1), GV_mean_err]);
legend('linkage spearman', sprintf('linkage spearman FS %s', kernel), 'GV err');
axis([0 60 0 1]);
title('Error Linkage Spearman');
xlabel('cluster num');
ylabel('err value');
saveas(gcf, strcat(outputPath, sprintf('Linkage_Spearman_classification_error_%s',kernel)), 'pdf'); %Save figure