clc;clear;
X = randn(1000,20);

%  1e-1 1e1
lambda = [1e-6, 1e-5, 1e-4, 1e-3,1e-2, 1e-1,1e0, 1e1,1e2, 1e4, 1e6];  
gamma = [1e-6, 1e-5, 1e-4, 1e-3,1e-2, 1e-1,1e0, 1e1,1e2, 1e4, 1e6];
Iter = 100;

ZeroRowCountMatrix = zeros(length(lambda),length(gamma));

for i = 1:length(lambda)
    for j = 1:length(gamma)
        % 调用GAI_ETP函数计算Z值
        currentLambda =  lambda(i);
        currentGamma=  gamma(j);
         
        Z = GAI_LSP(X,currentLambda,currentGamma,Iter);
        
        allZeroRowCount = sum(all(Z == 0, 2));  % 计算全0行
        ZeroRowCountMatrix(i,j)= allZeroRowCount;
    end
end
