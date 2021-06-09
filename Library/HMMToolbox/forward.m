function [P,alfa] = forward(obs,A,B,Pi0)

T = size(obs,2);   % Nombre d'observations

%%
Pi0 = Pi0(:);

%% Initialisation
alfa(1,:) = Pi0.*B(:,obs(1));

%% Boucle de calcul

for t = 1:T-1
    somme = alfa(t,:)*A;
    alfa(t+1,:) = transpose(B(:,obs(t+1))).*somme;
end

%% Terminaison
P = sum(alfa(T,:));
    