function createfigure(X1, Y1, function1)
%CREATEFIGURE1(X1, Y1, function1)
%  X1:  vector of x data
%  Y1:  vector of y data
%  FUNCTION1:  function f(x)

%  Auto-generated by MATLAB on 03-Jul-2020 10:47:32

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'DisplayName','Empirick� data',...
    'MarkerFaceColor',[0.074509803921569 0.623529411764706 1],...
    'Marker','<',...
    'LineWidth',0.8,...
    'LineStyle','none',...
    'Color',[0 0 1]);

% Create fplot
fplot(function1,[0 9],'Parent',axes1,'MarkerSize',6,'LineStyle','-',...
    'Color',[1 0 0],...
    'LineWidth',1.8);

% Create xlabel
xlabel('�k�lovan� �asov� sv�tlost (s)','FontWeight','bold');
ylabel('Logaritmus histogramu','FontWeight','bold');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontWeight','bold','GridAlpha',0.1,'LineWidth',1.5,'XGrid','on',...
    'YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.635714285714286 0.761904761904762 0.251636900570953 0.133333333333335],...
    'LineWidth',1,...
    'FontWeight','normal');

