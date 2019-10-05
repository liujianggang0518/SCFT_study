%%%% Set the initial positions of the specific pattern;
function IniCplx = IniConfig( PATTERN )

	global ncpt;

	if strcmp(PATTERN, 'LAM')
		IniKindex = [
			 1,		0			0.5;
			-1,		0			0.5;
			 ];
	elseif strcmp(PATTERN, 'HEX')
		IniKindex=[
			1     0     0		0.5; 
			0     1     0		0.5; 
			0     0     1		0.5; 
		   -1     0     0		0.5;
			0    -1     0		0.5;
			0     0    -1		0.5; 
			];
	elseif strcmp(PATTERN, 'DG')
		IniKindex = [
			1	-2	 1  	  7.433127e-02;
		   -2	 1	 1  	  7.433126e-02;
		   -1	-1	 2  	  7.433125e-02;
			1	 2	 1  	 -7.433124e-02;
			1	 1	 2  	 -7.433123e-02;
			2	 1	 1  	 -7.433122e-02;
		   -2	-1	 1  	 -7.433121e-02;
			1	-1	 2  	 -7.433120e-02;
		   -1	 1	 2  	  7.433120e-02;
		   -1	 2	 1  	 -7.433119e-02;
		   -1	-2	 1  	  7.433119e-02;
			2	-1	 1  	  7.433119e-02;
			];
	elseif strcmp(PATTERN, 'BCC')
		IniKindex = [
			1	 1	 0			0.3;
		   -1	 1	 0			0.3;
		   -1	-1	 0			0.3;
			1	-1	 0			0.3;
			0	 1	 1			0.3;
			0	-1	 1			0.3;
			0	-1	-1			0.3;
			0	 1	-1			0.3;
			1	 0	 1			0.3;
		   -1	 0	 1			0.3;
		   -1	 0	-1			0.3;
			1	 0	-1			0.3;
			];
	elseif strcmp(PATTERN, 'DDQC')
		IniKindex = [
			1     0     0    0			0.05;
			0     1     0    0			0.05;
			0     0     1    0			0.05;
			0     0     0    1			0.05;
		   -1     0     1    0			0.05;
			0    -1     0    1			0.05;
		   -1     0     0    0			0.05;
			0    -1     0    0			0.05;
			0     0    -1    0			0.05;
			0     0     0   -1			0.05;
			1     0    -1    0			0.05;
			0     1    	0   -1			0.05;

			1     1     0    0			0.05;
			0     1     1    0			0.05;
			0     0     1    1			0.05;
		   -1     0     1    1			0.05;
		   -1    -1     1    1			0.05;
		   -1    -1     0    1			0.05;
		   -1    -1     0    0			0.05;
			0    -1    -1    0			0.05;
			0     0    -1   -1			0.05;
			1     0    -1   -1			0.05;
			1     1    -1   -1			0.05;
			1     1    	0   -1			0.05;
			];
	elseif strcmp(PATTERN, 'DQC')
		IniKindex = [      
			1	  0     0    0			0.05;
			0	  1     0    0			0.05;
			0	  0     1    0			0.05;
			0	  0     0    1			0.05;
			-1	  1    -1    1			0.05;
			-1	  0     0    0			0.05;
			0	 -1     0    0			0.05;
			0	  0    -1    0			0.05;
			0	  0     0   -1			0.05;
			1	 -1     1   -1			0.05;

			1	  0     1   -1			0.05;
			1	  0     1    0			0.05;
			0	  1     0    1			0.05;
			-1	  1     0    1			0.05;
			-1	  0     0    1			0.05;
			-1	  0    -1    1			0.05;
			-1	  0    -1    0			0.05;
			0	 -1     0   -1			0.05;
			1	 -1     0   -1			0.05;
			1	  0     0   -1			0.05;
			];
	elseif strcmp(PATTERN, 'CAMDDQC')
		IniKindex = [
			30     0	0.05;
			26	   15	0.05;
			15	   26	0.05;
			0	   30	0.05;
			-15	   26	0.05;
			-26	   15	0.05;
			-30	   0	0.05;
			-26	  -15	0.05;
			-15	  -26	0.05;
			0	  -30	0.05;
			15	  -26	0.05;
			26	  -15	0.05;

			56	   15	0.05;
			41	   41	0.05;
			15	   56	0.05;
			-15	   56	0.05;
			-41	   41	0.05;
			-56	   15	0.05;
			-56	  -15	0.05;
			-41	  -41	0.05;
			-15	  -56	0.05;
			15	  -56	0.05;
			41	  -41	0.05;
			56	  -15	0.05;
			];
	else
		error('WARNING: The pattern is beyond our control!!\n\n');
	end

	%%% To the MATLAB language;
	Kindex = IniKindex(:, 1:1:end-1);
	if min(ncpt) == max(ncpt)
		Kindex(Kindex<0) = Kindex(Kindex<0) + ncpt(1);		Kindex = Kindex + 1;
	else
		fprintf('WARNING: Misusing function Ini_Config.m in the discretization!!\n\n');
		return;
	end

	%%% Set the initial value;
	IniCplx = zeros(ncpt);
	[nr, nc] = size(Kindex); % nc = DimCpt = length(ncpt);

	if ( nc == 2 )
		for k = 1:1:nr
			IniCplx(Kindex(k,1), Kindex(k,2)) = IniKindex(k,end);
		end
	elseif ( nc == 3 )
		for k = 1:1:nr
			IniCplx(Kindex(k,1), Kindex(k,2), Kindex(k,3)) = IniKindex(k,end);
		end
	elseif ( nc == 4 )
		for k = 1:1:nr
			IniCplx(Kindex(k,1), Kindex(k,2), Kindex(k,3), Kindex(k,4)) = IniKindex(k,end);
		end
	elseif ( nc == 5 )
		for k = 1:1:nr
			IniCplx(Kindex(k,1), Kindex(k,2), Kindex(k,3), Kindex(k,4), Kindex(k,5)) = IniKindex(k,end);
		end
	elseif ( nc == 6 )
		for k = 1:1:nr
			IniCplx(Kindex(k,1), Kindex(k,2), Kindex(k,3), Kindex(k,4), Kindex(k,5), Kindex(k,6)) = IniKindex(k,end);
		end
	else
		fprintf('WARNING: The computational dimension is beyond our control!!\n\n');
	end

end

