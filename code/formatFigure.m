%% formatFigure.m
% 
% Format default figure and predefine figure properties
%
%% Description
%
% This script modifies the default properties of figures. The script also predefines properties for area plots, line plots, and axes. These properties are contained in cell arrays. The script is used to maintain consistent formatting across all figures.
%
%% Requirements
%
% * getData.m - Load timeline (default: run in main.m)
%
%% Examples
%
%   plot(x, y, 'Color', pink)
%   xregion(x, y, grayArea{:})
%   plot(x, y, purpleLine{:})
%   yline(0.5, orangeLine{:})
%   set(gca, historicalAxis{:})
%

%% Predefine color palette

purple = '#59539d';
orange = '#d95f02';
pink = '#e7298a';

%% Predefine line thickness

thick = 2.4;
medium = thick ./ 2;
thin = thick ./ 3;

%% Predefine area transparency

opaque = 0.2;
transparent = opaque ./ 4;

%% Set default properties for figures

widthFigure = 10;
heightFigure = 5.625;
set(groot, ...
    'defaultFigureUnits', 'inches', ...
    'defaultFigurePosition', [1, 1, widthFigure, heightFigure], ...
    'defaultFigurePaperPosition', [0, 0, widthFigure, heightFigure], ...
    'defaultFigurePaperSize', [widthFigure, heightFigure], ...
    'defaultAxesFontName', 'Helvetica', ...
    'defaultAxesFontSize', 15, ...
    'defaultAxesLabelFontSizeMultiplier', 1, ...
    'defaultAxesTitleFontSizeMultiplier', 1, ...
    'defaultAxesTitleFontWeight', 'normal', ...
    'defaultAxesXColor', 'black', ...
    'defaultAxesYColor', 'black', ...
    'defaultAxesGridColor', 'black', ...
    'defaultAxesLineWidth', thin, ...
    'defaultAxesYGrid', 'on', ...
    'defaultAxesXGrid', 'off', ...
    'defaultAxesTickDirMode', 'manual', ...
    'defaultAxesTickDir', 'out', ...
    'defaultAxesTickLength', [0.005, 0.005], ...
    'defaultAxesMinorGridLineStyle', 'none' ...
)

%% Predefine area properties

% Define gray area
grayArea = {
    'FaceColor', 'black', ...
    'FaceAlpha', opaque
};

% Define purple area
purpleArea = {
    'FaceColor', purple, ...
    'FaceAlpha', opaque, ...
    'LineWidth', medium, ...
    'EdgeColor', purple
};

% Define opaque pink area
pinkOpaqueArea = {
    'FaceColor', pink, ...
    'FaceAlpha', opaque
};

% Define transparent pink area
pinkTransparentArea = {
    'FaceColor', pink, ...
    'FaceAlpha', transparent
};

%% Predefine line properties

% Define solid thick black line
blackLine = {
    'Color', 'black', ...
    'LineWidth', thick
};

% Define solid thick purple line
purpleLine = {
    'Color', purple, ...
    'LineWidth', thick
};

% Define dot-dashed thick orange line
orangeLine = {
    'Color', orange, ...
    'LineWidth', thick, ...
    'LineStyle', '-.'
};

% Define solid thin pink line
pinkLine = {
    'Color', pink, ...
    'Alpha', 1, ...
    'LineWidth', thin
};

%% Predefine axis properties

% Define x-axis for modern period: January 1960–December 2024
modernAxis = {
    'XLim', [1960, timeline(end)], ...
    'XTick', 1960 : 10 : 2020
};

% Define x-axis for historical period: April 1929–December 1959
historicalAxis = {
    'XLim', [timeline(1), 1960 - 1/12], ...
    'XTick', 1930 : 5 : 1955
};