DROP TABLE IF EXISTS conreality.unit CASCADE;

CREATE TABLE conreality.unit (
  -- The unit's sequential identifier (ID).
  id bigint NOT NULL PRIMARY KEY REFERENCES conreality.group ON DELETE CASCADE
);
