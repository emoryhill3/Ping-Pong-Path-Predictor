function [dqdt] = SphereMotion1(t,q)

%initial conditions and values
g = [0,0,-9.81];
w = [0, -150, 900];
m = 0.027;
rho = 1.293;
dia = 0.04;
r = dia/2;
DragC = 0.5;
LiftC = 0.5;
CSA = pi*r^2;

xpos = q(1);
ypos = q(2);
zpos = q(3);
Vx = q(4);
Vy = q(5);
Vz = q(6);

%calculations
V = [Vx, Vy, Vz];
a = g - 0.5*(rho/m)*norm(V)*CSA*DragC.*V - pi^2*(rho/m)*r^3*LiftC.*(cross(V,w));

xprime = V(1);
yprime = V(2);
zprime = V(3);
Vxprime = a(1);
Vyprime = a(2);
Vzprime = a(3);

dqdt = [xprime; yprime; zprime; Vxprime; Vyprime; Vzprime];

end