clc

ID =[]; %definuji si pole, kam ulozim vysledny 2 sloupce vsech hodnot: 1 sloupec= density, 2 sloupec= intensity, a treti rozmer je k jakemu souboru to nalezi
for z=1002:1050

   filename=['Data_' num2str(z)];%naètu v jedne iteraci z datovy soubor
   feval('load',filename)
   
   B=[0 2];%vynechanej prvek z {0,1,2} mi zustane v datech
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
   %definuji prazdna pole
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
   
   z=int64(z);%pretypovavam..nejsem si jistej jestli to je treba
   j= z-1001;
   Z = table2array(Tid); %pretypuji table na array
   
   for i= 1:int64(height(Tid)) %strkam vysledky Tid do 3-rozmerne matice
       ID(i,1,j) = Z(i,1);
   end
   clear i
   for i=1: int64(height(Tid))
       ID(i,2,j) = Z(i,2);
   end
   clear i
   
   
   
end %skoncil vypocet, uz mam vse potrebne, vse nize si jen upravuji do podoby, kterou chci
clear j z filename Z

vysledek_1=[];% tady ted strcim vsechny ty ulozene soubory (levy soupec Density, pravy sloupec intensity)
            %do jednoho dlouheho souboru, ktery zpracuji
for j=1:49
    for k= 334*(j-1) +1: 334*j %postupne z každé matice v ID ulozim data do dlouhe array s nazvem vysledek
        vysledek_1(k,1) = ID(k - 334*(j-1),1,j);
        vysledek_1(k,2) = ID(k - 334*(j-1),2,j);
    end
end
%plot(vysledek_1(:,1),vysledek_1(:,2))