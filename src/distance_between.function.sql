DROP FUNCTION IF EXISTS conreality.distance_between(geometry, geometry) RESTRICT;
DROP FUNCTION IF EXISTS conreality.distance_between(geography, geography) RESTRICT;

CREATE FUNCTION conreality.distance_between(p1 geometry, p2 geometry) RETURNS float AS $$
  SELECT ST_Distance(p1, p2);
$$ LANGUAGE sql STABLE PARALLEL SAFE;

CREATE FUNCTION conreality.distance_between(p1 geography, p2 geography) RETURNS float AS $$
  SELECT ST_Distance(p1, p2);
$$ LANGUAGE sql STABLE PARALLEL SAFE;
