%tato cast programu mi vybere segment z fundamentalniho diagramu, ktery si
%specifikuji (v prvnich radcich tohoto programu)
%ty casti z fundamentalniho diagramu, ktere jsou mimo vybrany segment, tak
%prepisu na 0 a pak najdu ty, ktery jsou nenulove(tzn ty ktere nalezi
%segmentu) a ulozim je to promenne 'Segment'
%zpetne se pak kouknu podle indexu na clearances ve vzorcich, ktere nalezi
%segmentu a preskaluji je
%pak plotnu jejich pdf, kazdemu bodu uprostred binu priradim hodnotu
%histogramu, ktera nalezi tomu binu
%ty hodnoty pak zlogaritmuju a plotnu
%potom pro hodnoty te pdf, že x>x_0 tam fitnu primku pomoc cftool, kde mimo
%jine najdu i super parametry toho, jak je to dobrej fit
%to vse plotnu na jeden graf
load('matlabdataz0')%nacte mi data ze segmnetu
load('VD_barvy')
VD_diagram=cat(1,VD1,VD2,VD3,VD4,VD5,VD6,VD7);
clc
segment_den = vysledek(:,1);
segment_int = vysledek(:,2);
%s1,..s9 budou odpovidajici segmenty
MK = find(min(S6(:,1)) > segment_den | segment_den > max(S6(:,1))); %vybiram segment, s podminkou na density(osa x)
for j = MK %MK je random nazev
   vysledek(j,1) = 0;
   vysledek(j,2) = 0;
end

clear i MK j

A = find(min(S6(:,2)) > segment_int | segment_int >max(S6(:,2)));  %vybiram segment, s podminkou na intensity(osa y)
for j = A
   vysledek(j,1) = 0;
   vysledek(j,2) = 0;
end
% figure(1)
% plot(vysledek(:,1),vysledek(:,2),'o')
% xlim([0 0.1])
% ylim([0 1.2])
clear i A j

segment_den = vysledek(:,1);%znova priradim jiz upravenemu vysledku 
A = find(segment_den ~= 0);%smazu si vsechny nuly..delam to proto, abych vedel kolik vzorkovacich prvku vlastne
                            %v tom vybranym segmentu mam
Segment = vysledek(A,:);    %definuji vysledky z vybraneho segmentu, ve kterých to proškáluji

plot(Segment(:,1),Segment(:,2)) %tady mi to plotne jenom ty vzorky, pro
% ktere je ID realce uvnitr vybraneho segmentu... slouzi to spise pro
% kontrolu spravnosti.. je to ten stejny plot jako
% plot(vysledek(:,1),vysledek(:,2))
%All_Times(:,A);

%vypoctu si vsechny clearances z dat, co mam vybrane v segmentu
for j=A 
    for i=1:49
        Clear(i,:) = All_Times(i+1,j)- (All_Times(i,j) + All_Delka(i,j)/All_Velo(i,j));%uvnitr Clear mam ulozene clearances prislusnych vzorku..kazdy sloupec odpovida jednomu vzorku
    end
end
clear j i


for j=1: length(A)         %tady si ted spoctu sumu clearancu v kazdem vzorku, to je proto, abych pak mohl ty clearance skalovat
    k=0;
    for i=1:49
        k = Clear(i,j) + k;
    end
    sum_celkovy(j)=k;
    
end
clear j k i

%ted prepisu Clear, na skalovane Clear, tedy kazdej ten prvek v Clear
%vynasobim 49 a pak vydelim prislusnym souctem clearancu v tom vzorku
for j=1:length(A)
    for i=1:49
        Clear(i,j) = Clear(i,j)*49/sum_celkovy(j);
    end
end
clear i j

%edges=[0:0.09:2.5   2.5:0.2:3.5  3.5:0.05:4.5]; % kdyz neni histogram od
%Matlabu hezky, vyuzij tyhle edges, a navic do histogram zavorek pripis
%'edges'
figure(2)
edges=[0:0.1:1  1:0.1:1.3 1.3:0.2:1.5 1.5:0.2:2.1  2.1:0.3:2.7  2.7:0.3:3.6  3.6:0.8:4.2  4.2:1.5:5.7  5.7:2.5:8];
h= histogram(Clear,edges,'Normalization','pdf')
clear edges

for j=1:length(h.Values)  %spoctu si x data jako stred binu a k nim priradim y data jako hodnoty histogramu
    Dat_X(j) = (h.BinEdges(j+1) -h.BinEdges(j))/2 + h.BinEdges(j);
end
clear j

for j=1:length(h.BinEdges) -1 %priradim si si y data jako hodntoy histogramu
    Dat_Y(j) = h.Values(j);
end
% figure(3)
% plot(Dat_X,log(Dat_Y),'o','MarkerFaceColor','green') %ukazu si prislusna zlogaritmovana data
X = find(Dat_X >2.5); %tady si najdu data ktere prislusi skalovanym roztecim vetsi nez 1, ptz me zajima chvost
Y=Dat_Y(X); %najdu si Y ktere prislusi X vetsi jak 1
X = Dat_X(X); 
%cftool(X,log(Y))  %tady v tabulce najdu prislusne koeficienty pro primku,
%kterou to prolozim, navic tam najdu i 95%-interval spoelhlivosti, ktery si
%taky plotnu, a to pomoci f_U a f_L (upper, lower) a vsechno to flaknu do
%jednoho obrazku

 hold on
% 
 f =@(x)   -1.428 .*x   -0.9236   ;
% 
% f_U =@(x) -1.408.*x +0.6287; cftool mi da k dispozici i koeficienty pro interval spolehlivosti
% f_L =@(x) -1.354.*x + 0.8164;
% fplot(f,[1.5 9],'LineWidth',2)
% 
% fplot(f_U,[0 7])
% fplot(f_L,[0 7])

 %createfigure(Dat_X,log(Dat_Y),f)
 %createhist(Clear)