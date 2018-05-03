win(Board, Player) :-
    append(_, [Column|_], Board),
    check_column(Column, Player, 3).

check_column([Player|_], Player, 0).
check_column([Player|Under], Player, N) :-
    N2 is N - 1,
    check_column(Under, Player, N2).
check_column(['-'|Under], Player, _) :-
    check_column(Under, Player, 3).
check_column([], _, _) :-
    fail.
