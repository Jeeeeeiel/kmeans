clear;
clc;
display('file:balance-scale.data');
fileid = fopen('balance-scale.data');
data = textscan(fileid,'%s %d %d %d %d','Delimiter', ',');
truecategory = cell2mat(data{1});
tmpdata = zeros(size(data{1},1) ,size(data,2)-1); %exclude category
for ii = 1:size(data,2)-1
    tmpdata(:,ii) = data{ii+1};
end
data = tmpdata;
% centroids = [8,8;9,9];
% [centroids, result, SSE] = KMeans(data,3);

%different k
% repeat = 10;
% K = 10;
% SSEmat = zeros(K,repeat);
% SSE = zeros(K,1);
% for jj = 1:K
%     for ii = 1:repeat
%         [~,~,SSEmat(jj,ii)] = KMeans(data,jj);
%     end
%     SSE(jj) = mean(SSEmat(jj,:));
% end
% figure;
% plot((1:K),SSE(SSE>0))
% title('balance-scale.data');
% axis([0,K,min(SSE(SSE>0))-10,max(SSE(SSE>0))+10])
% fprintf('SSE: %f\n',SSE(SSE>0));

%specific k ,different centroid
K = 5;
centroids = [0 0 0 0; 4 4 4 4; 3 4 3 4; 10 10 10 10;9 9 9 9];
[~,~,SSE] = KMeans(data,K);
fprintf('SSE: %f\n',SSE);