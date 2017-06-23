DROP FUNCTION IF EXISTS conreality.point_3d(float, float, float) RESTRICT;

CREATE FUNCTION conreality.point_3d(x float, y float, z float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y, z);
$$ LANGUAGE sql STABLE PARALLEL SAFE;
