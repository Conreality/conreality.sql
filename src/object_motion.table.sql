DROP TABLE IF EXISTS conreality.object_motion CASCADE;

CREATE TABLE conreality.object_motion (
  -- The object's unique identifier.
  uuid uuid NOT NULL REFERENCES conreality.object ON DELETE CASCADE,

  -- The measurement's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),

  -- The measurement's type.
  type conreality.measure_type NOT NULL DEFAULT 'reported',

  -- The object's current location (as GPS coordinates).
  location geography(POINT,4326) NOT NULL
    CHECK (ST_X(location::geometry) >= -180 AND
           ST_X(location::geometry) <= +180 AND
           ST_Y(location::geometry) >= -90  AND
           ST_Y(location::geometry) <= +90),

  -- The object's current position (as 3D coordinates relative to its theater).
  position geometry(POINTZ) NOT NULL,
  -- The measurement's estimated horizontal accuracy (in meters).
  position_accuracy real NULL,

  -- The object's current linear velocity (in meters/second over ground).
  velocity geometry(POINTZ) NULL,
  -- The measurement's estimated velocity accuracy (in meters/second).
  velocity_accuracy real NULL,

  -- The object's bearing (in the range (0,360] degrees, as radians relative to north).
  bearing real NULL CHECK (bearing >= 0 AND bearing < 2*pi()),
  -- The measurement's estimated bearing accuracy (in the range (0,180] degrees, as radians).
  bearing_accuracy real NULL CHECK (bearing >= 0 AND bearing < pi()),

  PRIMARY KEY (uuid, timestamp)
);
