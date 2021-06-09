%%
delete *.asv
clear all;
close all;
clc;

%% Localisation et Extraction des chiffres de la BDD de test
filename = 'Fichier_BDD\test.tif';
Images = Localisation_extraction(filename); % complété

%% chargement du Modèle entraîné
load('Matfile\hmmModel.mat');

%%
Nbre = zeros(1,10);
for chiffre = 0:9
    ind = length(Images(chiffre+1,:));
    temp = zeros(1,ind);

    for n = 1:ind
        %% Lecture de chaque chiffre   
        imdata = Images{chiffre+1,n}; % complété

        %% Prétraitements (image de taille fixe 16x16 pixels)
        imBW = imagePreprocessing(imdata,16,16);%complété

        %% Extraction de caractéristiques
        obs = imageFeaturesExtraction(imBW);%complété

        %% Calcul de la vraisemblance
        probabilities = imageRecognition(obs,hmmModel);%complété
            
        %%
        %ind_maxi = find == max(probabilities);
        [~,ind_maxi]=max(probabilities);
        temp(n) = ind_maxi-1;
        
    end

    for j = 0:9
        A(chiffre+1,j+1) = double(sum(temp==j));
    end
    Nbre(chiffre+1) = ind;

    disp(chiffre)
end
clc;

%% Mesures de performances d'un classifieur
AA =  A./(Nbre'*ones(size(Nbre))); % Matrice de confusion

%%
tau_recon = mean(diag(AA))*100;  % Taux de reconnaissance
tau_subs = 100 - tau_recon;  % Taux d’erreur

%%
nbre_reconnues = tau_recon*sum(Nbre)/100; % Nombre d'images reconnues
nbre_non_recon = tau_subs*sum(Nbre)/100; % Nombre d'images mal reconnues

%%