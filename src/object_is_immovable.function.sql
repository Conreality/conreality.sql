DROP FUNCTION IF EXISTS conreality.object_is_immovable(text) RESTRICT;

-- Determines whether this is an immovable physical object.
CREATE FUNCTION conreality.object_is_immovable(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
