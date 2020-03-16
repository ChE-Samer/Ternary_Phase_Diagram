function Z = tri_base(n, z_max, grid)    
    % start new 3D figure
    figure

    % plot the prism top triangle and edges
    z_max = ceil(z_max/10)*10;
    plot3([0 1 0.5 0], [0 0 sin(pi/3) 0], [z_max z_max z_max z_max],'k');
    set(gca, 'visible', 'off')
    hold on
    plot3([0 0], [0 0], [0 z_max], 'k');
    plot3([1 1], [0 0], [0 z_max], 'k');
    plot3([0.5 0.5], [sin(pi/3), sin(pi/3)], [0 z_max], 'k');
    tri_isotherm(0, n, grid, 1);
    tri_isotherm(z_max, n, grid, 0);
    
    % labels
    labels = linspace(0,1,n);
    x_a_ticks = linspace(0,1,n);
    y_a_ticks = linspace(0,0,n);
    x_b_ticks = linspace(1,0.5,n);
    y_b_ticks = linspace(0,sin(pi/3),n);
    x_c_ticks = linspace(0.5,0,n);
    y_c_ticks = linspace(sin(pi/3),0,n);
    z_ticks = [0:10:z_max];
    
    delta = 0.05;
    text(1.1, -0.05, 'A');
    text(0.5, sin(pi/3)+2*delta, 'B');
    text(-0.1, -0.05, 'C');
    for i = 1:n
        text(x_a_ticks(i),y_a_ticks(i)-delta,num2str(labels(i)));
        text(x_b_ticks(i)+delta/2,y_b_ticks(i)+delta,num2str(labels(i)));
        text(x_c_ticks(i)-delta,y_c_ticks(i)+delta,num2str(labels(i)));
    end
    for i = 1:length(z_ticks)
        text(-0.05,-0.05,z_ticks(i),num2str(z_ticks(i)));
    end
end