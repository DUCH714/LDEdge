b=ones(16,1);
N=length(b);
n=1/(N+1);
p=[1:1:N];
q=p*n;
Eig=2*(cos(q*pi)-1)';
X=dst(idst(b)./Eig);
