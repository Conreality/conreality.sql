DROP FUNCTION IF EXISTS conreality.object_is_inactive(text) RESTRICT;

-- Determines whether this object is currently inactive.
CREATE FUNCTION conreality.object_is_inactive(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
