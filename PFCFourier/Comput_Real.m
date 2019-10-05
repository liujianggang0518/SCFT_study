
function uRealPhySort = Comput_Real( uCplxPhySort )
%%%% Compute the quasi-crystals data of the physical space both in the real space;
%%%% Considering its physical space is 2D;

	global ncpt pmat rcpBox;

	if ( max(ncpt) ~= min(ncpt) ) || ( size(pmat,1) ~= 2 ) || ( size(pmat,1) >= size(pmat,2) )
		fprintf('WARNING: Misusing function Comput_Real.m in the discretization!!\n\n');
		return;
	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Real space;

    %% 'N': the number of the points in each direction;
    %% 'reg': the region of the square box;
    N = 256;
    reg = 16*pi;

	%%% compute the domaint part in the real space;
	x = linspace(-reg, reg, N);     y = x;
	[DimPhy, DimCpt] = size(pmat);
	len = size(uCplxPhySort, 1);
	uRealPhySort = zeros(N, N);

	%%% compute the domaint component;
	for i = 1:1:N
		for j = 1:1:N
			%% the coordinate in the physical space;
			r = [x(i);y(j)];
			%% selection;
			sel = 0;
			for k1 = 1:1:len
				%%% only for 2D physical coordinates;
				sel = sel + uCplxPhySort(k1,end) * cos(uCplxPhySort(k1,1:1:DimPhy)*r);
			end
			%% select the dominant component;
			uRealPhySort(i,j) = real(sel);
		end
	end

end

