function [A] = get_gradient(image,d1h,d2h)
%GET_LAPLACE 此处显示有关此函数的摘要
%   此处显示详细说明
[n1,n2,n3]=size(image);
A=zeros(n1,n2,n3,2);
% A(:,:,:,1)=multiply(image,d1h);
% A(:,:,:,2)=multiply(image,d2h);
for i=1:n3
    A(:,:,i,1)=multiply_fft(image(:,:,i),d1h);
    A(:,:,i,2)=multiply_fft(image(:,:,i),d2h);
end
