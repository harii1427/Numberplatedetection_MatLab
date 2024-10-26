function dec2d=WavData1(fname)
i=imread(fname);
i=imresize(i,[128 128]);
%imshow(i);
map=colormap(hsv(256)); 
 
% i=imresize(i,[128 128]);
 i=rgb2gray(i);
 map=colormap(hsv(256)); 

  X=double(i);
  nbcol = size(map,1);

% X contains the loaded image. 
% map contains the loaded colormap. 

% Perform single-level decomposition 
% of X using db1. 
[cA1,cH1,cV1,cD1] = dwt2(X,'haar'); % db2 haar

% Images coding. 
cod_X = wcodemat(X,nbcol); 
cod_cA1 = wcodemat(cA1,nbcol); 
cod_cH1 = wcodemat(cH1,nbcol); 
cod_cV1 = wcodemat(cV1,nbcol); 
cod_cD1 = wcodemat(cD1,nbcol); 
dec2d = [... 
        uint8(cod_cA1),     uint8(cod_cH1);     ... 
        uint8(cod_cV1),     uint8(cod_cD1)      ... 
        ];
dec2d=cod_cA1;

   % imshow(uint8(dec2d));
%    dec2d=mean(dec2d);
    %dec2d=dec2d';
    dec2d=cod_cA1;
    