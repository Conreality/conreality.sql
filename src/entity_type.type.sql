DROP TYPE IF EXISTS conreality.entity_type RESTRICT;

CREATE TYPE conreality.entity_type AS ENUM (
  'player',
  'target',
  'theater',
  'unit'
);
