%% figure8.m
% 
% Produce figure 8
%
%% Description
%
% This script produces figure 8. The figure displays the probability of US recession obtained from the dual-threshold Michez rule, January 1960–December 2024.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% * getData.m - Load NBER recession dates and timeline (default: run in main.m)
% * detectRecessions.m - Compute recession probability (default: run in main.m)
%
%% Output
%
% * figure8.pdf - PDF file with figure 8
% * figure8.csv - CSV file with data underlying figure 8
%

%% Specify figure ID

figureId = '8';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, modernAxis{:})

% Format y-axis
ax.YLim = [0, 1];
ax.YTick = 0 : 0.2 : 1;
ax.YLabel.String = 'Recession probability';

% Shade NBER recessions
xregion(dateNber, endNber, grayArea{:})

% Plot recession probability
area(timeline, p, purpleArea{:})

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Year', 'Recession probability'};
data = [timeline(modernPeriod), p(modernPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))