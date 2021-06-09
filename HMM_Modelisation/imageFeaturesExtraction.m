function observation = imageFeaturesExtraction(imBW)

%% histogramme de projections horizontales
Hist_H = histogramme_projection(imBW,'h')';%complet�
%display(Hist_H);

%% histogrammes de projections verticales 
Hist_V = histogramme_projection(imBW,'v');%complet�
%display(Hist_V);
%%
observation = [Hist_H Hist_V] + 1;

end