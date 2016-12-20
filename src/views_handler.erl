%% Feel free to use, reuse and abuse the code in this file.

%% @doc Rest handler.
-module(views_handler).

-export([init/2]).

init(Req0, Opts) ->

	{ok, C} = eredis:start_link("redis", 6379), 
	{ok, Value} = eredis:q(C, ["INCR", "page-views"]),
	eredis:stop(C),

	Req = cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain">>}
	], Value, Req0),
	{ok, Req, Opts}.
