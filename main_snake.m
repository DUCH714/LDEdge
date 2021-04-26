clear
[C_man,map]=imread('snake.png');
C_man = im2double(C_man);%%[0,1]
% imshow(C_man)
%%%%%%%%%%add noisy%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma=35;
sigma=(sigma/255)^2;
C_man_noisy=imnoise(C_man,'gaussian',0,sigma);
opts.s=2;% penaty coefficient
opts.beta=0.9;%%
opts.alpha=0.3;%%alpha
opts.tol=0.05;
[V,Laplace, d1h, d2h]=construcV_fft(C_man, 2, opts.s,opts.s);
%[Laplace, d1h, d2h]=construcV(C_man);
d_1=get_gradient(C_man_noisy,d1h,d2h); %(:,:,3,2) output:[0,1]
Edge=multiply_fft(C_man,Laplace);
d_2=multiply_fft(C_man_noisy,Laplace)-Edge;
imshow(Edge)
[U,PSNR]=get_image(C_man_noisy,opts,d_1,d_2,Edge,V, Laplace, d1h, d2h,C_man);
figure(1)
imshow(U)
figure(2)
plot(PSNR)