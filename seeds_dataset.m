clear;
clc;
display('file:seeds_dataset.txt');
fileid = fopen('seeds_dataset.txt');
data = textscan(fileid,'%f %f %f %f %f %f %f %d','Delimiter', ',');
truecategory = data{7};
tmpdata = zeros(size(data{1},1) ,size(data,2)-1); %exclude category
for ii = 1:size(data,2)-1
    tmpdata(:,ii) = data{ii};
end
data = tmpdata;
% % centroids = [8,8;9,9];
% % [centroids, result, SSE] = KMeans(data,3);

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
% title('seeds_dataset.txt');
% axis([0,K,min(SSE(SSE>0))-10,max(SSE(SSE>0))+10])
% fprintf('SSE: %f\n',SSE(SSE>0));


%specific k ,different centroid
K = 5;
[~,~,SSE] = KMeans(data,K);
fprintf('SSE: %f\n',SSE);