%% table1.m
% 
% Produce table 1
%
%% Description
%
% This script produces table 1. The table displays the US recessions detected by the Michez rule, January 1960–December 2024. The table compares the Michez rule detection dates to the recession start dates and to the Sahm rule detection dates.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * getData.m - Load modern NBER recession dates (default: run in main.m)
% * detectRecessions.m - Detect modern recessions with Michez and Sahm rules (default: run in main.m)
%
%% Output
%
% * table1.csv - CSV file with table 1
% * table1.md - Markdown file with numerical results associated with table 1
%

%% Specify table ID

tableId = '1';

%% Produce table

% Assemble recession start dates, Michez rule detection dates, and Sahm rule detection dates
header = {'Recession year', 'Recession month', 'Michez year', 'Michez month', 'Sahm year', 'Sahm month'};
data = [yearNberModern, monthNberModern, yearMichezModern, monthMichezModern, yearSahmModern, monthSahmModern];

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
fprintf('* Average detection delay of Michez rule, 1960–2021: %4.1f months\n', meanDelayMichezModern)
fprintf('* Maximum detection delay of Michez rule, 1960–2021: %4.1f months\n', maxDelayMichezModern)
fprintf('* Average detection delay of Sahm rule, 1960–2021: %4.1f months\n', meanDelaySahmModern)
fprintf('* Maximum detection delay of Sahm rule, 1960–2021: %4.1f months\n', maxDelaySahmModern)
fprintf('* Post-2022 recession detected by Michez rule in %dM%d\n', yearMichezCurrent, monthMichezCurrent)
fprintf('* Post-2022 recession detected by Sahm rule in %dM%d\n', yearSahmCurrent, monthSahmCurrent)
fprintf('\n')
diary off