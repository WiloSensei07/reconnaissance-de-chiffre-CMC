delete *.asv
clear all;
close all;
clc;

%% Localisation et extraction des chiffres de la BDD d'apprentissage
filename = 'Fichier_BDD\train.tif';
Images =  Localisation_extraction(filename);% à compléter

%% Extraction des caractéristiques de chacune des 10 classes
for nn = 0:9
    ind = length(Images(nn+1,:));
    for ii = 1:ind

        %% Lecture de chaque chiffre 
        imdata =  Images{nn+1,ii};% à compléter

        %% Prétraitements (image de taille fixe 16x16 pixels)
        [imBW, ~] = imagePreprocessing(imdata, 16, 16);% à compléter

        %% Extraction de caractéristiques
        features{nn+1}{ii} = imageFeaturesExtraction(imBW); % à compléter
    end
end

%% sauvegarde des résultats dans le dossier MatFile
save('MatFile\features.mat','features')
