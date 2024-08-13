%% figure3.m
% 
% Produce figure 3
%
%% Description
%
% This script produces figure 3. The figure displays the minimum indicator and threshold of 0.29pp, January 1960–December 2024. The figure illustrates how the Michez rule operates during the modern period.
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
% * figure3.pdf - PDF file with figure 3
% * figure3.csv - CSV file with data underlying figure 3
%

%% Specify figure ID

figureId = '3';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Format x-axis
ax = gca;
set(ax, modernAxis{:})

% Format y-axis
ax.YLim = [0, 2];
ax.YTick = [0, 0.29, 0.5 : 0.5 : 2];
ax.YLabel.String = 'Minimum indicator (pp)';

% Shade NBER recessions
xregion(dateNber, endNber, grayArea{:})

% Plot Michez rule threshold
yline(0.29, pinkLine{:})

% Shade no-recession area
yregion(0, 0.29, pinkOpaqueArea{:})

% Plot minimum indicator
plot(timeline, m, purpleLine{:})

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Year', 'Minimum indicator (pp)'};
data = [timeline(modernPeriod), m(modernPeriod)];
writetable(array2table(data, 'VariableNames', header), fullfile(outputFolder, ['figure', figureId, '.csv']))