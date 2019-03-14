close all;
clearvars;
clc;

% Point properties
num_of_edges = 5; % minimum 3
num_of_areas = 3; % minimum 2

% Input data to P
P = rand(num_of_areas, num_of_edges);
% P = [[0.01 0.01 1]; ...
%      [1 0.01 0.01]; ...
%      [0.01 1 0.01]];
% Create generic labels
P_labels = cell(num_of_edges, 1);

for ii = 1:num_of_edges
    P_labels{ii} = sprintf('Label %i', ii);
end

% Figure properties
figure('units', 'normalized', 'outerposition', [0 0.05 1 0.95]);

% Axes properties
axes_interval = 2;
axes_precision = 1;

% Spider plot
coordinates = spider_plot(P, P_labels, axes_interval, axes_precision,...
'Marker', 'o',...
'LineStyle', '-',...
'LineWidth', 2,...
'MarkerSize', 5);

% Title properties
title('Sample Spider Plot',...
'Fontweight', 'bold',...
'FontSize', 12);

% Legend properties
legend('show', 'Location', 'southoutside');

my_metric = calc_measurement(coordinates, num_of_areas);

disp(my_metric)
