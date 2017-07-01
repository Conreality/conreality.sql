DROP FUNCTION IF EXISTS conreality.object_location(uuid) RESTRICT;

-- Determines an object's current GPS location.
CREATE OR REPLACE FUNCTION conreality.object_location(object_uuid uuid) RETURNS geography(POINT,4326) AS $$
  SELECT m.location
    FROM conreality.object_motion m
    WHERE m.uuid = object_uuid
    ORDER BY m.timestamp DESC
    LIMIT 1;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
