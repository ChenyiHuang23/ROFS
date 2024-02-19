function A = solve(Y, lambda, label)
    [d, m] = size(Y);
    normY = vecnorm(Y, 2, 2);
    A = zeros(d, m);
   
    % Logarithm(Y,lambda/beta,1e-1);
    % Generalized_Soft_Thresholding(Y, lambda/beta, 0.5);
    % 添加其他标签和函数的映射
    % functionHandleMap('其他标签') = @其他函数;
    
    for i = 1:d
        if Y(i, :) == 0
            A(i, :) = 0;
        else
            switch label
                case 'Hard'
                    B = Hard_Thresholding(normY(d), lambda);
                case 'soft'
                    B = Generalized_Soft_Thresholding(normY(d), lambda, 0.5);
                case 'Logarithm'
                    B = Logarithm(normY(d), lambda, 1e-1);
                case 'LSP'
                    B = GAI_LSP(normY(d),lambda,1e-6,100);
                case 'ETP'
                    B = GAI_ETP(normY(d),lambda,1e-4, 100);
                otherwise
                    error('未知的阈值函数标签');
            end
            A(i, :) = (Y(i, :) / normY(i)) * B;
        end
    end
end
