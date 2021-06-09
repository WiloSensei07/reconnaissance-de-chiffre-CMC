function init()

clc;
delete *.asv
warning off

%%
chemin = pwd;
cd ..
chemin_fich = pwd;
cd(chemin)
addpath([chemin_fich '\Library\Image_ComFich'])
addpath([chemin_fich '\Library\HMMToolbox'])

%%
addpath([chemin_fich '\HMM_Modelisation'])

%%

