% Vertical win condition
win(Board, Player) :-
    append(_, [Column | _], Board),
    check_column(Column, Player).
% Horizontal win condition
win(Board, Player) :-
    append(_, [Col1, Col2, Col3, Col4 | _], Board),
    check_rows(Col1, Col2, Col3, Col4, Player).
% Diagonal win condition type 1 (decreasing rows)
win(Board, Player) :-
    append(_, [Col1, Col2, Col3, Col4 | _], Board),
    Col2 = [_ | NewCol2],
    Col3 = [_, _ | NewCol3],
    Col4 = [_, _, _ | NewCol4],
    check_rows(Col1, NewCol2, NewCol3, NewCol4, Player).
% Diagonal win condition type 2 (increasing rows)
win(Board, Player) :-
    append(_, [Col1, Col2, Col3, Col4 | _], Board),
    Col1 = [_, _, _ | NewCol1],
    Col2 = [_, _ | NewCol2],
    Col3 = [_ | NewCol3],
    check_rows(NewCol1, NewCol2, NewCol3, Col4, Player).

check_column([], _) :-
    fail.
check_column([Player, Player, Player, Player | _], Player).
check_column([_ | Under], Player) :-
    check_column(Under, Player).

check_rows([], _, _, _, _) :-
    fail.
check_rows(_, _, _, [], _) :-
    fail.
check_rows([Player | _], [Player | _], [Player | _], [Player | _], Player).
check_rows([_ | Under1], [_ | Under2], [_ | Under3], [_ | Under4], Player) :-
    check_rows(Under1, Under2, Under3, Under4, Player).