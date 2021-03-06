-module(s2loop).

-include("s2geo_internals.hrl").
-include("s2loop_internals.hrl").

-export([
  new_from_s2point_list/1,
  new_from_s2latlng_list/1,
  new_from_s2cellid/1,

  encode/1,
  decode/1,
  invert/1,

  is_valid/1,
  depth/1,
  is_hole/1,
  sign/1,
  num_vertices/1,
  vertex/2,
  is_normalized/1,
  normalize/1,
  get_area/1,
  get_centroid/1,
  get_turning_angle/1,

  contains/2,
  intersects/2,
  contains_nested/2,
  contains_or_crosses/2,
  boundary_equals/2,
  boundary_approx_equals/2,
  boundary_near/2,

  get_rect_bound/1,

  contains_s2cellid/2,
  may_intersect_s2cellid/2,
  contains_s2point/2,

  get_covering/1,
  get_covering/2,
  get_covering/3,
  get_interior_covering/3,
  get_cellunion_covering/3,
  get_cellunion_interior_covering/3
  ]).

new_from_s2point_list(S2PointList) when is_list(S2PointList) ->
  S2LoopRef = s2geo_nif:s2loop_constructor(?S2LOOPCONSTRUCTORS_FROM_S2POINT_LIST, S2PointList),
  {s2loop, S2LoopRef}.

new_from_s2latlng_list(List) when is_list(List) ->
  S2LoopRef = s2geo_nif:s2loop_constructor(?S2LOOPCONSTRUCTORS_FROM_S2LATLNG_LIST, List),
  {s2loop, S2LoopRef}.

new_from_s2cellid({s2cellid, S2CellId}) ->
  S2LoopRef = s2geo_nif:s2loop_constructor(?S2LOOPCONSTRUCTORS_FROM_S2CELLID, S2CellId),
  {s2loop, S2LoopRef}.


encode({s2loop, S2LoopRef}) when is_reference(S2LoopRef) ->
   s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_ENCODE).

decode(String) when is_binary(String) ->
  S2LoopRef = s2geo_nif:s2loop_constructor(?S2LOOPCONSTRUCTORS_DECODE, String),
  {s2loop, S2LoopRef}.

invert({s2loop, S2LoopRef}) ->
  NewS2LoopRef = s2geo_nif:s2loop_constructor(?S2LOOPCONSTRUCTORS_INVERT, S2LoopRef),
  {s2loop, NewS2LoopRef}.

is_valid({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_IS_VALID).

depth({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_DEPTH).

is_hole({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_IS_HOLE).

sign({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_SIGN).

num_vertices({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_NUM_VERTICES).

vertex({s2loop, S2LoopRef}, Index) when is_integer(Index) ->
  {X, Y, Z} = s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_VERTEX, Index),
  {s2point, X, Y, Z}.

is_normalized({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_IS_NORMALIZED).

normalize({s2loop, S2LoopRef}) -> {s2loop, S2LoopRef}.

get_area({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_GET_AREA).

get_centroid({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_GET_CENTROID).

get_turning_angle({s2loop, S2LoopRef}) ->
  s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_GET_TURNING_ANGLE).

contains({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_CONTAINS, S2LoopRefOther).

intersects({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_INTERSECTS, S2LoopRefOther).

contains_nested({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_CONTAINS_NESTED, S2LoopRefOther).

contains_or_crosses({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_CONTAINS_OR_CROSSES, S2LoopRefOther).

boundary_equals({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_BOUNDARY_EQUALS, S2LoopRefOther).

boundary_approx_equals({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_BOUNDARY_APPROX_EQUALS, S2LoopRefOther).

boundary_near({s2loop, S2LoopRefSelf}, {s2loop, S2LoopRefOther}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_BOUNDARY_NEAR, S2LoopRefOther).

get_rect_bound({s2loop, S2LoopRef}) ->
  S2LatLngRect = s2geo_nif:s2loop_methods(S2LoopRef, ?S2LOOPMETHODS_GET_RECT_BOUND),
  {s2latlngrect, S2LatLngRect}.

contains_s2cellid({s2loop, S2LoopRefSelf}, {s2cellid, Cellid}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_CONTAINS_S2CELLID, Cellid).

may_intersect_s2cellid({s2loop, S2LoopRefSelf}, {s2cellid, Cellid}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_MAY_INTERSECT_S2CELLID, Cellid).

contains_s2point({s2loop, S2LoopRefSelf}, {s2point, X, Y, Z}) ->
  s2geo_nif:s2loop_methods(S2LoopRefSelf, ?S2LOOPMETHODS_CONTAINS_S2POINT, {X, Y, Z}).



get_covering({s2loop, Ref}) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELLID_COVERING, 0),
   {covering, Covering}.

get_covering({s2loop, Ref}, MaxCells) when is_reference(Ref), is_integer(MaxCells) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELLID_COVERING, MaxCells),
   {covering, Covering};
get_covering({s2loop, Ref}, {MinLevel, MaxLevel} ) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELLID_COVERING, 0, {MinLevel, MaxLevel}),
   {covering, Covering}.

get_covering({s2loop, Ref}, MaxCells, {MinLevel, MaxLevel} ) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELLID_COVERING, MaxCells, {MinLevel, MaxLevel}),
   {covering, Covering}.

get_interior_covering({s2loop, Ref}, MaxCells, {MinLevel, MaxLevel} ) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELLID_INTERIOR_COVERING, MaxCells, {MinLevel, MaxLevel}),
   {covering, Covering}.

get_cellunion_covering({s2loop, Ref}, MaxCells, {MinLevel, MaxLevel} ) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_CELL_UNION_COVERING, MaxCells, {MinLevel, MaxLevel}),
   {covering, Covering}.

get_cellunion_interior_covering({s2loop, Ref}, MaxCells, {MinLevel, MaxLevel} ) when is_reference(Ref) ->
   Covering = s2geo_nif:s2loop_get_covering(Ref, ?S2REGIONCOVERINGTYPE_INTERIOR_CELL_UNION_COVERING, MaxCells, {MinLevel, MaxLevel}),
   {covering, Covering}.
