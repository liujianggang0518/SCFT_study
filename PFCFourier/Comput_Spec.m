
function uCplxPhySort = Comput_Spec( uCplx )
%%%% Compute the quasi-crystals or crystals data of the physical space both in the Fourier space;
%%%% Considering its physical space is 2D or 3D;

	global ncpt pmat rcpBox;

	if ( max(ncpt) ~= min(ncpt) ) || ( size(pmat,1) ~= 2 )
		fprintf('WARNING: Misusing function Comput_Spec.m in the discretization!!\n\n');
		return;
	end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Fourier coefficient;

	SortNum = 1e2;	%%% The maximal number of uCplx which will be utilized to calculated the real space of the physical space part;
	[DimPhy, DimCpt] = size(pmat);
	prodcpt = prod(ncpt);
	rpmat = pmat * rcpBox;
	
	if ( DimCpt == 2 )
		[k1, k2] = ind2sub(ncpt, [1:1:prodcpt]);
		kindex = [k1; k2] - 1;
	elseif ( DimCpt == 3 )
		[k1, k2, k3] = ind2sub(ncpt, [1:1:prodcpt]);
		kindex = [k1; k2; k3] - 1;
	elseif ( DimCpt == 4 )
		[k1, k2, k3, k4] = ind2sub(ncpt, [1:1:prodcpt]);
		kindex = [k1; k2; k3; k4] - 1;
	else
		fprintf('WARNING: Misusing function Comput_Spec.m in the dimension!!\n\n');
		return;
	end
	kindex(kindex>ncpt(1)/2) = kindex(kindex>ncpt(1)/2) - ncpt(1);


	%%% Projecting the computational space position into the physical space position;
	uCplxPhy = zeros(prodcpt, DimPhy);
	for j = 1:1:prodcpt
		% projection;
		tmp = rpmat * kindex(:,j);
		uCplxPhy(j,:) = tmp';
	end

	%%% Sorting the Fourier coefficient through its absolute value;
	uCplxAbs = abs(real(uCplx(:)));
	%%%% Inverse sort;
	[val, ind] = sort(uCplxAbs, 'descend');
	%%%% Choose the size of the data as 'SortNum' to reduce the computational cost;
	ind = ind(1:1:SortNum);

	%%% Select the index and value;
	uCplxPhySort = uCplxPhy(ind(1:1:SortNum), :);
	uCplxPhySort = [ uCplxPhySort, uCplx(ind(1:1:SortNum)) ];

end

