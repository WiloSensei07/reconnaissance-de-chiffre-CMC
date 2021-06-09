function [ind1,ind2,l] = imageLocalisation(imdata,dim)


%% histogramme de projections
l = histogramme_projection(imdata,dim);

%%
i = 1:length(l)-1;
ind1 = find(l(i)== 0 & l(i+1)~= 0);
ind1 = ind1 + 1;
ind2 = find(l(i)~= 0 & l(i+1)== 0);

%%