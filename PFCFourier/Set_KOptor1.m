%%%% Set K^2 and K in the Fourier space;
function SetKOptor1( )
	
	global ncpt pmat rcpBox; % length(ncpt) = DimCpt;
	global KSquare KSingle;

	%% Initializing;
	[DimPhy, DimCpt] = size(pmat);
	KSquare = zeros(ncpt);
	KSingle = cell(1, DimPhy);
	for ii = 1:1:DimPhy
		KSingle{ii} = zeros(ncpt);
	end

	%% Setting;
	if ( DimCpt == 1 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			kk = k1 - 1;
			pk = pmat * rcpBox * kk;
			KSquare(j1) = sum(pk.^2);
			for ii = 1:1:DimPhy
				kSinle{ii}(j1) = pk(ii);
			end
		end

	elseif ( DimCpt == 2 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			for j2 = 1:1:ncpt(2)
				if ( j2 > ncpt(2)/2 + 1 )	k2 = j2 - ncpt(2);
				else	k2 = j2;
				end
				kk = [ k1; k2 ] - 1;
				pk = pmat * rcpBox * kk;
				KSquare(j1, j2) = sum(pk.^2);
				for ii = 1:1:DimPhy
					kSinle{ii}(j1, j2) = pk(ii);
				end
			end
		end

	elseif ( DimCpt == 3 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			for j2 = 1:1:ncpt(2)
				if ( j2 > ncpt(2)/2 + 1 )	k2 = j2 - ncpt(2);
				else	k2 = j2;
				end
				for j3 = 1:1:ncpt(3)
					if ( j3 > ncpt(3)/2 + 1 )	k3 = j3 - ncpt(3);
					else	k3 = j3;
					end
					kk = [ k1; k2; k3 ] - 1;
					pk = pmat * rcpBox * kk;
					KSquare(j1, j2, j3) = sum(pk.^2);
					for ii = 1:1:DimPhy
						kSinle{ii}(j1, j2, j3) = pk(ii);
					end
				end
			end
		end

	elseif ( DimCpt == 4 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			for j2 = 1:1:ncpt(2)
				if ( j2 > ncpt(2)/2 + 1 )	k2 = j2 - ncpt(2);
				else	k2 = j2;
				end
				for j3 = 1:1:ncpt(3)
					if ( j3 > ncpt(3)/2 + 1 )	k3 = j3 - ncpt(3);
					else	k3 = j3;
					end
					for j4 = 1:1:ncpt(4)
						if ( j4 > ncpt(4)/2 + 1 )	k4 = j4 - ncpt(4);
						else	k4 = j4;
						end
						kk = [ k1; k2; k3; k4 ] - 1;
						pk = pmat * rcpBox * kk;
						KSquare(j1, j2, j3, j4) = sum(pk.^2);
						for ii = 1:1:DimPhy
							kSinle{ii}(j1, j2, j3, j4) = pk(ii);
						end
					end
				end
			end
		end
	
	elseif ( DimCpt == 5 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			for j2 = 1:1:ncpt(2)
				if ( j2 > ncpt(2)/2 + 1 )	k2 = j2 - ncpt(2);
				else	k2 = j2;
				end
				for j3 = 1:1:ncpt(3)
					if ( j3 > ncpt(3)/2 + 1 )	k3 = j3 - ncpt(3);
					else	k3 = j3;
					end
					for j4 = 1:1:ncpt(4)
						if ( j4 > ncpt(4)/2 + 1 )	k4 = j4 - ncpt(4);
						else	k4 = j4;
						end
						for j5 = 1:1:ncpt(5)
							if ( j5 > ncpt(5)/2 + 1 )	k5 = j5 - ncpt(5);
							else	k5 = j5;
							end
							kk = [ k1; k2; k3; k4; k5 ] - 1;
							pk = pmat * rcpBox * kk;
							KSquare(j1, j2, j3, j4, j5) = sum(pk.^2);
							for ii = 1:1:DimPhy
								kSinle{ii}(j1, j2, j3, j4, j5) = pk(ii);
							end
						end
					end
				end
			end
		end
		
	elseif ( DimCpt == 6 )
		for j1 = 1:1:ncpt(1)
			if ( j1 > ncpt(1)/2 + 1 )	k1 = j1 - ncpt(1);
			else	k1 = j1;
			end
			for j2 = 1:1:ncpt(2)
				if ( j2 > ncpt(2)/2 + 1 )	k2 = j2 - ncpt(2);
				else	k2 = j2;
				end
				for j3 = 1:1:ncpt(3)
					if ( j3 > ncpt(3)/2 + 1 )	k3 = j3 - ncpt(3);
					else	k3 = j3;
					end
					for j4 = 1:1:ncpt(4)
						if ( j4 > ncpt(4)/2 + 1 )	k4 = j4 - ncpt(4);
						else	k4 = j4;
						end
						for j5 = 1:1:ncpt(5)
							if ( j5 > ncpt(5)/2 + 1 )	k5 = j5 - ncpt(5);
							else	k5 = j5;
							end
							for j6 = 1:1:ncpt(6)
								if ( j6 > ncpt(6)/2 + 1 )	k6 = j6 - ncpt(6);
								else	k6 = j6;
								end
								kk = [ k1; k2; k3; k4; k5; k6 ] - 1;
								pk = pmat * rcpBox * kk;
								KSquare(j1, j2, j3, j4, j5, k6) = sum(pk.^2);
								for ii = 1:1:DimPhy
									kSinle{ii}(j1, j2, j3, j4, j5, k6) = pk(ii);
								end
							end
						end
					end
				end
			end
		end
	
	else
		fprintf('WARNING: The dimension is beyond our control!!\n\n');
		return;

	end

end

