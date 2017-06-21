DROP TABLE IF EXISTS conreality.theater CASCADE;

CREATE TABLE conreality.theater (
  -- The theater's unique identifier.
  uuid     uuid NOT NULL PRIMARY KEY,
  -- The theater's designated label.
  label    varchar(31) NULL CHECK (label <> ''),
  -- The theater's origin location (as GPS coordinates).
  location geography(POINT,4326) NULL
);
