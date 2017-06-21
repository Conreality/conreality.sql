DROP TABLE IF EXISTS conreality.camera_frame RESTRICT;

CREATE TABLE conreality.camera_frame (
  -- The camera's unique identifier.
  uuid      uuid NOT NULL PRIMARY KEY REFERENCES conreality.camera ON DELETE CASCADE,
  -- The frame's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The binary data.
  data      bytea NOT NULL
);
