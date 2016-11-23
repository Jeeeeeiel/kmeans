clear;
clc;
x=[0 0;
  1 0;
  0 1;
  1 1;
  2 1;
  1 2;
  2 2;
  3 2;
  6 6;
  7 6;
  8 6;
  7 7;
  8 7;
  9 7;
  7 8;
  8 8;
  9 8;
  8 9;
  9 9];
fileid = fopen('balance-scale.data');
data = textscan(fileid,'%s %d %d %d %d','Delimiter', ',');
truecategory = cell2mat(data{1});
tmpdata = zeros(size(data{1},1) ,size(data,2)-1); %exclude category
for ii = 1:size(data,2)-1
    tmpdata(:,ii) = data{ii+1};
end
data = tmpdata;
centroids = [8,8;9,9];
[centroids, result, SSE] = KMeans(data,3);
display(SSE)

%  tic
%  [u, result] = KMeans(ClusterSamples,10);
%  toc
%  count = zeros(10, 10);
%  for ii = 1:10
%      for jj = 1:10
%          count(ii,jj) = size(find(SampleLabels(result == ii - 1) == jj - 1),1);
%      end
%  end