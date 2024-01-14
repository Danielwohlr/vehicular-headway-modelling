DX=0.01; %delka kroku
MAXM=20; %pocet konvoluci

%Stredni hodnota 1
LHS=@(x) besselk(6,sqrt(2*x)).*sqrt(x)-sqrt(2)*besselk(7,sqrt(2*x));
a1 = fzero(LHS,[0.1,300])
%a1=14,2655
A1=sqrt(a1^6)/16/besselk(6,sqrt(2*a1));
f1 = @(x) A1*x.^5.*exp(-1./x-a1/2.*x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Stredni hodnota 2
LHS=@(x) 2*besselk(6,sqrt(2*x)).*sqrt(x)-sqrt(2)*besselk(7,sqrt(2*x));
a2 = fzero(LHS,[0.1,300])
%a2=6,5789
A2=sqrt(a2^6)/16/besselk(6,sqrt(2*a2));
f2 = @(x) A2*x.^5.*exp(-1./x-a2/2.*x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Stredni hodnota 1/2
LHS=@(x) 1/2*besselk(6,sqrt(2*x)).*sqrt(x)-sqrt(2)*besselk(7,sqrt(2*x));
a3 = fzero(LHS,[0.1,300])
%a3 = 32,8194
A3=sqrt(a3^6)/16/besselk(6,sqrt(2*a3));
f3 = @(x) A3*x.^5.*exp(-1./x-a3/2.*x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=[0:DX:20];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ff1=[0 f1(x(2:end))];
r1=ff1;
fkonv=ff1;
for i=[1:MAXM] 
	fkonv=DX*conv(ff1,fkonv);
        fkonv=fkonv(1:numel(r1));
	r1=r1+fkonv;  %zde r=castecny soucet m=0 do m=i
end
l1=cumsum(r1)*DX;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ff2=[0 f2(x(2:end))];
r2=ff2;
fkonv=ff2;
for i=[1:MAXM] 
	fkonv=DX*conv(ff2,fkonv);
        fkonv=fkonv(1:numel(r2));
	r2=r2+fkonv;  %zde r=castecny soucet m=0 do m=i
end
l2=cumsum(r2)*DX;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ff3=[0 f3(x(2:end))];
r3=ff3;
fkonv=ff3;
for i=[1:MAXM] 
	fkonv=DX*conv(ff3,fkonv);
        fkonv=fkonv(1:numel(r3));
	r3=r3+fkonv;  %zde r=castecny soucet m=0 do m=i
end
l3=cumsum(r3)*DX;

plot(x,l1)
hold on
plot(x,l2)
plot(x,l3)
xlim([0 4])
ylim([0 4])
plot(x,2*x)
plot(x,x)
plot(x,x/2)

% 
% %rigidita
% konvoluce=DX*conv(r3,l3);
% konvoluce=konvoluce(1:numel(r3));
% Var = l3 + 2*konvoluce -l3.^2;
% Rig = Var +(l3 -x*2).^2;
% 
% honvoluce=DX*conv(r2,l2);
% honvoluce=honvoluce(1:numel(r2));
% Varh = l2 + 2*honvoluce -l2.^2;
% Righ = Varh +(l2 -x/2).^2;
% 
% jonvoluce = DX*conv(r1,l1);
% jonvoluce=jonvoluce(1:numel(r1));
% Varj=l1 +2*jonvoluce -l1.^2;
% Rigj = Varj +(l1-x).^2;
% 
% % plot(x,Var)
% 
% % plot(x,Rig)
% % hold on
% % %  plot(x,Varh)
% %  plot(x,Righ)
% % % plot(x,Varj)
% % plot(x,Rigj)
% plot(x,Rig-Var) %nejvyssi
% hold on
% plot(x,Righ-Varh) %nejnizsi
% plot(x,Rigj-Varj) %uprostred