function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    % Se citesc datele si se formeaza matricea.

    [N M val1 val2] = citire_date(nume);

    nume_afisare = strcat(nume, ".out");
    fout = fopen(nume_afisare, "w");

    fprintf(fout, "%d\n", N);               % Se scrie N.

    R1 = Iterative(nume, d, eps);

    for i = 1 : N
        fprintf(fout, "%f\n", R1(i));       % Se scrie vectorul obtinut la cerinta 1.
    end

    fprintf(fout, "\n");

    R2 = Algebraic(nume, d);

    for i = 1 : N
        fprintf(fout, "%f\n", R2(i));       % Se scrie vectorul obtinut la cerinta 2.
    end

    fprintf(fout, "\n");

    PR1 = R2;
    indici = 1 : N;

    ok = 1;
    while(ok == 1)                          % Se sorteaza descrescator vectorul.
    ok = 0;

        for i = 2 : N
            if(PR1(i) > PR1(i - 1))
                aux = PR1(i);
                PR1(i) = PR1(i - 1);
                PR1(i - 1) = aux;

                aux = indici(i);
                indici(i) = indici(i-1);
                indici(i-1) = aux;

                ok = 1;
            end
        end
    end

    % Se scrie valoarea functiei in punctele cerute
    for i = 1 : N
        fprintf(fout, "%d %d %f\n", i, indici(i), Apartenenta(PR1(i), val1, val2));
    end

    fclose(fout);
end