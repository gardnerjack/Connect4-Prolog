:- consult(win_conditions).

opponent_move(Board, Index) :-
    make_move(Board, Index, 'O', NewBoard),
    win(NewBoard, 'O').

opponent_move(Board, Index) :-
    make_move(Board, Index, 'X', NewBoard),
    win(NewBoard, 'X').

opponent_move(_, Index) :-
    random(0, 6, Index).