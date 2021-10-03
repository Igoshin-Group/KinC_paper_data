function [x,fval,exitflag,output]=fFit()
options = optimoptions('particleswarm','OutputFcn',@outfun,'Display','iter','SwarmSize',50);

problem.options = options;
problem.solver = 'particleswarm';
problem.objective = @(x)fError_pso(x);
problem.x0 = [1.12 1.09  2.5   718 2108   1.01  0.15    4  2.7];
problem.lb = [0.5,0.2,0.5,300,500,1.00,0.05,1,1];
problem.ub = [4,5,10,10000,20000,1.5,0.3,5,15];
problem.nvars=9;
function stop = outfun(values,state)
         values.bestx
         stop=0;
 end
[x,fval,exitflag,output]=particleswarm(problem);
end