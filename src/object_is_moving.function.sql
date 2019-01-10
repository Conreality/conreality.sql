DROP FUNCTION IF EXISTS conreality.object_is_moving(text) RESTRICT;

-- Determines whether this object has a nonzero linear velocity.
--CREATE FUNCTION conreality.object_is_moving(object_uuid text) RETURNS boolean AS $$
--  return nil -- unknown
--$$ LANGUAGE pllua STABLE PARALLEL SAFE;
