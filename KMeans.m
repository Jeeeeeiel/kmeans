function [centroids, result] = KMeans(data, K, centroids)
%KMeans clusters data by K-Means algorithm.
%   Define Variables:
%   data        --data needed to be clustered
%   K           --divide into K clusters
%   result      --size(data,1)*1 matrix, 
%   centroids   --K*M matrix, M means the demision of object
data = double(data);
%normalize all col*******
minincols = min(data)
maxincols = max(data)
span = maxincols - minincols
span = repmat(span, size(data, 1))
data = data./span %[-1,1]

if size(centroids, 1)==0 %not given
    %random initialization
    centroids = zeros(K, size(data,2))
    mask = randsample(size(data,1), K) %sampling k objs from [1,size(data,1)] without replacement
    mask = mask - 1
    for ii = mask
        centroids(ii,:) = data(ii,:);
    end
end
pre_centroids = centroids;
result =  zeros(size(data, 1),1);



while 1
    %cluster
    for ii = 1:size(data, 1)
        distance = pdist2(data(ii,:),centroids,'euclidean');
        [~, index] = min(distance);
        result(ii) = index - 1;
    end
    %calculate the center of every clusters
    finish = 1;
    for ii = 1:K
        sub_data = data(result == ii - 1,:);
        centroids(ii,:) = mean(sub_data, 1);
        if pdist2(centroids(ii,:),pre_centroids(ii,:),'euclidean') > eps
            finish = 0;
        end
    end
    if finish == 1
        break;
    end
    pre_centroids = centroids;
end
