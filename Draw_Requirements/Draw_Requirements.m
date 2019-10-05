 
%%% 清除;
clear; clc; close all;

%%% 'on': 图像及时显示; 'off': 取消及时显示;
set(0, 'DefaultFigureVisible', 'on');

%%% 创建文件夹存储图像;
if exist('Figures/') == 0
    mkdir('Figures/');
end

XDiv = linspace(0, 1, 20);

%%% 基本设置;
figure('Name', 'Draw Requirements', 'NumberTitle', 'off', 'Position', [400,0,800,800]);
set(gca, 'LineWidth', 2, 'FontName', 'Times New Roman', 'FontSize', 25);
hold on;
box on;
axis tight;

%%% 画图;
f1 = plot(XDiv, sin(XDiv), '--kp', 'LineWidth', 2, 'MarkerSize', 12,...
    'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
f2 = plot(XDiv, cos(XDiv), '-.b^', 'LineWidth', 2, 'MarkerSize', 12,...
    'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'b');

%%% 坐标轴显示;
xlabel('x', 'FontName', 'Times New Roman', 'FontSize', 25);
ylabel('f(x)', 'FontName', 'Times New Roman', 'FontSize', 25);

%%% 手动设置图例; 通过句柄可以选择哪些显示;
legend([f1,f2], {'sin(x)', 'cos(x)'}, 'Location',[0.50,0.25,0.50,0.10],...
	 'FontName', 'Times New Roman', 'FontSize', 20);
legend('boxoff');

%%% 设置注释;
annotation('arrow', [0.74,0.74], [0.80,0.72]);
annotation('textbox', [0.64,0.66,0.2,0.2], 'String', 'Intersection',...
    'FontSize', 25, 'FontName', 'Times New Roman',...
    'FitBoxToText', 'off', 'EdgeColor', 'none', 'Color', [0,0,0]);

%%% 图名设置;
FigName = 'Figures/Example';

%%% 保存图片, 请自行选择图片格式;
saveas(gcf, FigName, 'psc2'); % svg, psc2, pdf;

