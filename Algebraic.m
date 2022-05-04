function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    % Se citesc datele si se formeaza matricea.

    [N M val1 val2] = citire_date(nume);

    % algoritmul Algebraic

    P = 1 / N * ones(N, 1);

    % R = (1 - d) * P + d * M * R => R - d * M * R = (1 - d) * P 
    % (eye(N) - d * M) * R = (1 - d) * P => R = inv(eye(N) - d * M) * ((1 - d) * P)

    inversa = PR_Inv(eye(N) - d * M);
    R = inversa * ((1 - d) * P);
end