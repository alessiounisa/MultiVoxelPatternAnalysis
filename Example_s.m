%% from struct 1x96 to first element(struct 1x8)
firstExp = Trials(1,1)
%% first element of firstExp is a struct 1x2018
%% to export it to a matrix:
matrix = firstExp(1).Data