%%%% Set the initial parameters including the dimension of computational and physical space, the projection matrix;
%%%% The LP model is utilized as an example to show the function using;

clear; clc; close all;
set(0, 'DefaultFigureVisible', 'on');

PATTERN = 'DDQC';

global MPARA ncpt pmat rcpBox;
global KSquare KSingle Format;
Format = 'png';

%%% Model parameters and projection matrix;
if strcmp( PATTERN, 'DDQC' )
	%%% Model parameters;
	MPARA = [150, 0.015, 1, 1, 2*cos(pi/12)];	% c, varepsilon, kappa, gamma, q;
	% Space paramters;
	DimPhy = 2;		DimCpt = 4;		N = 24;		L = 1;
	% Time parameters;
	TPARA = [0.2, 1e-6, 5e3];	% tstep, TOL, Maximal Iteration;
	%%% The computational region;
	rcpBox = eye(DimCpt);
	%%% The projection matrix;
	theta = 2*pi/12 * [0:1:DimCpt-1];
	pmat = [ cos(theta); sin(theta) ]; % size(pmat) = [DimPhy, DimCpt];
else
	fprintf('WARNING: The pattern " %s " is not considered!!\n\n', PATTERN);
	return;
end

%%% The space discretization;
ncpt = ones(1, DimCpt);
ncpt(:) = N;

%%% Initial values in the Fourier space;
IniCplx = Ini_Config( PATTERN );

%%%% Set K^2 and K in the Fourier space;
Set_KOptor1( );

%%%% Plotting the Fourier distribution and the morphology of the real space about the initial value;
Plot_Phase( IniCplx, PATTERN, '', 'Ini' );

%%%% Update the order parameter by the semi-implicit scheme about the convergent value;
[ uCplx, Hamilton ] = Semi_Implicit( IniCplx, MPARA, TPARA );

%%%% Plot the Fourier distribution and the morphology of the real space;
Plot_Phase( uCplx, PATTERN, Hamilton, 'Fnl' );

