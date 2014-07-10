% Main function
clear all;
% Dimensions of Grid
digits(25);

I = 25;
J = 25;

% Step sizes

delx = 0.5;
delt = 0.01;

% constants

rho = 1;
tuning_constant = 0.97;
safety_constant = 0.15;
precon = zeros(I,J);
tol = .0001;

% INITIAL DATA

% Define what each cell is initially filled with.  0 air, 1 water, 2 solid.
Medium(10:I-10, 2:7) = 1;
Medium(1:I, 15) = 2;
Medium(9, 12:15) = 2;
Medium(I-9, 12:15) = 2;
Medium(1,1:J) = 2;
Medium(I,1:J) = 2;



[Xpos, Ypos] = create_particles(I,J,Medium);  %Creates 4 equally space particles in each fluid cell

figure(1);
imagesc(Medium);

% Set initial velocity field.  Using staggered grid.
[u, v] = initial_data(I, J, delx);



% Set solid velocity field

us = zeros(I+1,J);
vs = zeros(I,J+1);
[u, v] = Apply_Boundary(I, J, Medium, u, v ,us, vs);
[u,v] = clean_velocities(I,J, Medium, u, v);
[UC, VC] = Grid_Cell_Velocities(I, J, u, v);

i = 1;


for k = 1:10000
    
    [u,v] = clean_velocities(I,J, Medium, u, v);
    [u, v] = Advection2D(delx, delt, I, J, u, v ); %currently assumes outside field is zero
    
    %calculate grid velocities
    [UC, VC] = Grid_Cell_Velocities(I, J, u, v);
    %Move particles to new grid cells
    [Xpos, Ypos] = update_positions(delx, delt, I, J, Xpos, Ypos, UC, VC);
    
    % other forces
    [u,v] = gravity_update(I,J,delx,delt,u,v);
    %update grid cells
    Medium = update_grid(Xpos, Ypos, I, J, Medium);

    % PROJECTION METHOD FOR PRESSURE UPDATE

    % Calculate negative divergence of RHS
    rhs = RHS( I, J, delx, u, v, Medium);

    % Update negative divergence with solid boundary data
    rhs = RHS_solid(delx,I,J,u,v,us,vs,rhs,Medium); % Assumes surrounded by solid

    % Set entries of Matrix A
    [Adiag, Aplusi, Aplusj] = Matrix_Form(delt, delx, rho, I, J, Medium);
    
    % Construct MIC(0) preconditioner  broken?
    preconditioner = precond(I,J, tuning_constant, safety_constant, Adiag, Aplusi, Aplusj, Medium, precon);

    % Solve Ap = rhs with PCG  broken?
    pressure = PCG(I, J, rhs, tol, Medium, Aplusi, Aplusj, Adiag, preconditioner);

    % Compute new velocities with pressure gradient update
    [u,v] = pressure_update(delx, delt, rho, I, J, u, v, us, vs, Medium, pressure);
    
    % CALCULATE GRID CELL VELOCITIES FOR PLOT UPDATE

    %if mod(k,10)==0
     %   figure(1);
      %  imagesc(Medium);
       % M(i) = getframe;
        %i = i +1;
    %end
    
    quiver(I, J, u,v);
    
    %figure(3)
    %pcolor(pressure);
    %display(u);
    %display(v);
    
end
