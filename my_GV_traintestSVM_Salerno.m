function [res] = my_GV_traintestSVM_Salerno(traindata,testdata,trainlabels,testlabels, kernel_type)
% Simone Romano - 0522500294 - sromano41@studenti.unisa.it
% This function differs from to GV_traintestSVM_Salerno
% by using a custom svm kernel. 
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

boxconstr  = 1;
rem_mean   = 0;
rem_var    = 0;

if rem_mean
    mean_train = mean(train);
    traindata = traindata - repmat(mean_train,size(traindata,1),1);
    testdata = testdata - repmat(mean_train,size(testdata,1),1);
end

if rem_var
    std_train = std(traindata);
    traindata = traindata./repmat(std_train,size(traindata,1),1);
    testdata = testdata./repmat(std_train,size(testdata,1),1);
end

temp = unique(trainlabels);
labels_check = (temp == [-1; 1]);
labels_check = all(labels_check);

if ~labels_check
    trainlabelsSVM = zeros(size(trainlabels));
    trainlabelsSVM(trainlabels == temp(1)) = 1;
    trainlabelsSVM(trainlabels == temp(2)) = -1;
    testlabelsSVM = zeros(size(testlabels));
    testlabelsSVM(testlabels == temp(1)) = 1;
    testlabelsSVM(testlabels == temp(2)) = -1;
else
    trainlabelsSVM=trainlabels;
    testlabelsSVM=testlabels;
end



dtrain=data(traindata,trainlabelsSVM);
dtest=data(testdata,testlabelsSVM);
a=svm;
a.child=kernel(kernel_type,1);    %HERE DIFFERENT KERNEL (NON-LINEAR)
a.C=boxconstr;
a.verbosity=0;

[~, a]=train(a,dtrain);
[r] = test(a,dtest);

pred = r.X;

res.pred = pred;
res.errs1=sum(pred(testlabelsSVM==1)<0);
res.errs2=sum(pred(testlabelsSVM==-1)>=0);
res.totclass1 = sum(testlabelsSVM==1);
res.totclass2 = sum(testlabelsSVM==-1);
res.err = res.errs1+res.errs2;
res.errperc = res.err/length(testlabelsSVM);
res.errperc1 = res.errs1/res.totclass1;
res.errperc2 = res.errs2/res.totclass2;


pred_norm = zeros(size(res.pred));
pred_norm(pred==1) = 1;
pred_norm(pred==-1) = 2;
res.pred_norm = pred_norm;


res.sample_weights=a.alpha;
res.sample_used=find(a.alpha);
res.model_weights=dtrain.X'*a.alpha;
