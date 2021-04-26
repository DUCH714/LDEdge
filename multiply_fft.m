function [AA] = multiply_fft(U,V)
%INVERT 此处显示有关此函数的摘要
%   此处显示详细说明
    AA = real(ifft2(fft2(U).*V));
end
    