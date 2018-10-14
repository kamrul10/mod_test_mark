-module(mod_test_mark).

-behaviour(gen_mod).

%% Required by ?INFO_MSG macros
-include("ejabberd.hrl").
-include("logger.hrl").
-include("xmpp.hrl").
-include("mod_muc_room.hrl").
-include("ejabberd_commands.hrl").
-include("mod_mam.hrl").

-type c2s_state() :: ejabberd_c2s:state().
%% gen_mod API callbacks
-export([start/2, stop/1, depends/2, mod_opt_type/1, on_packet_send/1]).

start(_Host, _Opts) ->
    ejabberd_hooks:add(user_send_packet, _Host, ?MODULE, on_packet_send, 89),
    ?INFO_MSG("Test_mark, ejabberd world! ~s", [_Host]),
    ok.

stop(_Host) ->
    ejabberd_hooks:delete(user_send_packet, _Host, ?MODULE, on_packet_send, 89),
    ?INFO_MSG("Bye bye, ejabberd world!", []),
    ok.

%% -spec on_muc_iq(ignore | iq(), mod_muc_room:state()) -> ignore | iq().
%% on_muc_iq(IQ, _MUCState) -> 
  %%  ?INFO_MSG("Hook works, ejabberd world!", []).
-spec on_packet_send({stanza(), c2s_state()}) -> {stanza(), c2s_state()}.
%% on_packet_send({#message{to = Peer} = Pkt, #{jid := JID} = C2SState}) ->
   %% LUser = JID#jid.luser,
   %% LServer = JID#jid.lserver,
   %% ?INFO_MSG("Test_user, ejabberd world! ~s", [LUser]),
    
on_packet_send(Acc) ->
?INFO_MSG("Test_user", []),
 Acc.
depends(_Host, _Opts) -> [{mod_muc, hard}].
mod_opt_type(_) -> [].
