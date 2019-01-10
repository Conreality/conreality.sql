DROP FUNCTION IF EXISTS conreality.object_is_rotating(text) RESTRICT;

-- Determines whether this object has a nonzero angular velocity.
--CREATE FUNCTION conreality.object_is_rotating(object_uuid text) RETURNS boolean AS $$
--  return nil -- unknown
--$$ LANGUAGE pllua STABLE PARALLEL SAFE;
