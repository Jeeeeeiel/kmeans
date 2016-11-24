function [centroids, result, SSE] = KMeans(data, K, centroids)
%KMeans clusters data by K-Means algorithm.
%   Define Variables:
%   data        --data needed to be clustered
%   K           --divide into K clusters
%   result      --size(data,1)*1 matrix, 
%   centroids   --K*M matrix, M means the demision of object
%   SSE         --
narginchk(2,3)
if nargin < 3
    %random initialization
    centroids = zeros(K, size(data,2));
    mask = randsample(size(data,1), K); %sampling k objs from [1,size(data,1)] without replacement
    mask = mask';
    for ii = 1 : length(mask)
        centroids(ii,:) = data(mask(ii),:);
    end
end
pre_centroids = centroids;
result =  zeros(size(data, 1),1);

SSE = zeros(size(centroids,1),1);

% data = double(data);
% minincols = min(data);
% maxincols = max(data);
% span = maxincols - minincols;
% span = repmat(span, size(data, 1),1);
% data = data./span; %normalize |i-j|<=1





while 1
    %cluster
    for ii = 1:size(data, 1)
        distance = pdist2(data(ii,:),centroids,'euclidean');
        [~, index] = min(distance);
        result(ii) = index - 1;
    end
    emptyclusterexist = false;
    for ii = 1:size(centroids,1)%check is there any empty cluster exists
        sub_data = data(result == (ii-1),:);%get all data belongs to cluster (ii-1)
        if size(sub_data, 1) == 0%empty cluster
            [~,clusterwithmaxSSE] = max(SSE);
            sub_data = data(result == (clusterwithmaxSSE),:);
            distance = pdist2(centroids(clusterwithmaxSSE,:),sub_data,'euclidean');
            [~, index] = max(distance);
            centroids(ii,:) = sub_data(index,:);
            emptyclusterexist = true;
            break;
        end
    end
    if emptyclusterexist
        continue
    end
    %calculate the center of every clusters
    finish = 1;
    for ii = 1:K
        sub_data = data(result == (ii - 1),:);%get all data belongs to cluster (ii-1)
        centroids(ii,:) = mean(sub_data, 1);%update centroids
        if pdist2(centroids(ii,:),pre_centroids(ii,:),'euclidean') > eps
            finish = 0;
        end
    end
    for ii = 1:size(SSE,1)%update SSE
        sub_data = data(result == (ii-1), :);%get all data belongs to cluster (ii-1)
        distance = pdist2(centroids(ii,:), sub_data, 'euclidean');
        SSE(ii) = sum(distance);
    end
    if finish == 1
        break;
    end
    pre_centroids = centroids;
end


SSE = sum(SSE);