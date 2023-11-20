function [x, fval, exitflag] = particle_swarm(fun, lb, ub)
    D = size(lb, 2);
    [x, fval, exitflag] = particleswarm(fun,D,lb,ub);
end
