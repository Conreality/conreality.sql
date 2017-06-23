DROP FUNCTION IF EXISTS conreality.point_2d(float, float) RESTRICT;

CREATE FUNCTION conreality.point_2d(x float, y float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y);
$$ LANGUAGE sql STABLE PARALLEL SAFE;
