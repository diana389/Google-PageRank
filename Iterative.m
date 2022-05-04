function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    % Se citesc datele si se formeaza matricea.

    [N M val1 val2] = citire_date(nume);

    % algoritmul Iterative

    Rt1 = 1 / N * ones(N, 1);

    Rt2 = d*(M*Rt1) + ((1-d) / N);

    while(norm(Rt2 - Rt1, 2) >= eps)
        Rt1 = Rt2;
        Rt2 = d*(M*Rt1) + ((1-d) / N);
    end

    R = Rt2;
end