DROP TABLE IF EXISTS conreality.message CASCADE;

CREATE TABLE conreality.message (
  -- The message's sequential identifier (ID).
  id        bigserial NOT NULL PRIMARY KEY,
  -- The message timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The message sender (a player or asset; NULL indicates the system).
  sender    bigint NULL REFERENCES conreality.entity ON DELETE CASCADE,
  -- The message recipient (a player or asset; NULL indicates everyone).
  recipient bigint NULL REFERENCES conreality.entity ON DELETE CASCADE,
  -- The message contents as text.
  text      text NULL,
  -- The message contents as audio.
  audio     bigint NULL REFERENCES conreality.binary ON DELETE SET NULL
);
