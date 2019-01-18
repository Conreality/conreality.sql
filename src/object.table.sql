DROP TABLE IF EXISTS conreality.object CASCADE;

-- A corporeal entity, aka object.
CREATE TABLE conreality.object (
  -- The object's sequential identifier (ID).
  id          bigint NOT NULL PRIMARY KEY REFERENCES conreality.entity ON DELETE CASCADE,
  -- The theater that the object is located in.
  --theater     bigint NULL REFERENCES conreality.theater ON DELETE SET NULL,
  -- The group, if any, that the object belongs to.
  --"group"     bigint NULL REFERENCES conreality.group ON DELETE SET NULL,
  -- The object's current orientation (in radians relative to north).
  orientation real NULL CHECK (orientation >= 0),
  -- The object's estimated mass (in kilograms).
  mass        real NULL CHECK (mass > 0),
  -- The object's determined radius (in meters).
  radius      real NULL CHECK (radius > 0),
  -- The object's estimated color (as a 24-bit RGB value).
  color       int4 NULL
);
