DROP TABLE IF EXISTS conreality.object_location CASCADE;

CREATE TABLE conreality.object_location (
  -- The object's unique identifier.
  uuid uuid NOT NULL PRIMARY KEY,
  -- The object's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The object's current position (as 3D coordinates relative to its theater).
  position geometry(POINTZ,4326) NOT NULL,
  -- The object's current location (as GPS coordinates).
  location geography(POINT,4326) NOT NULL,
  -- The measurement's radius of uncertainty (in meters).
  uncertainty float NULL
);
