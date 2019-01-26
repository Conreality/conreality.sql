DROP TABLE IF EXISTS conreality.player_status RESTRICT;

CREATE TABLE conreality.player_status (
  -- The status's sequential identifier (ID).
  id        bigserial NOT NULL PRIMARY KEY,
  -- The status timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  player    bigint NOT NULL REFERENCES conreality.player ON DELETE CASCADE,
  state     varchar(16) NULL CHECK (state <> ''),
  latitude  double NULL,
  longitude double NULL,
  altitude  real NULL
);
