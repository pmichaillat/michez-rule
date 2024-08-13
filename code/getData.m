%% getData.m
% 
% Return US unemployment rate, vacancy rate, and recession dates, April 1929–December 2024
%
%% Description
%
% This script returns monthly unemployment rate, monthly vacancy rate, and recession dates, for the United States, April 1929–December 2024.
%
%% Requirements
%
% * inputFolder - Path to input folder (default: defined in main.m)
%
%% Data source
%
% * Monthly unemployment rate, 1929–1947 - Petrosky-Nadeau and Zhang (2021)
% * Monthly unemployment level, 1948–2024  - BLS (2025d)
% * Monthly labor force level, 1948–2024  - BLS (2025a)
% * Monthly vacancy rate, 1929–1950 - Petrosky-Nadeau and Zhang (2021)
% * Monthly vacancy rate, 1951–2000 - Barnichon (2010)
% * Monthly vacancy level, 2001–2024  - BLS (2025b)
% * Recession dates, 1929–2021  - NBER (2023)
%

%% Produce unemployment rate for April 1929–December 2024

% Read unemployment rate for April 1929–December 1947
uRate1929 = readmatrix(fullfile(inputFolder, 'HistoricalSeries_JME_2020January.csv'), 'Range', 'B477:B701');

% Read unemployment level for January 1948–December 2024
uLevel1948 = readmatrix(fullfile(inputFolder, 'UNEMPLOY.csv'), 'Range', 'B2:B925');

% Read labor force level for January 1948–December 2024
laborforce1948 = readmatrix(fullfile(inputFolder, 'CLF16OV.csv'), 'Range', 'B2:B925');

% Compute unemployment rate for January 1948–December 2024
uRate1948 = uLevel1948 ./ laborforce1948 .* 100;

% Splice the two unemployment rate series into one continuous series

u = [uRate1929; uRate1948];

%% Produce vacancy rate for April 1929–December 2024

% Read vacancy rate for April 1929–December 1950

vRate1929 = readmatrix(fullfile(inputFolder, 'HistoricalSeries_JME_2020January.csv'), 'Range', 'D477:D737');

% Read vacancy rate for January 1951–December 2000

vRate1951 = readmatrix(fullfile(inputFolder, 'CompositeHWI.xlsx - Sheet1.csv'), 'Range', 'C9:C608');

% Read vacancy level for January 2001–December 2024
vLevel2001 = readmatrix(fullfile(inputFolder, 'JTSJOL.csv'), 'Range', 'B2:B289');

% Read labor force level for January 2001–December 2024
laborforce2001 = readmatrix(fullfile(inputFolder, 'CLF16OV.csv'), 'Range', 'B638:B925');

% Compute vacancy rate
vRate2001 = vLevel2001 ./ laborforce2001 .* 100;

% Splice the three vacancy rate series into one continuous series

v = [vRate1929; vRate1951; vRate2001];

%% Read official recession start dates for April 1929–December 2021

% Read datetimes for peaks of business cycles
peak = table2array(readtable(fullfile(inputFolder, '20210719_cycle_dates_pasted.csv'), 'Range', 'A22:A36'));

% Add one month to cycle peaks to obtain recession starts
recession = peak + calmonths(1);

% Translate datetimes into date numbers
dateNber = year(recession) + (month(recession) - 1) ./ 12; 

% Create helper function to extract months from date numbers
getMonth = @(date) round((date - floor(date)) .* 12 + 1, 0);

% Extract recession starts in historical period
dateNberHistorical = dateNber(dateNber < 1960);
yearNberHistorical = floor(dateNberHistorical);
monthNberHistorical = getMonth(dateNberHistorical);

% Extract recession starts in modern period
dateNberModern = dateNber(dateNber >= 1960);
yearNberModern = floor(dateNberModern);
monthNberModern = getMonth(dateNberModern);

%% Read official recession end dates for April 1929–December 2021

% Read datetimes for troughs of business cycles
trough = table2array(readtable(fullfile(inputFolder, '20210719_cycle_dates_pasted.csv'), 'Range', 'B22:B36'));

% Translate cycle-trough datetimes into recession-end date numbers
endNber = year(trough) + (month(trough) - 1) ./ 12; 

%% Specify timeline for the analysis

% Specify monthly timeline
timeline = [1929 + 3/12 : 1/12 : 2024 + 11/12]';

% Construct logical index for modern period: January 1960–December 2024
modernPeriod = timeline >= 1960;

% Construct logical index for historical period: April 1929–December 1959
historicalPeriod = timeline < 1960;