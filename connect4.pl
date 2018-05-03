:- consult(moves).
:- consult(win_conditions).

init_board([
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-'],
    ['-', '-', '-', '-', '-', '-']
]).

show(Board) :-
    show(Board, 6),
    nl.
show(_, 0).
show(Board, N) :-
    show_row(Board, NewBoard),
    nl,
    N2 is N - 1,
    show(NewBoard, N2).

show_row([], _).
show_row([[A|B]|C], [B|D]) :-
    write(A),
    write(' '),
    show_row(C, D).

play(Board) :-
    win(Board, 'X'),
    write("You win!").
play(Board) :-
    win(Board, 'O'),
    write("I win!").
play(Board) :-
    write("Enter column: "),
    nl,
    read(N),
    Index is N - 1,
    (  valid(Index)
    -> make_move(Board, Index, 'X', NewBoard)
    ;  play(Board)
    ),
    show(NewBoard),
    play(NewBoard).

begin :-
    init_board(Board),
    show(Board),
    play(Board).

:- initialization(begin).