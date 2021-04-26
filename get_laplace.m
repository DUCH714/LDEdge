function [A] = get_laplace(image)
%GET_LAPLACE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[i,j,~]=size(image);
I = speye(i , i);
J=speye(j,j);
ei = sparse(2 : i , 1 : i - 1, 1, i , i );
ej = sparse(2 : j , 1 : j - 1, 1, j , j );
Di = ei + ei' - 2 * I;
Dj = ej + ej' - 2 * J;
A = (kron(Dj, I) + kron(J, Di));

end

