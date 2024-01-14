[x,r,l]=vypocet_shluk(@(x) 12^6/(factorial(5))*(x.^5).*exp(-12*x)); %stredni hodnota je 0.5
                            %vrati sloupec x a prislusne r a l
                            
%x->y,r->s,l->m                            
[y,s,m]=vypocet_shluk(@(x)  6^6/factorial(5)*(x.^5).*exp(-6*x)); %str. hodnota je 1

[z,t,n]=vypocet_shluk(@(x) 3^6/factorial(5)*(x.^5).*exp(-3*x)); %str. hodnota je 2
l(1)=[];
m(1)=[];
n(1)=[];
r(1)=[];
s(1)=[];
t(1)=[];
fpul=0.001*conv(r,l); % POZOR!! pokud zmenim ve "vypocet_shluk.m" krok DX, pak ho musim prepsat i TADY!!!! a taky naopak
fjedna=0.001*conv(m,s);%
fdva=0.001*conv(n,t);%
fpul=fpul(1:numel(r));
fjedna=fjedna(1:numel(s)); 
fdva=fdva(1:numel(t));
Var_pul = l+ 2*fpul - l.^2;
Rig_pul = Var_pul + (l -x.*2).^2;
Var_jedna = m + 2*fjedna -m.^2;
Rig_jedna = Var_jedna + (m-x).^2;
Var_dva = n + 2*fdva -n.^2;
Rig_dva = Var_dva + (n-x/2).^2;
 
%  plot(x,Rig_jedna)
 xlim([0 5])
 ylim([0 2])
  hold on

  plot(x,Rig_pul)
 
plot(x,Rig_dva)
 
 plot(x,Var_pul)
 plot(x,Var_dva)
 
 

% plot(x,Rig_pul-Var_pul)
 
%  plot(x,Rig_pul)
%  plot(x,Var_dva)
%  plot(x,Rig_dva)
% plot(x,Rig_pul-Var_pul)
% % xlim([0 5])
% % ylim([0 2])
% asympt_pul= x/3;
% plot(x,asympt_pul)
