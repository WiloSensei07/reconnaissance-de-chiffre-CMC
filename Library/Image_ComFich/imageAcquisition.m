
%%
axes_lim = [100 110 100 110];
axis(axes_lim);
box on
hold on
xy = [];
n = 0;

%%
but = 1;
x1 = 0;
while but == 1
    [xi,yi,but] = ginput(1);
%     disp([but xi yi])
    if (xi >= axes_lim(1))&&(xi<=axes_lim(2))&&(yi >= axes_lim(3))&&(yi<=axes_lim(4))%&&(but == 1)
        plot(xi,yi,'b.')
        n = n+1;
        xy(:,n) = [xi; yi];
        x1(n) = xi;
    end
end

%% Interpolate with a spline curve and finer spacing.
if (but ~= 1)&&(length(x1)==1)
    cla
else
    t = 1:n;
    ts = 1: 0.1: n;
    xys = spline(t,xy,ts);

    % Plot the interpolated curve.
    plot(xys(1,:),xys(2,:),'b-','LineWidth',2);
    box on
    hold off

    %%
    h = figure;
    plot(xys(1,:),xys(2,:),'LineWidth',20,'Color',[0 0 0]);
    axis(axes_lim);
    % axis([-1 1 0 5])
    axis off
    print(h,'-dbitmap',nom_bmp)
    close(h)
end