DROP FUNCTION IF EXISTS conreality.object_is_located(uuid) RESTRICT;

-- Determines whether this object has a nonzero position.
CREATE OR REPLACE FUNCTION conreality.object_is_located(object_uuid uuid) RETURNS boolean AS $$
  SELECT COUNT(m.uuid) > 0 FROM conreality.object_motion m WHERE m.uuid = object_uuid;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
