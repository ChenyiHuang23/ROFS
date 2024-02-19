function [Delta] = Hard_Thresholding(S, weight)
    % S 输入矩阵
    % weight 阈值
    
    if length(weight) == 1
        weight = weight * ones(size(S));
    end
    

    sel = (abs(S)>weight);
    Delta = S.*sel;

end
