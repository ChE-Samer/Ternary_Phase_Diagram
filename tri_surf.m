function Z = tri_surf(func, n)
    % square x-y mesh
    [x, y] = meshgrid(linspace(0,1,n));
    x_a = x;
    x_b = y;
    dx = 1/(n-1);

    % transform to x-y triangle
    for i = 1:n    
        for j = 1:n
            x_a(i,j) = (j-1)*dx*(1-y(i,j));
            x(i,j) = y(i,j)*cos(pi/3) + x(i,j)*(1-y(i,j)); 
        end    
        y(i,:) = y(i,:) * sin(pi/3);
    end
    
    % composition indices
    x_a;
    x_b;
    x_c = 1 - x_b - x_a;
    
    % define z = f(x_a, x_b, x_c)
    z = zeros(n);
    options = optimset('Display','off');    
    for i = 1:n    
        for j = 1:n
            z(i,j) = fsolve(@(T)func(x_a(i,j),x_b(i,j),x_c(i,j),T),80,options); 
        end    
    end
    
    % create a triangular figure if dones't already exist
    if isempty(get(groot,'CurrentFigure'))
        tri_base(n, 1.1*max(max(z)), true);
    end
    
    % plot surface
    Z = surf(x, y, z);
    Z.EdgeAlpha = 0;
    cb = colorbar;
    set(cb,'Ylim', [floor(min(min(z))/10)*10 ceil(max(max(z))/10)*10])
    view([0 30])
end