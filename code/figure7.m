%% figure7.m
% 
% Produce figure 7
%
%% Description
%
% This script produces figure 7. The figure displays the minimum indicator and thresholds of 0.29pp and 0.81pp, January 1960–December 2024. The figure illustrates how the dual-threshold Michez rule operates.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% * getData.m - Load NBER recession dates and timeline (default: run in main.m)
% * computeIndicator.m - Compute minimum indicator (default: run in main.m)
%
%% Output
%
% * figure7.pdf - PDF file with figure 7
% * figure7.csv - CSV file with data underlying figure 7
%

%% Specify figure ID

figureId = '7';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, modernAxis{:})

% Format y-axis
ax.YLim = [0, 2];
ax.YTick = [0, 0.29, 0.5, 0.81, 1, 1.5, 2];
ax.YLabel.String = 'Minimum indicator (pp)';

% Shade NBER recessions
xregion(dateNber, endNber, grayArea{:})

% Plot Michez rule thresholds
yline(0.29, pinkLine{:})
yline(0.81, pinkLine{:})

% Shade no-recession area
yregion(0, 0.29, pinkOpaqueArea{:})

% Shade probable-recession area
yregion(0.29, 0.81, pinkTransparentArea{:})

% Plot minimum indicator
plot(timeline, m, purpleLine{:})

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Year', 'Minimum indicator (pp)'};
data = [timeline(modernPeriod), m(modernPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))