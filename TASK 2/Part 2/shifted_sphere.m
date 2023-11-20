function f = shifted_sphere(x,o, bias)
    z = x-o;
    s = sum(z.^2, "all");
    f = s + bias;
end
