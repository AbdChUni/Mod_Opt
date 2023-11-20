function [x, fval, exitflag] = simulated_annealing(fun, lb, ub)
    x0 = (lb+ub)/2;
    [x, fval, exitflag] = simulannealbnd(fun,x0,lb,ub);
end
