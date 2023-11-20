%Shifted Rotated High Conditioned Elliptic Function 

function f=elliptic(x, o, bias)
    [ps,D]=size(x);
    a=1e+6;
    f=bias;
    z=x-o;
    for i=1:D
        f=f+a.^((i-1)/(D-1)).*z(:,i).^2;
    end
end