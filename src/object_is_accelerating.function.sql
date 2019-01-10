DROP FUNCTION IF EXISTS conreality.object_is_accelerating(text) RESTRICT;

-- Determines whether this object has a nonzero linear acceleration.
--CREATE FUNCTION conreality.object_is_accelerating(object_uuid text) RETURNS boolean AS $$
--  return nil -- unknown
--$$ LANGUAGE pllua STABLE PARALLEL SAFE;
