DROP FUNCTION IF EXISTS conreality.object_position(uuid) RESTRICT;

-- Determines an object's current 3D position.
CREATE OR REPLACE FUNCTION conreality.object_position(object_uuid uuid) RETURNS geometry(POINTZ) AS $$
  SELECT m.position
    FROM conreality.object_motion m
    WHERE m.uuid = object_uuid
    ORDER BY m.timestamp DESC
    LIMIT 1;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
