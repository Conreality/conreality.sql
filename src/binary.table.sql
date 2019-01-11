DROP TABLE IF EXISTS conreality.binary CASCADE;

CREATE TABLE conreality.binary (
  -- The binary's sequential identifier (ID).
  id bigserial NOT NULL PRIMARY KEY,
  -- The binary's unique identifier (SHA-256 fingerprint).
  sha256 bytea NOT NULL CHECK (length(sha256) = 32) UNIQUE,
  -- The binary's MIME content type.
  type conreality.binary_type NOT NULL,
  -- The binary data.
  data bytea NOT NULL
);

ALTER TABLE conreality.binary ALTER COLUMN sha256 SET STORAGE PLAIN;
