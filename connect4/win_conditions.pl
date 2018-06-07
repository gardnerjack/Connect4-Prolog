% Vertical win condition
win(Board, Player) :-
    append(_, [Column | _], Board),
    check_column(Column, Player).
% Horizontal win condition
win(Board, Player) :-
    append(_, [Col1, Col2, Col3, Col4 | _], Board),
    check_rows(Col1, Col2, Col3, Col4, Player).

check_column([], _) :-
    fail.
check_column([Player, Player, Player, Player | _], Player).
check_column([_ | Under], Player) :-
    check_column(Under, Player).

check_rows([], [], [], [], _) :-
    fail.
check_rows([Player | _], [Player | _], [Player | _], [Player | _], Player).
check_rows([_ | Under1], [_ | Under2], [_ | Under3], [_ | Under4], Player) :-
    check_rows(Under1, Under2, Under3, Under4, Player).