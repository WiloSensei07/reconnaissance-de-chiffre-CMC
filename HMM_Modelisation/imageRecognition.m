function probabilities = imageRecognition(obs,hmmModel)

probabilities = zeros(1,10);

%%
for nn = 0:9
    prior = hmmModel{nn+1}.hmm.prior; % vecteur de probabilité initiale 
    transmat = hmmModel{nn+1}.hmm.transmat; % matrice de transition 
    obsmat = hmmModel{nn+1}.hmm.obsmat; % matrice d’observation 
    
    % Calcul de la vraisemblance de l'observation 
    [P,~] = forward(obs,transmat,obsmat,prior);
    
    probabilities(nn+1) = P;  
end

probabilities = probabilities/max(probabilities);

