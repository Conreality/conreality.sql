DROP FUNCTION IF EXISTS conreality.object_velocity(uuid) RESTRICT;

-- Determines an object's current velocity.
CREATE OR REPLACE FUNCTION conreality.object_velocity(object_uuid uuid) RETURNS geometry AS $$
  SELECT m.velocity FROM conreality.object_motion m
    WHERE m.uuid = object_uuid
    ORDER BY m.timestamp DESC
    LIMIT 1;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
