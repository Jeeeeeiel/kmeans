im = zeros(28)
for ii = [1:28]
    im(ii,:) = ClusterSamples(26,(ii-1)*28+1:ii*28);
end
imshow(im);