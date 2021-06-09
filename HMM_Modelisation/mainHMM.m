%%
delete *.asv
clear all;
close all;
clc;

%%
nom_resultat = 'Matfile\hmmModel.mat';

%% Features Extraction --> Chargement des caract�ristiques extraites de la
%% base d'apprentissage "train.tif"
load('Matfile\features.mat')

%% CLASSIFICATION
% initialisation des param�tres de HMM
typeHMM = 1;    % Type de HMM --> 0: mod�le ergodique, 1: mod�le gauche droite (left-right)
Nbre_etats = 5; %ou 12 pour plus de performance % Nombre d'�tats cach�s
Nbre_Obs = 17;  % Nombre d'obsevations

% Nombre d'iterations
iter_sp = 4;   % Nombre d'iterations pour le meilleur mod�le initial
max_iter = 20; % Nombre d'iterations de l'algorithme de Baum-Welch

%% Apprentissage
hmmModel = cell(1,10);
for Chiffre = 0:9
    obs = features{Chiffre+1}; %caract�ristique de chaque chiffre

    %% HMM Training: Training of model (Baum-Welch algorithm)
    [ll, prior, transmat, obsmat] = train_HMM(obs, Nbre_etats, Nbre_Obs, iter_sp, max_iter, typeHMM);
    hmmModel{Chiffre+1}.hmm.prior = prior;
    hmmModel{Chiffre+1}.hmm.transmat = transmat;
    hmmModel{Chiffre+1}.hmm.obsmat = obsmat;
    disp(Chiffre)
end

%% Sauvegarde des r�sultats
save(nom_resultat,'hmmModel','typeHMM','iter_sp','max_iter')
