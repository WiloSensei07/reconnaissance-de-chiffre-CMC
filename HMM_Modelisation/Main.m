
%%
clc;
clear

%% 
filename_train = 'Fichier_BDD\train.tif'; %chemin 
filename_test = 'Fichier_BDD\test.tif';

%% 
train = imread(filename_train);

%% 
test = imread(filename_test);

%% 
figure(1)
imshow(train)
colormap(gray)

%% 
figure(2)
imshow(test)
colormap(gray)

%% Etape 3 : 
    %% histogramme de projections verticales de la BDD d’apprentissage 
        l = histogramme_projection(255-train(1:133,:),'v');
        figure(3);
        title('Projection verticale');
        plot(l);
       

    %% histogramme de projections horizontales de la BDD d’apprentissage 
        lh = histogramme_projection(255-train,'h');
        figure(4)
        title('Projection horizontale');
        plot(lh);
        
        figure(5)
        imshow(train(1:133,1:261)) %On affiche le chiffre 0

    %% localisation et extraction des chiffres dans les deux images binaires fournies
        
        train_ = Localisation_extraction(filename_train);
        figure(6)
        imageShow(train_{1,1});
        
        test_ = Localisation_extraction(filename_test);
        figure(7)
        imageShow(test_{8,1});
%     

%% Etape 5 
    %% Binarisation

        %affichage des histogrammes des deux images
     
        rice = imread('rice.png');
        figure(8)
        imshow(rice);
        bin_rice=imageBinarisation(rice,0.59);
        figure(9)
        imshow(bin_rice);
%         
        printedtext = imread('printedtext.png');
        figure(10)
        imshow(printedtext);
        bin_printedtext=imageBinarisation(printedtext,0.1);
        figure(11)
        imshow(bin_printedtext);
        
        
        
        
%% Etape 6 
    %% Recadrage
        r = imageCropping(train_{1,1});
        figure(12)
        imshow(r);

%% Etape 7 
    %% Normalisation ou le redimensionnement 
        p  = imageResize(r,16,16);
        figure(13)
        imshow(p);
        
