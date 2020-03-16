function Z = tri_isotherm(z, n, grid, a)
    % create a triangular figure if dones't already exist
    if isempty(get(groot,'CurrentFigure'))
        tri_base(n, 1.1*max(max(z)), true);
    end

    % plot the base triangle with white background
    Z = surf([0 1; 0.5 0.5],[0 0; sin(pi/3) sin(pi/3)],[z z; z z]);
    Z.FaceColor = [1 1 1];
    Z.FaceAlpha = a;
    hold on
    
    % plot triangular grids IF (grid = true)
    if grid
        x_a = linspace(0,1,n);
        x_b = linspace(0,0.5,n);
        x_c = linspace(0.5,1,n);
        y = linspace(0, sin(pi/3),n);
        for i = 2:n-1
            plot3([x_a(i) x_c(i)],[0 y(n+1-i)], [z z], 'b:')
            plot3([x_b(i) x_a(i)],[y(i) 0], [z z], 'b:')
            plot3([x_b(i) x_c(n+1-i)],[y(i) y(i)], [z z], 'b:')
        end
    end
end