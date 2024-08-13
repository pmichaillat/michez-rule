%% main.m
% 
% Main script
%
%% Description
%
% This is the main script for the paper. It loads the data and performs the computations described in the paper. It then constructs the 8 figures and 2 tables included in the paper.
%
%% Output
%
% * The figures are saved as PDF files.
% * The figure data are saved as CSV files.
% * The tables are saved as CSV files.
% * The numerical results accompanying the tables are saved as Markdown files.
%

%% Clear MATLAB

% Close figure windows
close all

% Clear workspace
clear

% Clear command window
clc

%% Specify input and output folders

% Specify folder with raw data
inputFolder = fullfile('..', 'raw');

% Specify folder with figures and tables
outputFolder = fullfile('..', 'results');

%% Perform computations

% Load data on US unemployment, job vacancies, and recessions
getData

% Compute minimum indicator
computeIndicator

% Detect recessions with Michez rule
detectRecessions

%% Produce figures

% Format default figure and predefine figure properties
formatFigure

% Produce figures
figure1
figure2
figure3
figure4
figure5
figure6
figure7
figure8

%% Produce tables

table1
table2