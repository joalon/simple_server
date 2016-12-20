%% Feel free to use, reuse and abuse the code in this file.

%% @doc Rest handler.
-module(views_handler).

-export([init/2]).

init(Req0, Opts) ->

	{ok, C} = eredis:start_link("redis", 6379), 
	{ok, PageViewCounter} = eredis:q(C, ["INCR", "page-views"]),
	eredis:stop(C),

	{ok, Hostname} = inet:gethostname(),
	BinaryHostname = list_to_binary(Hostname),
	From = list_to_binary("From host: "),
	Got = list_to_binary(", got: "),

	Reply = << From/binary, BinaryHostname/binary, Got/binary, PageViewCounter/binary >>,

	Req = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], Reply, Req0),
	{ok, Req, Opts}.
