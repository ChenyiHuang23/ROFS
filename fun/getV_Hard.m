

function V = getV_Hard(V,W,Lambda,X,m,t,lambda,beta)

num = size(X,2);
dim = size(X,1);
H = eye(num)-(1/num)*ones(num); 
St = X*H*X';

oldW = zeros(dim,m);
oldV = zeros(dim,m);
tol = 100;
iter = 100;


tic; % 开始计时

while tol > 1e-3 && iter >  0 
    W = MY_GRASSMAN(W,V,Lambda,St,dim,m,beta);


    Y = W + Lambda/beta;  
    V =  solve(Y, 2*lambda/beta,'Hard');

    Lambda = Lambda + beta*(W-V);
    beta = t*beta;
    tolW = norm(W - oldW,'fro')/(max(norm(W,'fro'),1));
    tolV = norm(V - oldV,'fro')/(max(norm(V,'fro'),1));
    tol = max(tolW,tolV);
     
    oldW = W;
    oldV = V;
    iter = iter -1;

end
disp("iter:"+num2str(100-iter));

end
