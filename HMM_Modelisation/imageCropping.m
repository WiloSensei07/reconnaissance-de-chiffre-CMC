function bw2 = imageCropping(bw)

%%

% figure(1) %Pour miuex comprendre la procédure veuillez décommenter
% imshow(bw);

bw = bw == 0;

% figure(2)
% imshow(bw);

%%
[l,c] = find(bw == 0);
bw2 = bw(min(l):max(l),min(c):max(c));

% figure(3)
% imshow(bw2);

%%
bw2 = bw2 == 0;

% figure(4)
% imshow(bw2);

%%
bw2 = double(bw2);

