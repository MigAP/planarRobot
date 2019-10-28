%x0 = [-1.8; 1.7; 1.9; -0.8; -0.8];
%[x, obj, info, iter, nf, lambda] = sqp (x0, @phi, @g, [])

## Example for default optimization (Levenberg/Marquardt with
 ## BFGS), one non-linear equality constraint. Constrained optimum is
 ## at p = [0; 1].
 objective_function = @ (p) p(1)^2 + p(2)^2;
 pin = [-2; 5];
 constraint_function = @ (p) p(1)^2 + 1 - p(2);
 [p, objf, cvg, outp] = nonlin_min (objective_function, pin, optimset ("equc", {constraint_function}))
