function level = otsu(I)

% valMax = max(double(I));
 
%% Méthode d'OTSU
%% Calcul de l’histogramme 
[n,m] = size(I);

if isinteger(I)
    classType = class(I);
    range = double([intmin(classType) intmax(classType)]);
else
    %double, single, or logical
    range = [0 1];
end 

if islogical(I)
    h(2) = sum(I(:));
    h(1) = numel(I) - h(2);
    h = h';
elseif isa(I,'uint8')||isa(I,'uint16')||isa(I,'uint32')
    h = zeros(range(2),1);
    x = range(1):range(2);
    for k = x
        h(k+1) = sum(sum(I==k));
    end
else
    
end

figure
stem(x,h, 'Marker', 'none')

hh = [counts(1:length(h)) h];

%%  Calcul de la probabilité de chaque niveau de gris
Proba = h'/(n*m);

VarIntraClasse = zeros(1,255);
for i = 1 : 255
    % Calcul de la probabilité des classes 1 et 2
    Proba1 = Proba(1:i);
    Proba2 = Proba(i+1:256);
    P1 = sum(Proba1);
    P2 = sum(Proba2);
    
    % Calcul de la moyenne des classes 1 et  
    n1 = 0:i-1;
    n2 = i:255;
    Moy1 = sum(n1.*Proba1)/P1;
    Moy2 = sum(n2.*Proba2)/P2;
    
    % Calcul de la variance de chaque classe
    Var1 = sum(((n1 - Moy1).^2).*Proba1);
    Var2 = sum(((n2 - Moy2).^2).*Proba2);

    % Variance intra-classe
    VarIntraClasse(i) = Var1 + Var2;
end

% Détermination du seuil %
[Val,Indice] = min(VarIntraClasse(1:255)); 
level = (Indice-1)/255;

%%

