%tato cast programu mu da:
%1)pro vybrany lane 0 nebo 1 mi da v All_delka/times/velo serazeny
%delka/times/velo podle vzorku
%2)vrati mi to array vysledek, kde mam v level sloupci density a v pravem
%prislusne intensity, to mi pak da ten fundamentalni diagram
clear all
clc
C=[]; %definuji si pole, kam budu ukladat casy, ze kterych pak budu extrahovat time-clearance
% v jednom sloupci jsou casy po sobe jdoucich 50ti aut, .. nejvetsimu
% datovymu souboru nalezi 333 vzorku, proto se pro vsechny ostatni vzorky
% doplni matice do 333ti sloupcù samymi nulami
X=[]; %analogicky definuji si pole, kam budu ukladat rychlosti, ze kterych pak budu extrahovat time-clearances
Y=[];%analogicky definuji si pole, kam budu ukladat delky aut, ze kterych pak budu extrahovat time-clearances
ID =[]; %definuji si pole, kam ulozim vysledny 2 sloupce vsech hodnot: 1 sloupec= density, 2 sloupec= intensity, a treti rozmer je k jakemu souboru to nalezi

for z=1002:1050

   filename=['Data_' num2str(z)];%naètu v jedne iteraci z datovy soubor
   feval('load',filename)
   
   B=[1 2];     %vynechanej prvek z {0,1,2} mi zustane v datech
   for k = B    %nejdriv smaze data z lane = B(1) a pak z B(2)
       A = find(lane==k);       %najde vsechna data s lane=k
 
       for i = A                %smaze vsechna data s lane=k
           lane(i)= [] ;
           delka(i)= [] ;
           time(i)= [] ;
           velo(i)= [] ;
       end

   end
 
   clear A B i k                %smaze nepotrebne promenne
   %definuji prazdna pole
   Inten=[];                    %local intensity...auta za sekundu
   Veloc=[]; %mean velocity of 50 succeeding vehicles...prumerna rychlost
   Densit=[];                   %local density...auta na metr
   
   o = floor(length(lane)/50);  %sampling size is 50
   
   for m = 1:o %calculating Intensity, velocity, density for every sample
       Inten(m) = 50/((time(m*50) +delka(m*50)/velo(m*50))-time((m-1)*50 +1));
    
       k=0;                     %useless variable
       for j = (m-1)*50 +1 : 50*m %calculates the sum of velocities of 50 succeeding vehicles
            k= velo(j) + k;
       end
       Veloc(m) = k/50;
       Densit(m) = Inten(m)/Veloc(m);
   end
   clear j k m 
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %tady ted poøešíme ty time clearance
   
   T=[];        %pro kazde z si zadefinuji T, kam nastrkam casy z 'time', ktere dam do sloupcu po 50ti autech
   for j=1:o
       for i= (j-1)*50 +1 : j*50
           T(i-(j-1)*50,j) = time(i);
       end
   end
   clear j
   
   q= int64(z) -1001;
   
   
   for j= 1: int64(size(T,2))% tady si uschovam z jednoho cyklu z=1002:1050 ty casy, abych je pak mohl za timto for cyklem sloucit do jedne array pomoci cat
        for i= 1:50 
             C(i,j,q) = T(i,j);
        end
   end
   clear i T
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %tady ted poresime ty velo, ktere budu v segmentaci pouzivat pri
   %pocitani t(out)
   
   W=[];%pro kazde z si zadefinuji array, kam nastrkam rychlosti z 'velo', ktere dam do sloupcu po 50ti autech
   for j=1:o
       for i= (j-1)*50 +1 : j*50
           W(i-(j-1)*50,j) = velo(i);
       end
   end
   
   q= int64(z) -1001;
   
   clear j
   for j= 1: int64(size(W,2))% tady si uschovam z jednoho cyklu z=1002:1050 ty rychlosti, abych je pak mohl za timto for cyklem sloucit do jedne array pomoci cat
        for i= 1:50 
             X(i,j,q) = W(i,j);
        end
   end
   clear i W
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %tady ted poresime ty delka, ktere budu v segmentaci pouzivat pri
   %pocitani t(out)
   
   Q=[];%pro kazde z si zadefinuji array, kam nastrkam rychlosti z 'velo', ktere dam do sloupcu po 50ti autech
   for j=1:o
       for i= (j-1)*50 +1 : j*50
           Q(i-(j-1)*50,j) = delka(i);
       end
   end
   
   q= int64(z) -1001;
   
   clear j
   for j= 1: int64(size(Q,2))% tady si uschovam z jednoho cyklu z=1002:1050 ty rychlosti, abych je pak mohl za timto for cyklem sloucit do jedne array pomoci cat
        for i= 1:50 
             Y(i,j,q) = Q(i,j);
        end
   end
   clear i Q
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % potrebuji nejdriv secist vsechny clearances ve vzorku(50 aut)
       %a pak kazdej ten clearance vydelit str hodnotou v tom vzorku ve
       %kterym je, to pak ulozim, a pri segmentaci, tak si vyberu pouze
       %scaled clearances ktere tam spadaji, a pro ne udelam histogram
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

%ted si vsechny casy ze vsech datovych souboru strcim do jedne VELKE matice
%'All_Times', a to tak, že prvnich X sloupcu nalezi souboru Data_1002, pak
%sloupce X+1 az X+Y nalezi Data_1003 apodobne..
All_Times=[];
for i=1:49
    All_Times = cat(2,All_Times,C(:,:,i));
end
clear C i % C uz nepotrebuji
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%analogicky All_times udelam All_velo
All_Velo=[];
for i=1:49
    All_Velo=cat(2,All_Velo,X(:,:,i));
end
clear X i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%analogicky All_times udelam All_delka
All_Delka=[];
for i=1:49
    All_Delka=cat(2,All_Delka,Y(:,:,i));
end
clear Y i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vysledek=[];% tady ted strcim vsechny ty ulozene soubory (levy soupec Density, pravy sloupec intensity)
            %do jednoho dlouheho souboru, ktery zpracuji
for j=1:49
    for k= 333*(j-1) +1: 333*j %postupne z každé matice v ID ulozim data do dlouhe array s nazvem vysledek
        vysledek(k,1) = 3.6*ID(k - 333*(j-1),1,j);%nasobim to 3.6 abych mel jednotku hustoty aut/m
        vysledek(k,2) = ID(k - 333*(j-1),2,j);
    end
end
figure(2)
plot(vysledek(:,1),vysledek(:,2),'o','MarkerFaceColor','g')
xlim([0 0.1])
ylim([0 1.2])
%scatter(vysledek(:,1),vysledek(:,2),80,'o','filled','MarkerFaceAlpha',0.6)