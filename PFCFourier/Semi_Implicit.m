%%%% The semi-implicit scheme to computational the dynamic equation;
%%%% Using the Chan-Hilliard dynamic equation as an example;
function [ uCplx, Hamilton ] = Semi_Implicit( uCplx, MPARA, TPARA )

	global KSquare;

	%%% Model parameters;
	Sys.c = MPARA(1);	Sys.epsilon = MPARA(2);		Sys.kappa = MPARA(3);		Sys.gamma = MPARA(4);
	Sys.q = MPARA(5);
	%%% Iterative parameters;
	Tstep = TPARA(1);	TOL = TPARA(2);		IterMax = TPARA(3);

	%%% Poten Operator term;
	PotenOptor = ( -KSquare + 1 ) .* ( -KSquare + Sys.q^2 );
	IterOptor = Sys.c * (-KSquare) .* PotenOptor.^2;

	%%% Initializing;
	Err = 1.0;
	Iter = 0;
	tic;

	while ( Err > TOL && Iter < IterMax )

		Iter = Iter + 1;

		%%% Preparing;
		uReal = real(fftn(uCplx));
		u2Real = uReal .* uReal;	u3Real = u2Real .* uReal;	u4Real = u3Real .* uReal;

		%%% Computing the potential energy;
		PotenHam = real(fftn( PotenOptor .* uCplx )).^2;
		PotenHam = myifftn( PotenHam );
		PotenHam = 0.5*Sys.c * PotenHam(1);

		%%% Computing the entropy energy;
		Entropy = -0.5*Sys.epsilon * u2Real - Sys.kappa/3 * u3Real + 0.25*Sys.gamma * u4Real;
		Entropy = myifftn( Entropy );
		Entropy = Entropy(1);

		%%% Free energy;
		Hamilton = PotenHam + Entropy;

		%%% Gradient error;
		% Potential part;
		GradErrPoten = IterOptor .* uCplx;
		% Entropy part;
		GradErrEntropy = -Sys.epsilon * uReal - Sys.kappa * u2Real + Sys.gamma * u3Real;
		GradErrEntropy = -KSquare .* myifftn(GradErrEntropy);
		% Total;
		GradErr = GradErrPoten + GradErrEntropy;
		GradErr(1) = 0;
		GradErr = real(fftn( GradErr ));
		Err = max(abs( GradErr(:) ));

		%%% Update the order parameter;
		uCplx = ( uCplx + Tstep*GradErrEntropy ) ./ ( 1 - Tstep*IterOptor );
		uCplx(1) = 0;

		%%% Displaying;
		fprintf('--> Iter: %d \t Err: %.4e \t PotenHam: %.12e \t Entropy: %.12e \t Hamilton: %.12e\n', Iter, Err, PotenHam, Entropy, Hamilton);
end

fprintf('Time cost of while-loop is " %.4f " seconds\n\n', toc);


