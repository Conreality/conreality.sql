DROP FUNCTION IF EXISTS conreality.point_gps(float, float) RESTRICT;

CREATE FUNCTION conreality.point_gps(lon float, lat float) RETURNS geography AS $$
  SELECT ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
