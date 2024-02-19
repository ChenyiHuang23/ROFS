
clc;clear;
X = randn(1000,20);
disp(X);

%    1e-1 0.5
lambda = [1e-6, 1e-5, 1e-4, 1e-3,1e-2, 1e-1,1e0, 1e1,1e2, 1e4, 1e6];   
p = 0:0.1:1;    
Iter = 100;

ZeroRowCountMatrix = zeros(length(lambda),length(p));

for i = 1:length(lambda)
    for j = 1:length(p)
        % 
        currentLambda =  lambda(i);
        currentP =  p(j);
         
        Z = GAI_GST(X,currentLambda,currentP)
        disp(['lambda: ' num2str(currentLambda) ' | P: ' num2str(currentP)]);
        allZeroRowCount = sum(all(Z == 0, 2))  % 计算全0行
        ZeroRowCountMatrix(i,j)= allZeroRowCount;
    end
end
