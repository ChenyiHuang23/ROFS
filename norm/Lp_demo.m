clc;clear;
X = randn(1000,20);

% 
lambda = [1e-6, 1e-5, 1e-4, 1e-3,1e-2, 1e-1,1e0, 1e1,1e2, 1e4, 1e6];  
p = 0.1:0.1:1;   
Iter = 100;

ZeroRowCountMatrix = zeros(length(lambda),length(p));

for i = 1:length(lambda)
    for j = 1:length(p)
        % 调用GAI_ETP函数计算Z值
        currentLambda =  lambda(i);
        currentP=  p(j);
         
        Z =  Generalized_Soft_Thresholding(X, currentLambda, currentP);
        
        allZeroRowCount = sum(all(Z == 0, 2));  % 计算全0行
        ZeroRowCountMatrix(i,j)= allZeroRowCount;
    end
end
