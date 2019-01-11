DROP TABLE IF EXISTS conreality.group CASCADE;

-- A group of objects (e.g., a unit or a swarm).
CREATE TABLE conreality.group (
  -- The group's sequential identifier (ID).
  id    bigint NOT NULL PRIMARY KEY REFERENCES conreality.entity ON DELETE CASCADE,
  -- The group's designated label.
  label varchar(31) NULL CHECK (label <> '') UNIQUE
);
