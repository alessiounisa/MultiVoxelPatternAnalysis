% corrmat matrice correlazione completa
% c indici dei cluster  
% n numero di cluster 
% method può essere 'mean' o 'sum'
% mds vettore indice centri
% meancorr vettore correlazione media dei punti con il centro 
% (o somma nel caso di methodo 'sum'


function [mds, meancorr] = medoids(corrmat,c,method)
uniq = unique(c);
nn = length(uniq);
meancorr = zeros(nn,1);
mds = zeros(nn,1);

for i=1:nn
    idxc = c == uniq(i);
    cluster = corrmat(idxc, idxc);
    switch(method)
        case 'sum'
            [meancorr(i),center] = max(sum(cluster));
        case 'mean'
            [meancorr(i),center] = max(mean(cluster));
        otherwise
    end
    tmp = find(idxc);
    mds(i) = tmp(center);
end
%hist(meancorr,50)
end
