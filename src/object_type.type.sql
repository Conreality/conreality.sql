DROP TYPE IF EXISTS conreality.object_type RESTRICT;

CREATE TYPE conreality.object_type AS ENUM (
  'asset',
  'camera',
  'player',
  'target'
);
