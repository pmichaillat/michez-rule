%% figure1.m
% 
% Produce figure 1
%
%% Description
%
% This script produces figure 1. The figure displays the US unemployment and vacancy rates, January 1960–December 2024. Both rates are 3-month trailing averages of monthly series.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% * getData.m - Load NBER recession dates and timeline (default: run in main.m)
% * computeIndicator.m - Compute smooth unemployment and vacancy rates (default: run in main.m)
%
%% Output
%
% * figure1.pdf - PDF file with figure 1
% * figure1.csv - CSV file with data underlying figure 1
%

%% Specify figure ID

figureId = '1';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, modernAxis{:})

% Format y-axis
ax.YLim = [0, 14];
ax.YTick = 0 : 2 : 14;
ax.YLabel.String = 'Share of labor force (%)';

% Shade NBER recessions
xregion(dateNber, endNber, grayArea{:})

% Plot smooth unemployment rate
plot(timeline, uBar, blackLine{:})

% Plot smooth vacancy rate
plot(timeline, vBar, orangeLine{:})

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Year', 'Smooth unemployment rate (%)', 'Smooth vacancy rate (%)'};
data = [timeline(modernPeriod), uBar(modernPeriod), vBar(modernPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))