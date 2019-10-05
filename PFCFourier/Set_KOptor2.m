%%%% Set K^2 and K in the Fourier space;
%%%% The same function of Set_KOptor1.m but using matrix operation and only for a square space discretization;
%%%% Set_KOptor2.m is slower than Set_KOptor1.m; giving up;
function Set_KOptor2( )

	global ncpt pmat rcpBox; % DimCptgth(ncpt) = DimCpt;
	global KSquare KSingle;
	[DimPhy, DimCpt] = size(pmat);

	if ( min(ncpt) ~= max(ncpt) )
		fprintf('WARNING: Not a square space discretization!!\n');
		fprintf('WARNING: Misusing function Set_KOptor2.m in the discretization!!\n');
		fprintf('WARNING: Using another function SetKOptor1.m, please!!\n\n');
		return;
	end

	prodcpt = prod(ncpt);
	Value = ncpt(1);	% ncpt(1) = ncpt(2) = ... = ncpt(n);

	%%%% Obtaining the practical index which is not the MATLAB index; % KSR: DimCpt * prodcpt;
	if ( DimCpt == 1 )
		KSR = [1:1:prodcpt] - 1;
	elseif ( DimCpt == 2 )
		[k1, k2] = ind2sub(ncpt, [1:1:prodcpt]);
		KSR = [k1; k2] - 1;
	elseif ( DimCpt == 3 )
		[k1, k2, k3] = ind2sub(ncpt, [1:1:prodcpt]);
		KSR = [k1; k2; k3] - 1;
	elseif ( DimCpt == 4 )
		[k1, k2, k3, k4] = ind2sub(ncpt, [1:1:prodcpt]);
		KSR = [k1; k2; k3; k4] - 1;
	elseif ( DimCpt == 5 )
		[k1, k2, k3, k4, k5] = ind2sub(ncpt, [1:1:prodcpt]);
		KSR = [k1; k2; k3; k4; k5] - 1;
	elseif ( DimCpt == 6 )
		[k1, k2, k3, k4, k5, k6] = ind2sub(ncpt, [1:1:prodcpt]);
		KSR = [k1; k2; k3; k4; k5; k6] - 1;
	else
		fprintf('WARNING: The dimension is beyond our control!!\n\n');
		return;
	end
	KSR(KSR>Value/2) = KSR(KSR>Value/2) - Value;


	%%%% Obtaining K^2 and K in the Fourier space;
	%% Initializing;
	KSquare = zeros(prodcpt, 1);
	KSingle = cell(1, DimPhy);
	for ii = 1:1:DimPhy
		KSingle{ii} = zeros(prodcpt, 1);
	end
	%% Setting;
	for j = 1:1:prodcpt
		PKSR = pmat * rcpBox * KSR(:,j);
		KSquare(j) = sum(PKSR.^2);
		for ii = 1:1:DimPhy
			kSinle{ii}(j) = PKSR(DimPhy-ii+1);	% Reversing;
		end
	end
	%% Reshaping;
	KSquare = reshape(KSquare, ncpt);
	for ii = 1:1:DimPhy
		KSingle{ii} = reshape(KSingle{ii}, ncpt);
	end

end

