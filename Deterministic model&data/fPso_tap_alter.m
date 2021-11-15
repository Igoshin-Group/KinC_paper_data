function [x,fval,exitflag,output]=fFit()
options = optimoptions('particleswarm','OutputFcn',@outfun,'Display','iter','SwarmSize',50);

problem.options = options;
problem.solver = 'particleswarm';
problem.objective = @(x)fError_pso_tap_alter(x);
problem.x0 = [2,2,2,2,200];
problem.lb = [0.5,0.5,0.2,0.2,10];
problem.ub = [8,8,1.5,5,1500];
problem.nvars=5;
function stop = outfun(values,state)
         values.bestx
         stop=0;
 end
[x,fval,exitflag,output]=particleswarm(problem);
end
