function [M] = remove_nan(M)
%REMOVE_NAN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

