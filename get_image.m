function [u,PSNR]=get_image(image,opts,d_1,d_2,d,V, Laplace, d1h, d2h,origan)
%SOLVE 此处显示有关此函数的摘要
%   此处显示详细说明
[n1, n2, n3] = size(image);
b_1=zeros(n1,n2,n3, 2);
b_2=zeros(n1,n2,n3);
u=image;
s=opts.s;% penaty coefficient
beta=opts.beta;%%
alpha=opts.alpha;%%alpha
tol=opts.tol;
n=1;
Delta=0.000001;
PSNR(1)= psnr(origan,u);
    for i =1:n3
        b_1(:, :, i, 1) = multiply_fft(u(:, :, i), d1h) - d_1(:, :, i, 1);
        b_1(:, :, i, 2) = multiply_fft(u(:, :, i), d2h) - d_1(:, :, i, 2);
        b_2(:, :, i) = multiply_fft(u(:, :, i), Laplace) - d(:, :, i) - d_2(:, :, i);
    end
while 1
    Tol=0;
    temp_u = u;
    imshow(u)
    for i=1:n3
        matrix_U=2*(image(:,:,i))+s*...
            (multiply_fft(d_1(:,:,i,1)-b_1(:,:,i,1),d1h)+...
            multiply_fft(d_1(:,:,i,2)-b_1(:,:,i,2),d2h)+...
            multiply_fft(d_2(:,:,i)+d(:,:,i)-b_2(:,:,i),Laplace)); %1-dim
        t_1=multiply_fft(u(:,:,i),d1h)+b_1(:,:,i,1);%m*n
        t_2=multiply_fft(u(:,:,i),d2h)+b_1(:,:,i,2);%m*n
        t=((t_1).^2+(t_2).^2).^0.5+Delta;%matrix
        u(:,:,i)=invert(matrix_U,V);%u_{k+1}%% !!!!!!!!!!!!!!!!!!
        d_1(:,:,i,1)=max(t-alpha/s,0).*t_1./t;% point multply & deliver
        d_1(:,:,i,2)=max(t-alpha/s,0).*t_2./t;% point multply & deliver
        abs_d_2=multiply_fft(u(:,:,i),Laplace)-d(:,:,i)+b_2(:,:,i);
        abs_d=abs(abs_d_2)+Delta; %matrix
        d_2(:,:,i)=max(abs_d-beta/s,0).*abs_d_2./abs_d;% point multply & deliver
        b_1(:, :, i, 1) =b_1(:, :, i, 1)+ multiply_fft(u(:, :, i),d1h) - d_1(:, :, i, 1);
        b_1(:, :, i, 2) = b_1(:, :, i, 2)+ multiply_fft(u(:, :, i),d2h) - d_1(:, :, i, 2);
        b_2(:, :, i) =b_2(:, :, i)+ multiply_fft(u(:, :, i),Laplace) - d(:, :, i) - d_2(:, :, i);
        T=abs(temp_u(:,:,i)-u(:,:,i));
        Tol=Tol+sum(T(:));
    end
    PSNR(n+1)= psnr(origan,u);
    if Tol<tol||abs(PSNR(n+1)-PSNR(n))<tol
        break
    end
    n=n+1;
end
end

