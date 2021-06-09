function bw2 = imageCropping(bw)

%%
bw = bw == 0;
%%
[l,c] = find(bw == 0);
bw2 = bw(min(l):max(l),min(c):max(c));

%%
bw2 = bw2 == 0;

%%
bw2 = double(bw2);

