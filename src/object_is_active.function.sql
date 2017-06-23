DROP FUNCTION IF EXISTS conreality.object_is_active(text) RESTRICT;

-- Determines whether this object is currently active.
CREATE FUNCTION conreality.object_is_active(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
