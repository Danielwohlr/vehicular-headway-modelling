%b1,..,b9 oznacuji stredy tech segmentu, kterym priradim nejakou hodnotu

K=[median(s1(:,1))  median(s2(:,1))  median(s3(:,1))  median(s4(:,1)) median(s5(:,1))  median(s6(:,1))  median(s7(:,1))   median(s8(:,1))  median(s9(:,1)) ;
 median(s1(:,2))   median(s2(:,2))   median(s3(:,2))   median(s4(:,2))   median(s5(:,2))  median(s6(:,2))   median(s7(:,2))  median(s8(:,2)) median(s9(:,2));
 -1.327  -1.341   -1.329  -1.16   -1.288   -1.363   -1.33   -1.714  -1.307  ]


vysledek(:,3)=0;

K=K';
XABOOM =cat(1,vysledek,K)


%     plot3(XABOOM(:,1),XABOOM(:,2),XABOOM(:,3),'p')
%     hold on
% 
% for j=length(XABOOM)-9:length(XABOOM)
%      plot3(XABOOM(j,1),XABOOM(j,2),XABOOM(j,3),'h','MarkerSize',2,'Color',[0 0 1],'MarkerFaceColor',[0.301960784313725 0.745098039215686 0.933333333333333])
% end
% 
% plot3([XABOOM(16318,1), XABOOM(16318,1)], [XABOOM(16318,2), XABOOM(16318,2)], [XABOOM(16318,3), XABOOM(16318,3)], 'g--')
% 
% plot3([XABOOM(16319,1), XABOOM(16319,1)], [XABOOM(16319,2), XABOOM(16319,2)], [XABOOM(16319,3), XABOOM(16319,3)], 'g--')
% 
% plot3([XABOOM(16320,1), XABOOM(16320,1)], [XABOOM(16320,2), XABOOM(16320,2)], [XABOOM(16320,3), XABOOM(16320,3)], 'g--')
% 
% plot3([XABOOM(16321,1), XABOOM(16321,1)], [XABOOM(16321,2), XABOOM(16321,2)], [XABOOM(16321,3), XABOOM(16321,3)], 'g--')
% 
% plot3([XABOOM(16322,1), XABOOM(16322,1)], [XABOOM(16322,2), XABOOM(16322,2)], [XABOOM(16322,3), XABOOM(16322,3)], 'g--')
% 
% plot3([XABOOM(16323,1), XABOOM(16323,1)], [XABOOM(16323,2), XABOOM(16323,2)], [XABOOM(16323,3), XABOOM(16323,3)], 'g--')
% 
% plot3([XABOOM(16324,1), XABOOM(16324,1)], [XABOOM(16324,2), XABOOM(16324,2)], [XABOOM(16324,3), XABOOM(16324,3)], 'g--')
% 
% plot3([XABOOM(16325,1), XABOOM(16325,1)], [XABOOM(16325,2), XABOOM(16325,2)], [XABOOM(16325,3), XABOOM(16325,3)], 'g--')
% 
% plot3([XABOOM(16326,1), XABOOM(16326,1)], [XABOOM(16326,2), XABOOM(16326,2)], [XABOOM(16326,3), XABOOM(16326,3)], 'g--')
% plot3([XABOOM(16318,1), XABOOM(16318,1)], [XABOOM(16318,2), XABOOM(16318,2)], [0, XABOOM(16318,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16319,1), XABOOM(16319,1)], [XABOOM(16319,2), XABOOM(16319,2)], [0, XABOOM(16319,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16320,1), XABOOM(16320,1)], [XABOOM(16320,2), XABOOM(16320,2)], [0, XABOOM(16320,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16321,1), XABOOM(16321,1)], [XABOOM(16321,2), XABOOM(16321,2)], [0, XABOOM(16321,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16322,1), XABOOM(16322,1)], [XABOOM(16322,2), XABOOM(16322,2)], [0, XABOOM(16322,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16323,1), XABOOM(16323,1)], [XABOOM(16323,2), XABOOM(16323,2)], [0, XABOOM(16323,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16324,1), XABOOM(16324,1)], [XABOOM(16324,2), XABOOM(16324,2)], [0, XABOOM(16324,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16325,1), XABOOM(16325,1)], [XABOOM(16325,2), XABOOM(16325,2)], [0, XABOOM(16325,3)], 'r--','LineWidth',1.5)
% 
% plot3([XABOOM(16326,1), XABOOM(16326,1)], [XABOOM(16326,2), XABOOM(16326,2)], [0, XABOOM(16326,3)], 'r--','LineWidth',1.5)
% 

%VSE PREDCHOZI JE K NICEMU:::: TOHLE JE TO CO POTREBUJES
 createContour(transpose(K(:,1)),transpose(K(:,2)),transpose(K(:,3)))