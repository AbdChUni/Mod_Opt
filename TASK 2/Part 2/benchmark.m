%target = takes out functions
%optimizer = takes a configured optimizer; a function that takes in the
%target


function [xs,fvals, fval_stddev, best_idx, worst_idx] = benchmark(optimizer, target, lb, ub, go)
    D = size(lb, 2);
    xs = zeros(15, D); 
    fvals = zeros(15, 1);

    for i=1:15
        [x, fval, ~] = optimizer(@(x) target(x, go), lb, ub);
        xs(i, :) = x;
        fvals(i) = fval;
    end  

    fval_stddev = std(fvals);
    diffs = fvals - target(go, go);
    [~, best_idx] = min(diffs);
    [~, worst_idx] = max(diffs);

end