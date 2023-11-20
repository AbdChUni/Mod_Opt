bias = -450;
default_go2 = zeros(1, 2);
default_go10 = zeros(1, 10);


all_params = {

    % NOTE: uncomment any of the below and run file to see output

    % SHIFTED SPHERE:
    % D=2
    @(x, go) shifted_sphere(x, go, bias), @simulated_annealing, default_go2, 'Shifted Sphere D=2 Simulated Annealing';
    %@(x, go) shifted_sphere(x, go, bias), @particle_swarm, default_go2, 'Shifted Sphere D=2 Particle Swarm';
    %@(x, go) shifted_sphere(x, go, bias), @global_search, default_go2, 'Shifted Sphere D=2 Global Search';

    % D=10
    %@(x, go) shifted_sphere(x, go, bias), @simulated_annealing, default_go10, 'Shifted Sphere D=10 Simulated Annealing';
    %@(x, go) shifted_sphere(x, go, bias), @particle_swarm, default_go10, 'Shifted Sphere D=10 Particle Swarm';
    %@(x, go) shifted_sphere(x, go, bias), @global_search, default_go10, 'Shifted Sphere D=10 Global Search';

    % SCHWEFEL:
    % D=2
    %@(x, go) schwefel(x, go, bias), @simulated_annealing, default_go2, 'Schwefel D=2 Simulated Annealing';
    %@(x, go) schwefel(x, go, bias), @particle_swarm, default_go2, 'Schwefel D=2 Particle Swarm';
    %@(x, go) schwefel(x, go, bias), @global_search, default_go2, 'Schwefel D=2 Global Search';
    
    % D=10
    %@(x, go) schwefel(x, go, bias), @simulated_annealing, default_go10, 'Schwefel D=10 Simulated Annealing';
    %@(x, go) schwefel(x, go, bias), @particle_swarm, default_go10, 'Schwefel D=10 Particle Swarm';
    %@(x, go) schwefel(x, go, bias), @global_search, default_go10, 'Schwefel D=10 Global Search';

    % Elliptic:
    % D=2
    %@(x, go) elliptic(x, go, bias), @simulated_annealing, default_go2, 'Elliptic D=2 Simulated Annealing';
    %@(x, go) elliptic(x, go, bias), @particle_swarm, default_go2, 'Elliptic  D=2 Particle Swarm';
    %@(x, go) elliptic(x, go, bias), @global_search, default_go2, 'Elliptic D=2 Global Search';

    % D=10
    %@(x, go) elliptic(x, go, bias), @simulated_annealing, default_go10, 'Elliptic D=10 Simulated Annealing';
    %@(x, go) elliptic(x, go, bias), @particle_swarm, default_go10, 'Elliptic  D=10 Particle Swarm';
    %@(x, go) elliptic(x, go, bias), @global_search, default_go10, 'Elliptic  D=10 Global Search';

};

%NOTE: uncomment any of the below and run file to visualise plot

% PLOTS:
% D=2
%plotf(@(x) shifted_sphere(x, default_go2, bias));
%plotf(@(x) schwefel(x, default_go2, bias));
%plotf(@(x) elliptic(x, default_go2, bias));

for i = 1:size(all_params)
    params = all_params(i,:);
    target = cell2mat(params(1));
    optimizer = cell2mat(params(2));
    go = cell2mat(params(3));
    description = cell2mat(params(4));
    
    fprintf('-----RUNNING BENCHMARK "%s"-----\n\n\n\n', description );
    D = size(go, 2);
    lb = -ones(1, D)*100;
    ub = ones(1, D)*100;
    [xs, fvals, fval_stddev, best_idx, worst_idx] = benchmark(optimizer, target, lb, ub, go);
    
    xs
    fvals
    fval_stddev
    fval_best = fvals(best_idx);
    fval_worst = fvals(worst_idx);
    fval_best
    fval_worst
    fval_opt = target(go,go);
    fval_opt
    
end
