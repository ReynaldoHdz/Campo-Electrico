clear
clc

sup = 10; inf = -10; intervalo = 0.1;

% Estableciendo variables para la función
qp = 1e-9;
qn = -1e-9;
[X,Y] = meshgrid(inf:intervalo:sup,inf:intervalo:sup);


% Cargas positivas
j = 1;
for i = 1:2:201
    [Epx(:,:,j),Epy(:,:,j)] = CE(X,Y,qp,i,71);
    j = j + 1;
end


% Cargas negativas
j = 1;
for i = 51:151
    [Enx(:,:,j),Eny(:,:,j)] = CE(X,Y,qn,i,131);
    j = j + 1;
end


% Campo eléctrico total con 100 cargas positivas y 100 cargas negativas
Ex = 0;
Ey = 0;
for i = 1:101
    Ex = Epx(:,:,i) + Enx(:,:,i) + Ex;
    Ey = Epy(:,:,i) + Eny(:,:,i) + Ey;
end


% Creando gráfica de campo eléctrico con ambas cargas
quiver(X, Y, Ex, Ey)

% Dibujando cargas positivas
for i = 1:2:201
    cargap = [X(i,71)-0.05 Y(i,71)-0.05 0.1 0.1];
    rectangle('Position',cargap,'Curvature',[1,1],'FaceColor','r','EdgeColor','r')
end

% Dibujando cargas negativas
for i = 51:151
    cargan = [X(i,131)-0.05 Y(i,131)-0.05 0.1 0.1];
    rectangle('Position',cargan,'Curvature',[1,1],'FaceColor','b','EdgeColor','b')
end

xlim([inf,sup])
ylim([inf,sup])
xline(0)
yline(0)
xlabel('x')
ylabel('y')
pbaspect([1 1 1])