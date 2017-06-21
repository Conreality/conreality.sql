DROP FUNCTION IF EXISTS conreality.point_2d(float, float) RESTRICT;
DROP FUNCTION IF EXISTS conreality.point_3d(float, float, float) RESTRICT;
DROP FUNCTION IF EXISTS conreality.point_gps(float, float) RESTRICT;

CREATE FUNCTION conreality.point_2d(x float, y float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y);
$$ LANGUAGE sql STABLE PARALLEL SAFE;

CREATE FUNCTION conreality.point_3d(x float, y float, z float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y, z);
$$ LANGUAGE sql STABLE PARALLEL SAFE;

CREATE FUNCTION conreality.point_gps(lon float, lat float) RETURNS geography AS $$
  SELECT ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
