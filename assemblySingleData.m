function [ matrix4Cluster ] = assemblySingleData(newTrials)
    %author Simone Romano 0522500294    
    %This method gets the "Data" elements(1x2018) of each of 96 newTrials
    %structures. It assemblys this element by creating new matrix 96x2018.

    matrix4Cluster = newTrials(1,1).Data;
    newTrialsSize = size(newTrials);
    newTrialsSize = newTrialsSize(2);
    for i=2:newTrialsSize
        matrix4Cluster = [newTrials(1,i).Data; matrix4Cluster];
    end
end