%%
delete *.asv
clear all;
close all;
clc;

%% L'image du chiffre � reconnaitre
chiffre = 7;

%% Localisation et Extraction des chiffres de la BDD de test
filename = 'Fichier_BDD\test.tif';
Images = Localisation_extraction(filename);%compl�t�

%% Extraction du chiffre � reconnaitre
imdata = Images{chiffre+1,1};%compl�t�
figure
imageShow(imdata);

%% Pr�traitements (image de taille fixe 16x16 pixels)
imBW = imagePreprocessing(imdata,16,16);%compl�t�

%% Extraction de caract�ristiques  
obs = imageFeaturesExtraction(imBW);%compl�t�
    
%% Image Recognize: Reconnaissance
% chargement du Mod�le entra�n�
load('Matfile\hmmModel.mat');

% Calcul de la vraisemblance
probabilities = imageRecognition(obs,hmmModel);%compl�t�

%% Affachage Resultat
figure;
subplot(2,1,1)
imageShow(imdata)
subplot(2,1,2)
numbers = 0:9;
stem(numbers,probabilities/sum(probabilities),'b'); % probabilities



