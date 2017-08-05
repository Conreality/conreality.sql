DROP TYPE IF EXISTS conreality.binary_type RESTRICT;

CREATE TYPE conreality.binary_type AS ENUM (
  'application/octet-stream',
  'image/gif',
  'image/jpeg',
  'image/png',
  'image/svg+xml'
);
