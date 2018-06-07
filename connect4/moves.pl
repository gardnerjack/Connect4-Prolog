valid(Board, Choice) :-
    (Choice = 0; Choice = 1; Choice = 2; Choice = 3; Choice = 4; Choice = 5; Choice = 6),
    append(Start, [Column | _], Board),
    length(Start, Choice),
    Column = ['-' | _].

make_move(Board, N, Player, NewBoard) :-
    % Find section of board with start that is the length of column choice
    append(Start, [Column | Rest], Board),
    length(Start, N),
    enter_column(Column, Player, NewColumn),
    append(Start, [NewColumn|Rest], NewBoard).

% Keep going down until piece can be placed
enter_column(['-' | Under], Player, ['-' | NewUnder]) :-
    enter_column(Under, Player, NewUnder).

enter_column(['-', A | Under], Player, [Player, A | Under]) :-
    A \== '-'.

enter_column(['-'], Player, [Player]).