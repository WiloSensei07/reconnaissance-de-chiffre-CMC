function imdata = image2Double(img)

% Convert image to double precision

%%
if isa(img, 'double')
    imdata = img;
elseif isa(img, 'logical') || isa(img, 'single')
   imdata = double(img);
elseif isa(img, 'uint8') || isa(img, 'uint16')
    imdata = double(img)/double(max(max(img)));
else %int16
    imdata = (double(img) + 32768) / 65535;
end