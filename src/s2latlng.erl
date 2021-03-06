-module(s2latlng).

-include("s2geo_internals.hrl").
-include("s2latlng_internals.hrl").

%% API exports
-export([
  new/0,
  new_from_s1angle_lat_lng/2,
  new_from_point/1,

  invalid/0,

  new_from_radians/2,
  new_from_degrees/2,

  new_from_e5/2,
  new_from_e6/2,
  new_from_e7/2,
  new_from_unsigned_e6/2,
  new_from_unsigned_e7/2,

  latitude/1,
  longitude/1,

  lat/1,
  lng/1,
  coords/1,
  is_valid/1,
  normalized/1,
  to_point/1,
  get_distance/2,

  add/2,
  subtract/2,
  multiply/2,

  eq/2,
  neq/2,
  lt/2,
  gt/2,
  leq/2,
  geq/2,

  approx_equals/3,

  to_string_in_degrees/1
  ]).

new() ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_DEFAULT_CONSTRUCTOR)}.

new_from_s1angle_lat_lng({s1angle, Lat}, {s1angle, Lng}) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_S1ANGLE_LAT_LNG, Lat, Lng)}.

new_from_point({s2point, {X, Y, Z}}) when is_float(X) and is_float(Y) and is_float(Z) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_POINT, {X, Y, Z})}.

invalid() ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_INVALID)}.

new_from_radians(LatRadians, LngRadians) when is_float(LatRadians) and is_float(LngRadians) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_RADIANS, LatRadians, LngRadians)}.

new_from_degrees(LatDegree, LngDegree) when is_float(LatDegree) and is_float(LngDegree) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_DEGREES, LatDegree, LngDegree)}.

new_from_e5(Lat_e5, Lng_e5) when is_number(Lat_e5) and is_number(Lng_e5) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_E5, Lat_e5, Lng_e5)}.

new_from_e6(Lat_e6, Lng_e6) when is_number(Lat_e6) and is_number(Lng_e6) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_E6, Lat_e6, Lng_e6)}.

new_from_e7(Lat_e7, Lng_e7) when is_number(Lat_e7) and is_number(Lng_e7) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_E7, Lat_e7, Lng_e7)}.

new_from_unsigned_e6(Lat_e6, Lng_e6) when is_number(Lat_e6) and is_number(Lng_e6) and (Lat_e6 >= 0) and (Lng_e6 >= 0) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_UNSIGNED_E6, Lat_e6, Lng_e6)}.

new_from_unsigned_e7(Lat_e7, Lng_e7) when is_number(Lat_e7) and is_number(Lng_e7) and (Lat_e7 >= 0) and (Lng_e7 >= 0) ->
  {s2latlng, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_FROM_UNSIGNED_E7, Lat_e7, Lng_e7)}.

latitude({s2point, {X, Y, Z}}) when is_float(X) and is_float(Y) and is_float(Z) ->
  {s1angle, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_LATITUDE, {X, Y, Z})}.

longitude({s2point, {X, Y, Z}}) when is_float(X) and is_float(Y) and is_float(Z) ->
  {s1angle, s2geo_nif:s2latlng_constructor(?S2LATLNG_CONSTRUCTORS_LONGITUDE, {X, Y, Z})}.


lat({s2latlng, S2LatLng}) ->
  {s1angle, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_LAT)}.

lng({s2latlng, S2LatLng}) ->
  {s1angle, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_LNG)}.

coords({s2latlng, S2LatLng}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_COORDS).

is_valid({s2latlng, S2LatLng}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_IS_VALID).

normalized({s2latlng, S2LatLng}) ->
  {s2latlng, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_NORMALIZED)}.

to_point({s2latlng, S2LatLng}) ->
  {s2point, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_TO_POINT)}.

get_distance({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  {s2point, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_GET_DISTANCE, Other)}.


add({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  {s2latlng, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_ADD, Other)}.

subtract({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  {s2latlng, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_SUBTRACT, Other)}.

multiply({s2latlng, S2LatLng}, M) when is_float(M) ->
  {s2latlng, s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_MULTIPLY, M)}.


eq({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_EQ, Other).

neq({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_NEQ, Other).

lt({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_LT, Other).

gt({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_GT, Other).

leq({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_LEQ, Other).

geq({s2latlng, S2LatLng}, {s2latlng, Other}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_GEQ, Other).


approx_equals({s2latlng, S2LatLng}, {s2latlng, Other}, MaxError) when is_number(MaxError) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_APPROX_EQUALS, Other, MaxError).

to_string_in_degrees({s2latlng, S2LatLng}) ->
  s2geo_nif:s2latlng_methods(S2LatLng, ?S2LATLNG_METHODS_TO_STRING_IN_DEGREES).
