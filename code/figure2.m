%% figure2.m
% 
% Produce figure 2
%
%% Description
%
% This script produces figure 2. The figure displays the unemployment and vacancy indicators, January 1960–December 2024. The figure illustrates the construction of the Michez rule in the modern period.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% * getData.m - Load NBER recession dates and timeline (default: run in main.m)
% * computeIndicator.m - Compute unemployment and vacancy indicators (default: run in main.m)
%
%% Output
%
% * figure2.pdf - PDF file with figure 2
% * figure2.csv - CSV file with data underlying figure 2
%

%% Specify figure ID

figureId = '2';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, modernAxis{:})

% Format y-axis
ax.YLim = [0, 4];
ax.YTick = [0, 0.5, 1 : 1 : 4];
ax.YLabel.String = 'Recession indicators (pp)';

% Shade NBER recessions
xregion(dateNber, endNber, grayArea{:})

% Highlight Sahm rule threshold
yline(0.5, pinkLine{:})

% Plot unemployment indicator
plot(timeline, uHat, blackLine{:})

% Plot vacancy indicator
plot(timeline, vHat, orangeLine{:})

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Year', 'Unemployment indicator (pp)', 'Vacancy indicator (pp)'};
data = [timeline(modernPeriod), uHat(modernPeriod), vHat(modernPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))