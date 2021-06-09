function imageShow(numb_BW)

%%
maxi = max(max(numb_BW));
mini = min(min(numb_BW));

if (maxi == 1)&&(mini == 0)
    image(255-255*numb_BW)
    colormap(gray)
else
    image(numb_BW)
end
axis off
axis image
box on