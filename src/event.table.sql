DROP TABLE IF EXISTS conreality.event RESTRICT;

CREATE TABLE conreality.event (
  -- The event's sequential identifier.
  id        bigserial NOT NULL PRIMARY KEY,
  -- The event's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The event's predicate (an action or verb).
  predicate varchar(63) NOT NULL CHECK (predicate <> ''),
  -- The subject of the predicate.
  subject   uuid NOT NULL REFERENCES conreality.object ON DELETE CASCADE,
  -- The object of the predicate.
  object    uuid NULL REFERENCES conreality.object ON DELETE SET NULL
);
