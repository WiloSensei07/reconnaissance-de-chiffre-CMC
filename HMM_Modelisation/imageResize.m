function imBW_resize = imageResize(imBW_crop,mrows,ncols)

%%
[yy,xx] = size(imBW_crop);
x = linspace(1,xx,mrows);
y = linspace(1,yy,ncols);

[xi,yi] = meshgrid(x,y);
imBW_resize = interp2(imBW_crop,xi,yi,'spline');

%%
imBW_resize = double(imBW_resize > 0.05);

%%

