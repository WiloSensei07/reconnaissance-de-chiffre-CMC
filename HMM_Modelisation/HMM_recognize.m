%%
delete *.asv
clear all;
close all;
clc;

%% L'image du chiffre à reconnaitre
chiffre = 7;

%% Localisation et Extraction des chiffres de la BDD de test
filename = 'Fichier_BDD\test.tif';
Images = Localisation_extraction(filename);%complété

%% Extraction du chiffre à reconnaitre
imdata = Images{chiffre+1,1};%complété
figure
imageShow(imdata);

%% Prétraitements (image de taille fixe 16x16 pixels)
imBW = imagePreprocessing(imdata,16,16);%complété

%% Extraction de caractéristiques  
obs = imageFeaturesExtraction(imBW);%complété
    
%% Image Recognize: Reconnaissance
% chargement du Modèle entraîné
load('Matfile\hmmModel.mat');

% Calcul de la vraisemblance
probabilities = imageRecognition(obs,hmmModel);%complété

%% Affachage Resultat
figure;
subplot(2,1,1)
imageShow(imdata)
subplot(2,1,2)
numbers = 0:9;
stem(numbers,probabilities/sum(probabilities),'b'); % probabilities



