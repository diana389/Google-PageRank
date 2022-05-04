function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare

    % algoritmul Gram-Schmidt

    [m n] = size(A);
    Q = zeros(m,n);
    R = zeros(n);

    for i = 1 : n
        R(i,i) = norm(A(:,i), 2);
        Q(:,i) = A(:,i) / R(i,i);

        for j = i + 1 : n
            R(i,j) = Q(:,i).' * A(:,j);
            A(:,j) = A(:,j) - Q(:,i) * R(i,j);
        end
    end

    % T · xi = ei => Q * R * xi = ei => R * xi = QT * ei

    QT = Q.';
    In = eye(n);
    B = zeros(n,n);

    for j = 1 : n                            % cate un sistem pentru fiecare coloana
        b = QT * In(:,j);                    % coloana termenilor liberi
        B(n,j) = b(n) / R(n,n);              % se afla ultima necunoscuta
        
        for i = (n - 1) : -1 : 1
            sum = R(i,:) * B(:,j);           % suma celorlalti termeni din ecuatie
            B(i,j) = (b(i) - sum) / R(i,i);  
        end
    end
end
