function funddiagram(X1, Y1)
%CREATEFIGURE1(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 03-Jul-2020 15:00:55

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,...
    'MarkerFaceColor',[0.301960784313725 0.745098039215686 0.933333333333333],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Dopravn� intenzita');

% Create xlabel
xlabel('Dopravn� hustota');

% Uncomment the following line to preserve the X-limits of the axes
 xlim(axes1,[0 0.1]);
% Uncomment the following line to preserve the Y-limits of the axes
 ylim(axes1,[0 1.2]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',12,'FontWeight','bold','LineWidth',1.5);
