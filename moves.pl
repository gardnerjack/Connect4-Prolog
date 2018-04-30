valid(0).
valid(1).
valid(2).
valid(3).
valid(4).
valid(5).
valid(6).

make_move(Board, N, Player, NewBoard) :-
    append(Start, [Column|Rest], Board),
    length(Start, N),
    enter_column(Column, Player, NewColumn),
    append(Start, [NewColumn|Rest], NewBoard).

enter_column(['-'|Under], Player, ['-'|NewUnder]) :-
    enter_column(Under, Player, NewUnder).
enter_column(['-',A|Under], Player, [Player,A|Under]) :-
    A \== '-'.
enter_column(['-'], Player, [Player]).