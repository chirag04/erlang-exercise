-module(calc).
-export([rpn/1]).


read(N) ->
	list_to_integer(N).

rpn("+",[N1,N2|S]) -> [N1+N2|S];
rpn("-",[N1,N2|S]) -> [N1-N2|S];
rpn(X,Stack) -> [read(X)|Stack].

rpn(L) ->
	[Res] = lists:foldl(fun rpn/2, [], string:tokens(L," ")),
	Res.