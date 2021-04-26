function [Laplace,d1h,d2h] = construcV(U)
%CONSTRUCV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[i,j,~]=size(U);
I = speye(i , i);
J=speye(j,j);
ei = sparse(2 : i , 1 : i - 1, 1, i , i );
ej = sparse(2 : j , 1 : j - 1, 1, j , j );
Di = ei'  -  I;
Di(i,i)=0;
Dj = ej'  -  J;
Dj(j,j)=0;

d1h=kron(J, Di);
d2h=kron(Dj, I);
Laplace=d1h*d1h+d2h*d2h;
end

