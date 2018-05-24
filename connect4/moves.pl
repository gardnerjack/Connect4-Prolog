valid(0).
valid(1).
valid(2).
valid(3).
valid(4).
valid(5).
valid(6).

make_move(Board, N, Player, NewBoard) :-
    % Find section of board with start that is the length of column choice
    append(Start, [Column|Rest], Board),
    length(Start, N),
    enter_column(Column, Player, NewColumn),
    append(Start, [NewColumn|Rest], NewBoard).

% Keep going down until piece can be placed
enter_column(['-'|Under], Player, ['-'|NewUnder]) :-
    enter_column(Under, Player, NewUnder).
enter_column(['-',A|Under], Player, [Player,A|Under]) :-
    A \== '-'.
enter_column(['-'], Player, [Player]).