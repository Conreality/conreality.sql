DROP TABLE IF EXISTS conreality.object CASCADE;

CREATE TABLE conreality.object (
  -- The object's unique identifier.
  uuid        uuid NOT NULL PRIMARY KEY,

  -- The object's type.
  type        conreality.object_type NULL,

  -- The theater that the object is located in.
  theater     uuid NULL REFERENCES conreality.theater ON DELETE SET NULL,

  -- The group, if any, that the object belongs to.
  "group"     uuid NULL REFERENCES conreality.group ON DELETE SET NULL,

  -- The object's designated label.
  label       varchar(31) NULL CHECK (label <> ''),

  -- The object's current orientation (in radians relative to north).
  orientation real NULL,

  -- The object's estimated mass (in kilograms).
  mass        real NULL,

  -- The object's determined radius (in meters).
  radius      real NULL,

  -- The object's estimated color (as a 24-bit RGB value).
  color       int4 NULL
);
