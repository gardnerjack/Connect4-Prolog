:- use_module(library(clpfd)).
:- consult(moves).
:- consult(win_conditions).
:- consult(opponent).

% List of columns
% Makes it easier to travel down columns
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
    transpose(Board, PrintableBoard),
    nl,
    print_row(PrintableBoard),
    writeln(' 1 2 3 4 5 6 7 \n').

print_row([]).
print_row([Row | Rest]) :-
    write('|'),
    print_item(Row),
    nl,
    print_row(Rest).

print_item([]).
print_item([Item | Rest]) :-
    (  Item = '-'
    -> write(' ')
    ;  write(Item)
    ),
    write('|'),
    print_item(Rest).

% Win condition
play(Board, 'O') :-
    win(Board, 'X'),
    writeln("X wins!"),
    halt.
play(Board, 'X') :-
    win(Board, 'O'),
    writeln("O wins!"),
    halt.

play(Board, 'X') :-

    % Read in column choice
    write("Enter column: "),
    nl,
    read(N),
    Choice is N - 1,

    % If valid column choice
    % Make the move and return the new board
    % Else, try again
    (  valid(Board, Choice)
    -> make_move(Board, Choice, 'X', NewBoard)
    ;  play(Board, 'X')
    ),

    % Display board, check for win conditions, and play again
    show(NewBoard),
    play(NewBoard, 'O').

play(Board, 'O') :-
    write("Opponent chooses column: "),
    opponent_move(Board, Index),
    make_move(Board, Index, 'O', NewBoard),
    Col is Index + 1,
    writeln(Col),
    show(NewBoard),
    play(NewBoard, 'X').

begin :-
    init_board(Board),
    show(Board),
    play(Board, 'X').

:- initialization(begin).