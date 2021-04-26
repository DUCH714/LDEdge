function [M] = remove_nan(M)
%REMOVE_NAN 此处显示有关此函数的摘要
%   此处显示详细说明
S=isnan(M);
[n1,n2]=size(S);
for i=1:n1
    for j=1:n2
        if S(i,j)==1
            M(i,j)=0;
        end
    end
end
end

