-module(s2geo_nif).

%% API exports
-export([
    s1interval_constructor/1,
    s1interval_constructor/2,
    s1interval_constructor/3,
    s1interval_methods/2,
    s1interval_methods/3,
    s1interval_methods/4,

    s2cellid_get_size_ij/1,
    s2cellid_get_size_st/1,
    s2cellid_lsb_for_level/1,
    s2cellid_to_face_ij_orientation/1,

    s2cellid_constructor/1,
    s2cellid_constructor/2,
    s2cellid_constructor/3,
    s2cellid_constructor/4,

    s2cellid_zero_args_fn/2,

    s2cellid_one_arg_fn/3,
    s2cellid_get_edge_neighbors/1,
    s2cellid_get_vertex_neighbors/2,
    s2cellid_get_all_neighbors/2,


    s2latlngrect_constructor/1,
    s2latlngrect_constructor/2,
    s2latlngrect_constructor/3,
    s2latlngrect_methods/2,
    s2latlngrect_methods/3,
    s2latlngrect_get_covering/3,
    s2latlngrect_get_covering/4,

    s2cellunion_constructor/2,
    s2cellunion_constructor/3,
    s2cellunion_methods/2,
    s2cellunion_methods/3,
    s2cellunion_methods/4,
    s2cellunion_get_covering/3,
    s2cellunion_get_covering/4,

    s2loop_constructor/2,
    s2loop_methods/2,
    s2loop_methods/3,
    s2loop_methods/4,
    s2loop_get_covering/3,
    s2loop_get_covering/4,

    s2cap_constructor/1,
    s2cap_constructor/3,

    s2cap_methods/2,
    s2cap_methods/3,
    s2cap_methods/4,

    s2cap_get_covering/3,
    s2cap_get_covering/4,

    s2latlng_constructor/1,
    s2latlng_constructor/2,
    s2latlng_constructor/3,
    s2latlng_methods/2,
    s2latlng_methods/3,
    s2latlng_methods/4
    ]).

%%====================================================================
%% API functions
%%====================================================================


%%====================================================================
%% Internal functions
%%====================================================================

-on_load(init/0).

-define(APPNAME, s2geo).
-define(LIBNAME, s2geo_nif).


%%====================================================================
%% S2CellId functions
%%====================================================================

s1interval_constructor(_) ->
    not_loaded(?LINE).

s1interval_constructor(_, _) ->
    not_loaded(?LINE).

s1interval_constructor(_, _, _) ->
    not_loaded(?LINE).

s1interval_methods(_, _) ->
    not_loaded(?LINE).

s1interval_methods(_, _, _) ->
    not_loaded(?LINE).

s1interval_methods(_, _, _, _) ->
    not_loaded(?LINE).


s2cellid_get_size_ij(_) ->
    not_loaded(?LINE).

s2cellid_get_size_st(_) ->
    not_loaded(?LINE).

s2cellid_lsb_for_level(_) ->
    not_loaded(?LINE).

s2cellid_to_face_ij_orientation(_) ->
    not_loaded(?LINE).

s2cellid_constructor(_) ->
    not_loaded(?LINE).

s2cellid_constructor(_, _) ->
    not_loaded(?LINE).

s2cellid_constructor(_, _, _) ->
    not_loaded(?LINE).

s2cellid_constructor(_, _, _, _) ->
    not_loaded(?LINE).

s2cellid_zero_args_fn(_, _) ->
    not_loaded(?LINE).

s2cellid_one_arg_fn(_, _, _) ->
    not_loaded(?LINE).


s2cellid_get_edge_neighbors(_) ->
    not_loaded(?LINE).

s2cellid_get_vertex_neighbors(_, _) ->
    not_loaded(?LINE).

s2cellid_get_all_neighbors(_, _) ->
    not_loaded(?LINE).



%%====================================================================
%% S2LatLngRect functions
%%====================================================================

s2latlngrect_constructor(_) ->
    not_loaded(?LINE).

s2latlngrect_constructor(_, _) ->
    not_loaded(?LINE).

s2latlngrect_constructor(_, _, _) ->
    not_loaded(?LINE).

s2latlngrect_methods(_, _) ->
    not_loaded(?LINE).

s2latlngrect_methods(_, _, _) ->
    not_loaded(?LINE).

s2latlngrect_get_covering(_, _, _, _) ->
    not_loaded(?LINE).

s2latlngrect_get_covering(_, _, _) ->
    not_loaded(?LINE).


s2cellunion_constructor(_, _) ->
    not_loaded(?LINE).

s2cellunion_constructor(_, _, _) ->
    not_loaded(?LINE).

s2cellunion_methods(_, _) ->
    not_loaded(?LINE).

s2cellunion_methods(_, _, _) ->
    not_loaded(?LINE).

s2cellunion_methods(_, _, _, _) ->
    not_loaded(?LINE).

s2cellunion_get_covering(_, _, _) ->
    not_loaded(?LINE).

s2cellunion_get_covering(_, _, _, _) ->
    not_loaded(?LINE).

s2loop_constructor(_, _) ->
    not_loaded(?LINE).

s2loop_methods(_, _) ->
    not_loaded(?LINE).

s2loop_methods(_, _, _) ->
    not_loaded(?LINE).

s2loop_methods(_, _, _, _) ->
    not_loaded(?LINE).

s2loop_get_covering(_, _, _) ->
    not_loaded(?LINE).

s2loop_get_covering(_, _, _, _) ->
    not_loaded(?LINE).


%%====================================================================
%% S2Cap functions
%%====================================================================

s2cap_constructor(_) ->
    not_loaded(?LINE).

s2cap_constructor(_, _, _) ->
    not_loaded(?LINE).

s2cap_methods(_, _) ->
    not_loaded(?LINE).

s2cap_methods(_, _, _) ->
    not_loaded(?LINE).

s2cap_methods(_, _, _, _) ->
    not_loaded(?LINE).

s2cap_get_covering(_, _, _) ->
    not_loaded(?LINE).

s2cap_get_covering(_, _, _, _) ->
    not_loaded(?LINE).


%%====================================================================
%% S2LatLng functions
%%====================================================================

s2latlng_constructor(_) ->
    not_loaded(?LINE).

s2latlng_constructor(_, _) ->
    not_loaded(?LINE).

s2latlng_constructor(_, _, _) ->
    not_loaded(?LINE).

s2latlng_methods(_, _) ->
    not_loaded(?LINE).

s2latlng_methods(_, _, _) ->
    not_loaded(?LINE).

s2latlng_methods(_, _, _, _) ->
    not_loaded(?LINE).

init() ->
    SoName = case code:priv_dir(?APPNAME) of
        {error, bad_name} ->
            case filelib:is_dir(filename:join(["..", priv])) of
                true ->
                    filename:join(["..", priv, ?LIBNAME]);
                _ ->
                    filename:join([priv, ?LIBNAME])
            end;
        Dir ->
            filename:join(Dir, ?LIBNAME)
    end,
    erlang:load_nif(SoName, 0).

not_loaded(Line) ->
    exit({not_loaded, [{module, ?MODULE}, {line, Line}]}).
