DROP FUNCTION IF EXISTS conreality.object_is_immovable(uuid) RESTRICT;

-- Determines whether this is an immovable physical object.
--CREATE OR REPLACE FUNCTION conreality.object_is_immovable(object_uuid uuid) RETURNS boolean AS $$
--  SELECT o.mass = 'Infinity'::real FROM conreality.object o WHERE o.uuid = object_uuid;
--$$ LANGUAGE sql STABLE PARALLEL SAFE;
