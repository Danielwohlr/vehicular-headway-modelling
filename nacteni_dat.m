clc
load('Data_1002')
B=[1 2];%vynechanej prvek z {0,1,2} mi zustane v datech
for k = B%nejdriv smaze data z lane = B(1) a pak z B(2)
    A = find(lane==k); %najde vsechna data s lane=k
 
    for i = A %smaze vsechna data s lane=k
     lane(i)= [] ;
     delka(i)= [] ;
     time(i)= [] ;
     velo(i)= [] ;
    end

end
 
clear A B i k %smaze nepotrebne promenne
Inten=[]; %local intensity...auta za sekundu
Veloc=[]; %mean velocity of 50 succeeding vehicles...prumerna rychlost
Densit=[];%local density...auta na metr
o = floor(length(lane)/50);%sampling size is 50
for m = 1:o %calculating Intensity, velocity, density for every sample
    Inten(m) = 50/((time(m*50) +delka(m*50)/velo(m*50))-time((m-1)*50 +1));

    k=0;%useless variable
    for j = (m-1)*50 +1 : 50*m %calculates the sum of velocities of 50 succeeding vehicles
        k= velo(j) + k;
    end
    Veloc(m) = k/50;
    Densit(m) = Inten(m)/Veloc(m);
end
clear j k m o
% plot(Densit,Inten,'*')
Inten = Inten';
Densit = Densit';
Veloc = Veloc';
Tid = table(Densit, Inten);
% Tvd = table(Densit, Veloc);