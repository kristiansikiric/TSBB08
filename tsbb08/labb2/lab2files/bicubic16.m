function value=bicubic16(d)
    % spline function which 2D variant gives bicubic16 interpolation
    A=-0.5;
    if abs(d)<=1
        value=(A+2)*abs(d)^3-(A+3)*d^2+1;
    elseif abs(d)<=2
        value=A*abs(d)^3-5*A*d^2+8*A*d-4*A;
    else
        value=0;
    end