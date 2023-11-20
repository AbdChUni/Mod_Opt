function [x, fval, exitflag] = global_search(fun, lb, ub)
    x0 = (lb+ub)/2;
    gs = GlobalSearch;
    problem = createOptimProblem('fmincon','x0',x0,'objective',fun,'lb',lb,'ub',ub);
    [x, fval, exitflag] = run(gs,problem);
end

