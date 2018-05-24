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

% Loop through all 6 rows (columns of Board object) and print separately
show(Board) :-
    show(Board, 6),
    nl.
show(_, 0).
show(Board, N) :-
    show_row(Board, NewBoard),
    nl,
    N2 is N - 1,
    show(NewBoard, N2).

show_row([], []).
show_row([[A|B]|C], [B|D]) :-
    write(A),
    write(' '),
    show_row(C, D).

% X win condition
play(Board) :-
    win(Board, 'X'),
    write("You win!"),
    nl,
    halt.

% O win condition
play(Board) :-
    win(Board, 'O'),
    write("I win!"),
    nl,
    halt.

play(Board) :-

    % Read in column choice
    write("Enter column: "),
    nl,
    read(N),
    Index is N - 1,

    % If valid column choice
    % Make the move and return the new board
    % Else, try again
    (  valid(Index)
    -> make_move(Board, Index, 'X', NewBoard)
    ;  play(Board)
    ),

    % Display board and play again
    show(NewBoard),
    play(NewBoard).


begin :-
    init_board(Board),
    show(Board),
    play(Board).

:- initialization(begin).