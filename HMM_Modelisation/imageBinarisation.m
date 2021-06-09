function imgBW = imageBinarisation(imdata,seuil)

%% % Convertir une image 8 bits en double
imdata = image2Double(imdata);

%% Binarisation par seuillage 
[rows,col] =size(imdata);
for i=1:rows
    for j=1:col
        if imdata(i,j)<=seuil
            imdata(i,j)=0;
        else
            imdata(i,j)=1;
        end

    end
end
imgBW = imdata;

%% Convertir les valeurs en double
imgBW = double(imgBW);

%%


