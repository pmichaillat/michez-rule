%% detectRecessions.m
% 
% Detect US recessions with the Michez rule, April 1929–December 2024
%
%% Description
%
% This script detects US recessions with the Michez rule, April 1929–December 2024. The script also computes the US recession probability with the dual-threshold Michez rule.
%
% As a benchmark, the script also detects US recessions with the Sahm rule.
%
% Finally, the script computes summary statistics for the detection delays of the Michez and Sahm rules.
%
%% Requirements
%
% * getData.m - Load NBER recession dates and timeline (default: run in main.m)
% * computeIndicator.m - Compute unemployment and minimum indicators (default: run in main.m)
%

%% Detect recessions with Michez rule

% Determine detection indices from equation (4)
iMichez = find(m(1 : end-1) < 0.29 & m(2 : end) >= 0.29);

% Translate indices into dates
dateMichez = timeline(iMichez + 1);

% Extract detection dates in historical period
dateMichezHistorical = dateMichez(dateMichez < 1960);
yearMichezHistorical = floor(dateMichezHistorical);
monthMichezHistorical = getMonth(dateMichezHistorical);

% Extract detection dates in modern period
dateMichezModern = dateMichez(dateMichez >= 1960 & dateMichez < 2022);
yearMichezModern = floor(dateMichezModern);
monthMichezModern = getMonth(dateMichezModern);

% Extract detection dates in current period
dateMichezCurrent = dateMichez(dateMichez >= 2022);
yearMichezCurrent = floor(dateMichezCurrent);
monthMichezCurrent = getMonth(dateMichezCurrent);

%% Detect recessions with Sahm rule

% Determine detection indices from equation (5)
iSahm = find(uHat(1 : end-1) < 0.5 & uHat(2 : end) >= 0.5);

% Translate indices into dates
dateSahm = timeline(iSahm + 1);

% Extract detection dates in historical period
dateSahmHistorical = dateSahm(dateSahm < 1960);
yearSahmHistorical = floor(dateSahmHistorical);
monthSahmHistorical = getMonth(dateSahmHistorical);

% Extract detection dates in modern period
dateSahmModern = dateSahm(dateSahm >= 1960 & dateSahm < 2022);
yearSahmModern = floor(dateSahmModern);
monthSahmModern = getMonth(dateSahmModern);

% Extract detection dates in current period
dateSahmCurrent = dateSahm(dateSahm >= 2022);
yearSahmCurrent = floor(dateSahmCurrent);
monthSahmCurrent = getMonth(dateSahmCurrent);

%% Compute delay in detecting recessions

% Average delay of Michez rule 
meanDelayMichez = mean(dateMichez(1 : end-1) - dateNber) .* 12;

% Average delay of Michez rule in historical period
meanDelayMichezHistorical = mean(dateMichezHistorical - dateNberHistorical) .* 12;

% Average delay of Michez rule in modern period
meanDelayMichezModern = mean(dateMichezModern - dateNberModern) .* 12;

% Average delay of Sahm rule in modern period
meanDelaySahmModern = mean(dateSahmModern - dateNberModern) .* 12;

% Average delay of Michez rule in historical period
maxDelayMichezHistorical = max(dateMichezHistorical - dateNberHistorical) .* 12;

% Average delay of Michez rule in modern period
maxDelayMichezModern = max(dateMichezModern - dateNberModern) .* 12;

% Average delay of Sahm rule in modern period
maxDelaySahmModern = max(dateSahmModern - dateNberModern) .* 12;

%% Compute recession probability with dual-threshold Michez rule

% Compute recession probability from equation (6)
p = (m - 0.29) ./ (0.81 - 0.29);

% Set probability to 0 when minimum indicator is below 0.29
p = max(p, 0);

% Set probability to 1 when minimum indicator is above 0.81
p = min(p, 1);