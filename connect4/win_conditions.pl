% Vertical win condition
win(Board, Player) :-
    append(_, [Column|_], Board),
    check_column(Column, Player, 4).
% Horizontal win condition
win(Board, Player) :-
    win(Board, Player, 6).
win(_, _, 0) :-
    fail.
win(Board, Player, N) :-
    check_row(Board, Player, NewBoard, 4, Win),
    N2 is N - 1,
    (  Win = 'true'
    -> !
    ;  win(NewBoard, Player, N2)
    ).

check_column([Player|_], Player, 1).
check_column([Player|Under], Player, N) :-
    N2 is N - 1,
    check_column(Under, Player, N2).
check_column([_|Under], Player, _) :-
    check_column(Under, Player, 4).
check_column([], _, _) :-
    fail.

check_row([[Player|_]|_], Player, _, 1, 'true').
check_row([], _, [], _, 'false').
check_row([[Player|B]|C], Player, [B|D], N, Win) :-
    N2 is N - 1,
    check_row(C, Player, D, N2, Win).
check_row([[_|B]|C], Player, [B|D], _, Win) :-
    check_row(C, Player, D, 4, Win).