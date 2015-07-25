function [ newTrials ] = dataCompression( trials, delimiters1, delimiters2 )
    %DATACOMPRESSION This function extract Data matrix for
    %each trials.element; each Data is compressed by getting only rows
    %between 'delimiters1' and 'delimiters2'.
    %At this point it reduces each column to one element by computing
    %an average column for column.
    %Result is a vector 1x2018 for each trials element.

    newTrials = trials;
    trialsLen = size(trials);
    trialsLen = trialsLen(2);
    for i=1:trialsLen
        firstExp = trials(1,i);
        matrix = firstExp(1).Data;
        centralRow_s = matrix(delimiters1:delimiters2,:);
        meanOfSubMat = mean(centralRow_s,1);
        newTrials(1,i).Data = meanOfSubMat;
    end
end

