function [results, selected_features_history] = my_GV_classifyCrossVal_Salerno(X,Labels,splits, FEATURES_PERCENTAGE, kernel)
% Simone Romano - 0522500294 - sromano41@studenti.unisa.it
% This function differs from to GV_classifyCrossVal_Salerno
% by adding FEATURES_PERCENTAGE parameter and for 'kernel'
% parameter that allows you to select different svm kernel
% (default is linear).
% KERNEL               PARAMETERS &  DESCRIPTION
%  linear                             k(x,y)=x.y
%  poly                poly degree d, k(x,y)=(x.y+1)^d
%  rbf                 sigma,         k(x,y)=exp(-|x-y|^2/(2*sigma^2))
%  Gaussian            sigma,         k(x,y)=1/(2*pi^(N/2)*sqrt(sigma)) exp(..)
%  kmgraph             gamma,         marginalized kernel for graphs
%  spikernel                          kernel for spike trains
% 
%  weighted_linear     scale fact. w, k(x,y)=sum w_i^2 x_i y_i
%  weighted_poly       scale fact. w, k(x,y)=(sum w_i^2 x_i y_i+1)^d
%
%  rbf_of_dist         rbf kernel applied to an input distance matrix
%  poly_of_ker         poly kernel applied to an input kernel matrix
%
%  template_kernel     example to help make your own kernel 
%  custom              takes values from indices of matrix (kerparam)
%  custom_fast         takes values from global variable K 
%
% First to apply classification, for each split is applied
% features selection algorithm (SequentialBackwardSelection)
% selectioning percentage equals to FEATURES_PERCENTAGE of
% features in matrix X.
% Best resulting features are selected on training test
% and used in testing set.
%

Labelsgroup         = Labels(:,1);
Labelsgroup(Labelsgroup==4) = 0;


UniqueLabels        =  setdiff(unique(Labelsgroup),0);

err                 = zeros(numel(splits),1);
err1                = zeros(numel(splits),1);
err2                = zeros(numel(splits),1);
test_size           = zeros(numel(splits),1);
test_size1          = zeros(numel(splits),1);
test_size2          = zeros(numel(splits),1);
%calculating FEATURES_NUM as FEATURES_PERCENTAGE
FEATURES_NUM = round(size(X,2)/100*FEATURES_PERCENTAGE);
temp_model_weights  = zeros(FEATURES_NUM,length(splits));
%creating matrix for record selected features for each split
selected_features_history = zeros(numel(splits), FEATURES_NUM);

for ind             = 1: numel(splits)
%     fprintf('.');
    if size(X,3)==1
        [cLBest,maxJ] = myFeatureSelection(X(splits{ind}.indTrain,:),Labels(splits{ind}.indTrain,:),FEATURES_NUM);  %features Selection
        Data_train  = X(splits{ind}.indTrain,cLBest);   % it uses only found features
        Data_test   = X(splits{ind}.indTest,cLBest);
    else
        [cLBest,maxJ] = myFeatureSelection(X(splits{ind}.indTrain,:),Labels(splits{ind}.indTrain,:),FEATURES_NUM);  %features Selection
        Data_train  = X(splits{ind}.indTrain,cLBest,ind);
        Data_test   = X(splits{ind}.indTest,cLBest,ind);
    end
    %saving selected features for current split
    selected_features_history(ind,:) = cLBest;
    
    Labels_train    = Labelsgroup(splits{ind}.indTrain);
    Labels_test     = Labelsgroup(splits{ind}.indTest);
    
   
    [res] = my_GV_traintestSVM_Salerno(Data_train,Data_test,Labels_train,Labels_test,kernel);
   
  
    err(ind) = res.err;
    err1(ind)= res.errs1;
    err2(ind)= res.errs2;
    test_size(ind) = size(Data_test,1);
    test_size1(ind) = sum(Labels_test == UniqueLabels(1));
    test_size2(ind) = sum(Labels_test == UniqueLabels(2));
    temp_model_weights(:,ind) = res.model_weights(:);
    
    
end
results.err = err;
results.err1= err1;
results.err2= err2;
results.tot_err = sum(err);
results.tot_err1= sum(err1);
results.tot_err2= sum(err2);
results.mean_err= sum(err)/sum(test_size);
results.mean_err1 = sum(err1)/sum(test_size1);
results.mean_err2 = sum(err2)/sum(test_size2);
results.temp_model_weights = temp_model_weights;
% fprintf('\n');
