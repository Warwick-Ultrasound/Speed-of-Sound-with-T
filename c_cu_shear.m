function c = c_cu_shear(T)
    % A function which takes the temperature in degrees celcius and returns
    % the speed of a bulk shear wave in copper at that temperature. Data
    % was taken on 02/11/22 and the c value is calculated in one of two
    % ways: If it is inside the bounds of the existing data, a spline
    % interpolation between the two closest points is used. Otherwise, a
    % quadratic fit of the entire dataset is used to extrapolate.

    data = readmatrix('c_cu_shear_data.csv');
    Tdata = data(:,1);
    minT = min(Tdata);
    maxT = max(Tdata);
    cdata = data(:,2);
    fit1 = fit(Tdata, cdata, 'poly2');
    clear data;

    for ii = 1:length(T)
        if T(ii) < minT || T(ii) > maxT
            c(ii) = fit1(T(ii));
        else
            c(ii) = spline(Tdata, cdata, T(ii));
        end
    end

end