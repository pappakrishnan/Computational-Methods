q=1.602e-19; 
m0=9.11e-31;
h1=1.602e-34; 
h=h1*2*pi; 
k=1.38e-23;
m=0.98*m0;  %for Silicon
T=300;
N=sqrt(2)/pi^2*(m/h1^2)^(3/2);
NF=inline('N*sqrt(E)*1./(1+exp((E-Ef)/(k*T)))','E','N','k','T','Ef')
Nc=2*((2*pi*m*k*T)/h^2).^(3/2);
n0=[];
n=1;
for Ef=-0.5*q:0.05*q:0.1*q;
n0(n)=quad(@(E)NF(E,N,k,T,Ef),0,0.4*q,1e-4); n=n+1;
end
Ef=-0.5*q:0.05*q:0.1*q;
semilogy(Ef/q,n0/1e6,Ef/q,Nc*exp(Ef/k/T)/1e6);
xlabel('Ef-Ec eV'); ylabel('Carrier Concentration Cm-3')