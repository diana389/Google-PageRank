function [N M val1 val2] = citire_date(nume)
    % Functia citeste datele din fisier.

    fin = fopen(nume, "r");
    N = fscanf (fin, "%d", 1);

    for i = 1:N
        indice = fscanf (fin, "%d", 1);       % Se citeste numarul nodului.
        nr_vec = fscanf (fin, "%d", 1);       % Se citeste numarul de vecini ai nodului.
  
        new_nr_vec = nr_vec;

        for j = 1 : nr_vec
            vec(j) = fscanf (fin, "%d", 1);
            if(i == vec(j))
                new_nr_vec = new_nr_vec - 1;    % Daca unul din elemente este pe diagonala principala, numarul de vecini scade. 
            end
        end

        for j = 1 : nr_vec
            if(i ~= vec(j))                     % Pe diagonala principala exista doar zerouri.
                M(vec(j), i) = 1 / new_nr_vec;  % Se completeaza matricea.
            end
        end
    end

    val1 = fscanf (fin, "%f", 1);           % Se citeste prima valoare.
    val2 = fscanf (fin, "%f", 1);           % Se citeste a doua valoare.

    fclose(fin);
end