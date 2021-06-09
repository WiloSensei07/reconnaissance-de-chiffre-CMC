function observation = imageFeaturesExtraction(imBW)

%% histogramme de projections horizontales
Hist_H = histogramme_projection(imBW,'h')';%completé
%display(Hist_H);

%% histogrammes de projections verticales 
Hist_V = histogramme_projection(imBW,'v');%completé
%display(Hist_V);
%%
observation = [Hist_H Hist_V] + 1;

end