function Images = Localisation_extraction(filename)

%% Localisation et extraction des chiffres de la base de données


%% Lecture du fichier image
A = imread(filename);

%% Convertir une image (8bits ou 16bits) en double
AA = image2Double(A);
AA_bw = 1-double(AA >= 0.005);  

%% Segmentation et extraction des chiffres
for n = 0:9
    % histogramme des projections horizontales --> extraction des Lignes
    [ind1,ind2] = imageLocalisation(AA_bw,'h');
    tmp = AA_bw(ind1(n+1):ind2(n+1),:);

    % histogramme des projections verticales --> extraction des Colonnes
    [ind11,ind22] = imageLocalisation(tmp,'v');
    
    % Extraction de chaque chiffre
    for m = 1:length(ind11)
        Images{n+1,m} = tmp(:,ind11(m):ind22(m));
    end
end

%%