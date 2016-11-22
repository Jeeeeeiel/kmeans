%clear all;
%clc;
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
load('/Users/Jeiel/Dropbox/模式识别（研2016）/实验/实验1 K-均值聚类/ClusterSamples.mat');
 [u, result] = KMeans(x,2);

%  tic
%  [u, result] = KMeans(ClusterSamples,10);
%  toc
%  count = zeros(10, 10);
%  for ii = 1:10
%      for jj = 1:10
%          count(ii,jj) = size(find(SampleLabels(result == ii - 1) == jj - 1),1);
%      end
%  end