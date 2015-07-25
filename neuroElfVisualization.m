function[] = neuroElfVisualization(maskPath, cluster_Matirx, outputPath, openGuiNeuroelf)
%author Simone Romano 0522500294
%This function will generate '.vmp' map visualizable
%from neuroelf tool.

%cluster_Hierarchical_Pearson_100
clusterMapIC(cluster_Matirx, maskPath, outputPath)
if openGuiNeuroelf 
    neuroelf_gui
end