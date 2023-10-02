function c = c_cu_long(T)
    % A function which calculates the longitudinal speed of sound in copper
    % at temperature T (celcius) from data taken on 02/11/22. Calculated
    % based on quadratic fit of data.
    p1 = 0.0009662;
    p2 = -0.6786;
    p3 = 4652;
    c = p1*T.^2 + p2*T + p3;
end
