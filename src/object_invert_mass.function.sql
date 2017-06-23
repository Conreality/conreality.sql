DROP FUNCTION IF EXISTS conreality.object_invert_mass(text) RESTRICT;

-- Computes the inverse mass of this object.
CREATE FUNCTION conreality.object_invert_mass(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
