function [AA] = invert(U,V)
%INVERT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    AA = real(ifft2(fft2(U)./V));
end

