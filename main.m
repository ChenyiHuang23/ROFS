%%  paras setting
load("COIL20.mat");
load("convex_W.mat");

gamma = 1e-5;           %  ETP: 10e-6,1    Logarithm: 10e-5,1    Hard:10e-6,1e5
beta = 1;     
    
t_value = 1.618;    
avg_times = 50;         % iterations of cluster
cureent_features_select = 100;

%%  initialize
X =  (X-mean(X));
T = X';
[num,dim] = size(X);
clustersNum = max(Y);
y = Y(:,1);
samplesNum = length(y); 
m = clustersNum;


W = convex_W;  
V = W;
Lambda = ones(dim,m);
    
%% feature seleciton algorithms, find the best V
V = getV_Logarithm(V, W, Lambda, T, m, t_value, gamma, beta);
% V = getV_ETP(V, W, Lambda, T, m, t_value, gamma, beta);
% V = getV_Hard(V, W, Lambda, T, m, t_value, gamma, beta);

%% select top features, and analyze
result = zeros(2,1);
result_sum = zeros(2,1);  
for time = 1:avg_times
    cluster = CLUSTER(V, X, clustersNum,cureent_features_select);
    result = ANALY(cluster, y, clustersNum, samplesNum);
    result_sum = result_sum + result;
end
acc = result_sum(1,1)/avg_times
nmi = result_sum(2,1)/avg_times
result(1,1) = acc;
result(2,1) = nmi;



