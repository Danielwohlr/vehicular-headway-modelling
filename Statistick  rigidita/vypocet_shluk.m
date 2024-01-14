function [x,r,l] = vypocet_shluk(f)
    %input je napø '@(x) 16*x.*exp(-4*x)'
    %output jsou 3 vektory x,r a l
    DX=0.001; %delka kroku
    MAXM=40; %pocet konvoluci
    
    x=[0:DX:10]; %na jakem intervalu chci shlukovou fci
    ff=[0 f(x(1:end))]; %nacteni hustoty do promenne ff
    %vypocet shlukove funkce
    r=ff;
    fkonv=ff;
    for i=[1:MAXM] 
	fkonv=DX*conv(ff,fkonv);
        fkonv=fkonv(1:numel(r));
	r=r+fkonv;  %zde r=castecny soucet m=0 do m=i

    end
    %vypocet trendove funkce
    l=cumsum(r)*DX;
    % v r a l mam ulozene vysledky
end