DROP TABLE IF EXISTS conreality.event RESTRICT;

CREATE TABLE conreality.event (
  -- The event's sequential identifier (ID).
  id        bigserial NOT NULL PRIMARY KEY,
  -- The event timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The event's predicate (an action or verb).
  predicate varchar(63) NOT NULL CHECK (predicate <> ''),
  -- The subject of the predicate (a player or asset; NULL indicates the system).
  subject   bigint NULL REFERENCES conreality.entity ON DELETE CASCADE,
  -- The object of the predicate (a player or asset; NULL indicates the system).
  object    bigint NULL REFERENCES conreality.entity ON DELETE SET NULL
);
