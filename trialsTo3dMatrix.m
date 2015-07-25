function [ trials_as_3d_matrix ] = trialsTo3dMatrix( trials )

%getting voxel num 
vox_num = size(trials(1).Data);
vox_num = vox_num(2);
trials_as_3d_matrix = zeros(96,8,vox_num); %2018 per JE; 2777 per GV; 2093 per AZ
trialsLen = size(trials);
trialsLen = trialsLen(2);
for i=1:trialsLen
    firstExp = trials(1,i);
    matrix = firstExp(1).Data;
    trials_as_3d_matrix(i,:,:) = matrix;
end