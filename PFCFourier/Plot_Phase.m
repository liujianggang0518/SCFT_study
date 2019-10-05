
function Plot_Phase( uCplx, PATTERN, Hamilton, flag )
%%% Plot the morphology of the order parameter both in the Fourier and real space;

	global pmat ncpt MPARA;

	Doc = sprintf('Figures/%s/', PATTERN);
	if exist('Figures/') == 0
		mkdir('Figures/');
	end
	if exist(Doc) == 0
		mkdir(Doc);
	end

	[DimPhy, DimCpt] = size(pmat);

	if ( min(size(uCplx)) == 1 )
		uCplx = reshape(uCplx, ncpt);
	end
		
	%%% The Fourier space;
	uCplxPhySort = Comput_Spec( uCplx );
	%%% The real space;
	if ( DimPhy == DimCpt )
		uRealPhySort = real(fftn(uCplx));
	else
		uRealPhySort = Comput_Real( uCplxPhySort );
	end

	%%% Plot figures;
	Fname = sprintf('%.4f', MPARA(1));
	if ( length(MPARA) > 2 )
		for i = 2:1:length(MPARA)-1
			Fname = sprintf('%s-%.4f', Fname, MPARA(i)); % The last model parameter is q;
		end
	end
	%%% The Fourier space;
	Plot_Spec( uCplxPhySort, PATTERN, Hamilton, flag, Fname );
	%%% The real space;
	Plot_Real( uRealPhySort, PATTERN, Hamilton, flag, Fname );

end

