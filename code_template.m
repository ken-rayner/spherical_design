function %ENTER FUNCTION NAME
%d = dimension of vector space
%m = order of the design
%n = number of vectors in design

%define manifold for optimisation problem
manifold = %SELECT RELEVANT MANIFOLD

%set up optimisation problem
design.M = manifold;
design.cost = @(X) %DEFINE RELEVANT FRAME POTENTIAL
design = manoptAD(design);

%sense check gradient
checkgradient(design);

%run optimisation
[x,xcost] = trustregions(design)

%verify that this is a real design
A = normc(x)