DROP TABLE IF EXISTS conreality.binary CASCADE;

DROP TYPE IF EXISTS conreality.binary_type RESTRICT;

CREATE TYPE conreality.binary_type AS ENUM (
  'image/gif',
  'image/jpeg',
  'image/png',
  'image/svg+xml'
);

CREATE TABLE conreality.binary (
  -- The binary's sequential identifier.
  id bigserial NOT NULL PRIMARY KEY,
  -- The binary's unique identifier (SHA-256 fingerprint).
  sha256 bytea NOT NULL CHECK (length(sha256) = 32) UNIQUE,
  -- The binary's MIME content type.
  type conreality.binary_type NOT NULL,
  -- The binary data.
  data bytea NOT NULL
);

ALTER TABLE conreality.binary ALTER COLUMN sha256 SET STORAGE PLAIN;
