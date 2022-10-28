function [Ex,Ey] = CE(X,Y,q,p1,p2)
%CE (Campo eléctrico) Se calcula el campo electrico creado por una carga en
%varios puntos de un espacio
%   X: una matriz de los puntos en x creada con la función meshgrid()
%   Y: una matriz de los puntos en y creada con la función meshgrid()
%   q: el valor de la carga
%   p1: el indice para la posición en y de la carga
%   p2: el indice para la posición en x de la carga
    k = 9*1e+9;
    Ex = zeros(length(X));
    Ey = zeros(length(X));
    Em = zeros(length(X));
    for i= 1:length(X)
        for j = 1:length(X)

            if j==p1 && i==p2
                continue
            end

            % Vector que va de la carga al punto de observación
            r = [X(j,i),Y(j,i)]-[X(p1,p2),Y(p1,p2)];

            % Magnitud
            rm = sqrt(r(1).^2 + r(2).^2);

            % Campo
            Ex(j,i) = k*q*r(1)./(rm.^3);
            Ey(j,i) = k*q*r(2)./(rm.^3);

            % Magnitud campo electrico
            Em(i,j) = sqrt(Ex(j,i).^2+Ey(j,i).^2);

        end
    end
end

