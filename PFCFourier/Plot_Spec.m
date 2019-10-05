
function Plot_Spec( uCplxPhySort, PATTERN, Hamilton, flag, Fname )

	global Format;

	Color = [0, 0, 255;	
			255, 0, 0;
			28, 134, 238;
			244, 102, 255;
			60, 179, 113;
			];
	Color = Color / 255;

	figure('Name', ['Spectrum ', flag], 'NumberTitle', 'off', 'Position', [1200, 1200, 800, 800]);
	hold on;

	len = size(uCplxPhySort, 1);
	x = uCplxPhySort(:,1);
	y = uCplxPhySort(:,2);
	value = uCplxPhySort(:,3);
	plot(0, 0, 'MarkerFaceColor', Color(1,:), 'MarkerEdgeColor', Color(1,:), 'Marker', 'o', 'MarkerSize', 15)
	for i = 1:1:len
		 if ( value(i) > 1.0e-1 )
			 plot(x(i), y(i), 'MarkerFaceColor', Color(2,:), 'MarkerEdgeColor', Color(2,:), 'Marker', 'o', 'MarkerSize', 10);
		 elseif ( value(i) > 1.0e-2 )
			 plot(x(i), y(i), 'MarkerFaceColor', Color(3,:), 'MarkerEdgeColor', Color(3,:), 'Marker', 'o', 'MarkerSize', 8);
		 elseif ( value(i) > 1.0e-3 )
			 plot(x(i), y(i), 'MarkerFaceColor', Color(4,:), 'MarkerEdgeColor', Color(4,:), 'Marker', 'o', 'MarkerSize', 6);
		 elseif ( value(i) > 1.0e-4 )
			 plot(x(i), y(i), 'MarkerFaceColor', Color(5,:), 'MarkerEdgeColor', Color(5,:), 'Marker', 'o', 'MarkerSize', 4);
		 end
	end

	set(gca, 'LineWidth', 2, 'FontSize', 20, 'FontName', 'Times New Roman');
	axis square;
	axis equal;
	axis tight;
	camlight;
	lighting phong;
	box off;
	axis off;

	%%% Title part;
	if strcmp(Hamilton, '')
		title(Fname, 'FontSize', 20, 'FontName', 'Times New Roman');
	else
		title2 = sprintf('%.15e', Hamilton);
		title({Fname; title2}, 'FontSize', 20, 'FontName', 'Times New Roman');
	end

	%%%% Save figure;
	Fname = sprintf('Figures/%s/%s[%s]Real[%s].%s', PATTERN, PATTERN, Fname, flag, Format);
	set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0,0,8,8]);
	%set(gca, 'LooseInset', [0,0,0,0]);
	saveas(gcf, Fname);
	
end

