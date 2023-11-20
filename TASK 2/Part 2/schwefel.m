function f=schwefel(x, o, bias)
    [~,D]=size(x);
    f=bias;
    z = x-o;
    for i=1:D
        f=f+sum(z(:,1:i),2).^2;
    end
end