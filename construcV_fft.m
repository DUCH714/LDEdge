function [V,Laplace,d1h,d2h] = construcV_fft(U,beta,mu,gamma)
%CONSTRCUTV 此处显示有关此函数的摘要
%   此处显示详细说明
    [n1,n2,~]=size(U);
    d1h = zeros(n1, n2);
    d1h(1, 1) = -1;
    d1h(n1, 1) = 1;
    d1h = fft2(d1h);
    d2h = zeros(n1, n2);
    d2h(1, 1) = -1;
    d2h(1, n2) = 1;
    d2h = fft2(d2h);
    Laplace = abs(d1h).^2 + abs(d2h).^2;
    V = mu + beta * Laplace + gamma * (Laplace.^2);

% % n=I*J;
% % V=zeros(n,1);
% % for i=1:I
% %     for j=1:J
% %         V((i-1)*J+j)=(1-(2*(cos(2*(i-1)*pi/n)+cos(2*(j-1)*pi/n)-2)));
% %     end
% % end
end

