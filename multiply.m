function [U] = multiply(U,V)
%INVERT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[n1,n2,n3]=size(U);
if n3==1
    U=reshape(V*reshape(U,n1*n2,1),n1,n2);
else
    for i=1:n3
        U(:,:,i)=reshape(V*reshape(U(:,:,i),n1*n2,1),n1,n2);
    end
end
end