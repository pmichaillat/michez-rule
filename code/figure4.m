%% figure4.m
% 
% Produce figure 4
%
%% Description
%
% This script produces figure 4. The figure displays the US unemployment and vacancy rates, April 1929–December 1959. Both rates are 3-month trailing averages of monthly series.
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
% * figure4.pdf - PDF file with figure 4
% * figure4.csv - CSV file with data underlying figure 4
%

%% Specify figure ID

figureId = '4';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, historicalAxis{:})

% Format y-axis
ax.YLim = [0, 26];
ax.YTick = 0 : 5 : 25;
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
data = [timeline(historicalPeriod), uBar(historicalPeriod), vBar(historicalPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))