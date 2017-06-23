DROP FUNCTION IF EXISTS conreality.object_is_located(text) RESTRICT;

-- Determines whether this object has a nonzero position.
CREATE FUNCTION conreality.object_is_located(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
