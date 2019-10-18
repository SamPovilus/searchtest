xSize = 8;
ySize = 9;
threash = 30;
threash2 = 3;
noise = randn(xSize,ySize);
initalImage = randn(xSize,ySize);
signal = randn(xSize,ySize);
signal(4,5) += 50;
signal(4,4) += 49;
signal(4,6) += 48.5;
signal(3,5) += 48;
signal(5,5) += 48.2;

signal(find((signal - noise) < threash)) = 0;

signal(find(signal < (max(signal) - threash2))) = 0; 

%idx = s(1).PixelIdxList;
%sum_region1 = sum(I(idx));
%x = s(1).PixelList(:, 1);
%y = s(1).PixelList(:, 2);

%xbar = sum(x .* double(I(idx))) / sum_region1

xMasses = sum(signal,1);
yMasses = sum(signal,2);
xWeightedMasses = zeros(1,ySize);
yWeightedMasses = zeros(xSize,1);
for c = 1:ySize
  xWeightedMasses(c) = xMasses(c) * c;
  
endfor
for r = 1:xSize
  yWeightedMasses(r) = yMasses(r)*r;
endfor

xbar = sum(xWeightedMasses)/sum(xMasses)
ybar = sum(yWeightedMasses)/sum(yMasses)
%[r,c,v] = find(signal > 0)