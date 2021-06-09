%%
delete *.asv
clear all;
close all;
clc;

%%
nom_resultat = 'Matfile\hmmModel.mat';

%% Features Extraction --> Chargement des caractéristiques extraites de la
%% base d'apprentissage "train.tif"
load('Matfile\features.mat')

%% CLASSIFICATION
% initialisation des paramètres de HMM
typeHMM = 1;    % Type de HMM --> 0: modèle ergodique, 1: modèle gauche droite (left-right)
Nbre_etats = 5; %ou 12 pour plus de performance % Nombre d'états cachés
Nbre_Obs = 17;  % Nombre d'obsevations

% Nombre d'iterations
iter_sp = 4;   % Nombre d'iterations pour le meilleur modèle initial
max_iter = 20; % Nombre d'iterations de l'algorithme de Baum-Welch

%% Apprentissage
hmmModel = cell(1,10);
for Chiffre = 0:9
    obs = features{Chiffre+1}; %caractéristique de chaque chiffre

    %% HMM Training: Training of model (Baum-Welch algorithm)
    [ll, prior, transmat, obsmat] = train_HMM(obs, Nbre_etats, Nbre_Obs, iter_sp, max_iter, typeHMM);
    hmmModel{Chiffre+1}.hmm.prior = prior;
    hmmModel{Chiffre+1}.hmm.transmat = transmat;
    hmmModel{Chiffre+1}.hmm.obsmat = obsmat;
    disp(Chiffre)
end

%% Sauvegarde des résultats
save(nom_resultat,'hmmModel','typeHMM','iter_sp','max_iter')
