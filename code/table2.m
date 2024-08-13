%% table2.m
% 
% Produce table 2
%
%% Description
%
% This script produces table 2. The table displays the US recessions detected by the Michez rule, April 1929–December 1959. The table compares the Michez rule detection dates to the recession start dates.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * getData.m - Load historical NBER recession dates (default: run in main.m)
% * detectRecessions.m - Detect historical recessions with Michez rule (default: run in main.m)
%
%% Output
%
% * table2.csv - CSV file with table 2
% * table2.md - Markdown file with numerical results associated with table 2
%

%% Specify table ID

tableId = '2';

%% Produce table

% Assemble recession start dates and Michez rule detection dates
header = {'Recession year', 'Recession month', 'Michez year', 'Michez month'};
data = [yearNberHistorical, monthNberHistorical, yearMichezHistorical, monthMichezHistorical];

% Assemble table
tbl = array2table(data, 'VariableNames', header);

% Display table
fprintf('\nTable %s\n-------\n\n', tableId)
disp(tbl)

% Save table
writetable(tbl, fullfile(outputFolder, ['table', tableId, '.csv']), 'WriteMode', 'overwrite')

%% Display numerical results

% Clear result file
resultFile = fullfile(outputFolder, ['table', tableId, '.md']);
if exist(resultFile,'file'), delete(resultFile), end

% Display and save results
diary(resultFile)
fprintf('\n')
fprintf('* Average detection delay of Michez rule, 1929–1959: %4.1f months\n', meanDelayMichezHistorical)
fprintf('* Maximum detection delay of Michez rule, 1929–1959: %4.1f months\n', maxDelayMichezHistorical)
fprintf('* Average detection delay of Michez rule, 1929–2021: %4.1f months\n', meanDelayMichez)
fprintf('* Number of false positives by Sahm rule, 1929–1959: %d\n', numel(dateSahmHistorical) - numel(dateNberHistorical))
fprintf('\n')
diary off