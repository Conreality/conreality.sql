DROP TABLE IF EXISTS conreality.player_heartbeat CASCADE;

CREATE TABLE conreality.player_heartbeat (
  -- The object's unique identifier.
  uuid uuid NOT NULL REFERENCES conreality.object ON DELETE CASCADE,

  -- The measurement's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),

  -- The measurement's value.
  measurement real NOT NULL,

  PRIMARY KEY (uuid, timestamp)
);
