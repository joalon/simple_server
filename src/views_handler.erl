%% Feel free to use, reuse and abuse the code in this file.

%% @doc Rest handler.
-module(views_handler).

-export([init/2]).

init(Req0, Opts) ->

	{ok, C} = eredis:start_link("redis", 6379), 
	{ok, PageViewCounter} = eredis:q(C, ["INCR", "page-views"]),
	eredis:stop(C),

	{ok, Hostname} = inet:gethostname(),
	Reply = << list_to_binary("From host: ")/binary, list_to_binary(Hostname)/binary, list_to_binary(", got: ")/binary, PageViewCounter/binary >>,

	Req = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], Reply, Req0),
	{ok, Req, Opts}.
