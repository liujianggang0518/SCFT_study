
function Plot_Real( uReal, PATTERN, Hamilton, flag, Fname )
%%%% Plot the morphology of crystals in the real space;

	global ncpt pmat rcpBox Format;

	[DimPhy, DimCpt] = size(pmat);


	figure('Name', ['Structure ', flag], 'NumberTitle', 'off', 'Position', [1200, 1200, 800, 800]);

	if ( DimPhy == 2 )

		%uReal = uRealPhySort; % for quasicrystals;
		imagesc(uReal);
		colormap(jet);
		colorbar;

	elseif ( DimPhy == 3 )

		set(gcf, 'color', 'white')
		minu = min(uReal(:));
		maxu = max(uReal(:));
		isoA = minu+0.7*(maxu-minu);

		x = linspace(0, 2*pi/rcpBox(1,1), ncpt(1));
		y = linspace(0, 2*pi/rcpBox(2,2), ncpt(2));
		z = linspace(0, 2*pi/rcpBox(3,3), ncpt(3));
		[X Y Z] = meshgrid(x, y, z);

		alpA = 1.0;
		patch( isosurface(X,Y,Z, uReal, isoA), 'facecolor', 'red', 'FaceAlpha', alpA, 'edgecolor','none');
		patch( isocaps(X,Y,Z, uReal, isoA, 'enclose'), 'facecolor', 'none', 'FaceAlpha', alpA, 'edgecolor','flat');
		colormap('jet');
		%%%
		daspect([1, 1, 1]);
		camup([1, 0, 0]);
		campos([25, -55, 5]);
		%%%
		if strcmp(PATTERN, 'Sigma')
			view(0, -90);
			%view(112, 35);
		else
			view(112, 35);
		end
	%	view(3)
		%%%
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
	Fname = sprintf('Figures/%s/%s[%s]Spec[%s].%s', PATTERN, PATTERN, Fname, flag, Format);
	set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0,0,8,8]);
	%set(gca, 'LooseInset', [0,0,0,0]);
	saveas(gcf, Fname);
	
end

