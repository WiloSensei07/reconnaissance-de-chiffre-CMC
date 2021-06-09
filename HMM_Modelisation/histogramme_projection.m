function l = histogramme_projection(imdata,dim)

%%
if strcmpi(dim,'v') % histogramme de projections verticales 
    %.... %completé
    l = sum(imdata,1);
%     size(l)
elseif strcmpi(dim,'h') % histogramme de projections horizontales 
    % .... %completé
    l = sum(imdata,2);
    %l=l';
%     size(l)
else
    error('error')
end

%%