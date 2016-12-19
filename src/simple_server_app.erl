%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(simple_server_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", views_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(page_views, 100, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
	simple_server_sup:start_link().

stop(_State) ->
	ok.
