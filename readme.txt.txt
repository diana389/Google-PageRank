Tema 1 MN - PageRank (Mathlab)
Nume: Stefan Diana Maria
Grupa: 312CC

CERINTA 1:
-->functia Iterative
Dupa completarea matricei (functia citire_date), se aplica algoritmul descris in cerinta. Rt1 
reprezinta vectorul la un moment de timp anterior, fiind initial egal cu un vector coloana,
avand ca valori 1/N. Pe baza acestuia se formeaza Rt2 (vectorul la momentul de timp t+1), 
conform formulei, pana cand conditia de oprire este indeplinita (norm(Rt2 - Rt1, 2) < eps).
-->functia citire_date
Se citeste N - numarul de noduri, apoi, elementele de pe urmatoarele N linii. Pentru fiecare
linie se citeste numarul nodului (indice) si numarul de vecini  (nr_vec). Apoi, se citesc 
vecinii (vec(j)), iar in cazul in care un nod are legatura catre el insusi numarul vecinilor 
scade, nefiind luat in considerare. Se parcurg iar vecinii, iar in cazul in care elementul nu 
este pe diagonala principala, elementul din matricea M devine 1 / new_nr_vec. La final, se 
citesc cele doua valori.

CERINTA 2:
-->functia Algebraic
Dupa completarea matricei (functia citire_date), se aplica algoritmul descris in cerinta. 
Formula folosita este R = (1 - d) * P + d * M * R, unde P este un vector coloana, avand ca 
valori 1/N. Separandu-l pe R in partea stanga, se obtine: 
R = inv(eye(N) - d * M) * ((1 - d) * P). Pentru calculul inversei se foloseste functia PR_Inv.
-->functia PR_Inv
Pentru a calcula inversa matricii, se foloseste algoritmul Gram-Schmidt, determinandu-se 
Q si R. Se formeaza n sisteme de ecuatii, cu ajutorul formulei R * xi = QT * ei, care se rezolva,
rezultand elementele inversei.

CERINTA 3:
-->functia Apartenenta
Pentru ca functia sa fie continua, se gasesc urmatoarele conditii : a * val1 + b = 0, 
a * val2 + b = 1. Din aceste ecuatii se afla a si b, iar apoi se calculeaza valoarea functiei in 
punctul dat, in functie de intervalul in care se afla.
-->functie PageRank
Dupa citirea datelor din fisier (functia citire_date), se scrie N in fisierul de iesire. Apoi, se 
apeleaza functiile Iterative si Algebraic si se scriu vectorii obtinuti. Vectorul obtinut prin 
Alegebraic (R2) este sortat descrescator (si retinut in PR1), alaturi de un vector de indici, 
urmand sa fie scrisi acesti indici si valorile functiei in elementele din PR1.