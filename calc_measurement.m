function perf_measure = calc_measurement(wrapped_coordinates, num_areas)
    % Description
    %   Calculate the difference between the areas of the radar chart in order
    %   to use it as a performance measurement
    [num_dimensions, null, num_measurements]= size(wrapped_coordinates);
    
    for i = 1:num_measurements
        coordinates = wrapped_coordinates(:,:,i);
    %     for row = 1:num_dimensions would be more generic
        x = coordinates(1, :);
        y = coordinates(2, :);
        if not(exist('pgon','var'))
            pgon = polyshape(x, y);
        else
            pgon = [pgon, polyshape(x, y)];
        end
    end
    
    intersec = repmat(polyshape(),num_areas,num_areas); % zeros(length(pgon), length(pgon));
    uni = repmat(polyshape(),num_areas,num_areas);
    
    for j=1:num_areas-1
        for k=j+1:num_areas
            intersec(j,k) = intersect(pgon(j),pgon(k));
        end
    end
    intersec_areas = area(intersec);
    
    for j=1:num_areas-1
        for k=j+1:num_areas
            uni(j,k) = union(pgon(j),pgon(k));
        end
    end
    union_areas = area(uni);
    
    perf_measure = intersec_areas ./ union_areas;
end
