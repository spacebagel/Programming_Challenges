-module(port_scanner).
-export([check_port/2, check_all/1]).

check_port(Host, Port) ->
    case gen_tcp:connect(Host, Port, [binary, {active, false}], 300) of
        {ok, Sock} -> gen_tcp:close(Sock), {Port, open};
        {error, _} -> {Port, closed}
    end.

check_all(Host) -> Ports = lists:seq(1, 65535), scan_ports(Host, Ports, 0).

scan_ports(_Host, [], 0) -> io:format("Done~n"); 
scan_ports(Host, [], ActiveCount) ->
    receive {done, _Port} -> scan_ports(Host, [], ActiveCount - 1) end;
scan_ports(Host, [P | Rest], ActiveCount) when ActiveCount >= 500 ->
    receive {done, _Port} -> scan_ports(Host, [P | Rest], ActiveCount - 1) end;
scan_ports(Host, [P | Rest], ActiveCount) -> Parent = self(),
    spawn(fun() ->
        Result = check_port(Host, P),
        Parent ! {done, P},
        case Result of
            {_P, open} -> io:format("~p port is OPEN~n", [P]);
            _ -> ok
        end
    end),
    scan_ports(Host, Rest, ActiveCount + 1).