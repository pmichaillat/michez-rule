%% computeIndicator.m
% 
% Compute the minimum indicator, April 1929–December 2024
%
%% Description
%
% This script computes the minimum indicator, April 1929–December 2024. This is the recession indictor used by the Michez rule. 
%
% To obtain the minimum indicator, the script computes two other recession indicators: the unemployment indicator, used by the Sahm rule, and the vacancy indicator. 
%
% To obtain the unemployment and vacancy indicators, the script starts by computing the 3-month trailing averages of the unemployment and vacancy rates.
%
%% Requirements
%
% * getData.m - Load monthly unemployment and vacancy rates (default: run in main.m)
%

%% Compute unemployment indicator

% Compute 3-month trailing average of unemployment rate
uBar = movmean(u, [2, 0]);

% Compute unemployment indicator from equation (1)
uHatExact = uBar - movmin(uBar, [12, 0]);

% Set indicator precision to basis point to match threshold precision
uHat = round(uHatExact, 2);

%% Compute vacancy indicator

% Compute 3-month trailing average of vacancy rate
vBar = movmean(v, [2, 0]);

% Compute vacancy indicator from equation (2)
vHatExact = movmax(vBar, [12, 0]) - vBar;

% Set indicator precision to basis point to match threshold precision
vHat = round(vHatExact, 2);

%% Compute minimum indicator from equation (3)

m  = min(uHat, vHat);