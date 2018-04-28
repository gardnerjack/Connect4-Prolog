begin :-
    write("Enter the position you wish to place the X when prompted (followed by .)"), nl,
    display([1, 2, 3, 4, 5, 6, 7, 8, 9]),
    play([-, -, -, -, -, -, -, -, -]).

display([A, B, C, D, E, F, G, H, I]) :-
    write([A, B, C]), nl,
    write([D, E, F]), nl,
    write([G, H, I]), nl, nl.

play(Board) :-
    win(x, Board),
    write("You win!").
play(Board) :-
    win(o, Board),
    write("I win!").
play(Board) :-
    write("Enter position: "), nl,
    read(N),
    move_x(Board, N, XBoard),
    display(XBoard),
    move_o(XBoard, XOBoard),
    display(XOBoard),
    play(XOBoard).

move_x([-, B, C, D, E, F, G, H, I], 1, [x, B, C, D, E, F, G, H, I]).
move_x([A, -, C, D, E, F, G, H, I], 2, [A, x, C, D, E, F, G, H, I]).
move_x([A, B, -, D, E, F, G, H, I], 3, [A, B, x, D, E, F, G, H, I]).
move_x([A, B, C, -, E, F, G, H, I], 4, [A, B, C, x, E, F, G, H, I]).
move_x([A, B, C, D, -, F, G, H, I], 5, [A, B, C, D, x, F, G, H, I]).
move_x([A, B, C, D, E, -, G, H, I], 6, [A, B, C, D, E, x, G, H, I]).
move_x([A, B, C, D, E, F, -, H, I], 7, [A, B, C, D, E, F, x, H, I]).
move_x([A, B, C, D, E, F, G, -, I], 8, [A, B, C, D, E, F, G, x, I]).
move_x([A, B, C, D, E, F, G, H, -], 9, [A, B, C, D, E, F, G, H, x]).
move_x(_, q, _) :- halt.
move_x(Board, _, _) :- write('Invalid Move'), nl, play(Board).

move_o(Board, NewBoard) :-
    check_move(Board, o, NewBoard),
    win(o, NewBoard),
    !.
move_o(Board, NewBoard) :-
    check_move(Board, o, NewBoard),
    not(x_can_win(NewBoard)).
move_o(Board, NewBoard) :-
    check_move(Board, o, NewBoard).
move_o(Board, NewBoard) :-
    not(member(-, Board)),
    !,
    write("Draw!").

x_can_win(Board) :-
    check_move(Board, x, NewBoard),
    win(x, NewBoard).

check_move([-, B, C, D, E, F, G, H, I], XO, [XO, B, C, D, E, F, G, H, I]).
check_move([A, -, C, D, E, F, G, H, I], XO, [A, XO, C, D, E, F, G, H, I]).
check_move([A, B, -, D, E, F, G, H, I], XO, [A, B, XO, D, E, F, G, H, I]).
check_move([A, B, C, -, E, F, G, H, I], XO, [A, B, C, XO, E, F, G, H, I]).
check_move([A, B, C, D, -, F, G, H, I], XO, [A, B, C, D, XO, F, G, H, I]).
check_move([A, B, C, D, E, -, G, H, I], XO, [A, B, C, D, E, XO, G, H, I]).
check_move([A, B, C, D, E, F, -, H, I], XO, [A, B, C, D, E, F, XO, H, I]).
check_move([A, B, C, D, E, F, G, -, I], XO, [A, B, C, D, E, F, G, XO, I]).
check_move([A, B, C, D, E, F, G, H, -], XO, [A, B, C, D, E, F, G, H, XO]).

win(A, [A, A, A, _, _, _, _, _, _]).
win(A, [_, _, _, A, A, A, _, _, _]).
win(A, [_, _, _, _, _, _, A, A, A]).
win(A, [A, _, _, A, _, _, A, _, _]).
win(A, [_, A, _, _, A, _, _, A, _]).
win(A, [_, _, A, _, _, A, _, _, A]).
win(A, [A, _, _, _, A, _, _, _, A]).
win(A, [_, _, A, _, A, _, A, _, _]).