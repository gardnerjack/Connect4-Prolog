:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- http_handler(/, start, []).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

start(Request) :-
	reply_html_page(
        [
            title('Tic-Tac-Toe'),
            style('button { 1px solid black; height: 50px; width: 50px; }')
        ],
        [
            h1('Tic-Tac-Toe'),
            div([button([id=1],''), button([id=2],''), button([id=3],'')]),
            div([button([id=4],''), button([id=5],''), button([id=6],'')]),
            div([button([id=7],''), button([id=8],''), button([id=9],'')])
        ]
    ).