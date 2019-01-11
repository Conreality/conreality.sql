DROP TABLE IF EXISTS conreality.target RESTRICT;

CREATE TABLE conreality.target (
  -- The target's sequential identifier (ID).
  id bigint NOT NULL PRIMARY KEY REFERENCES conreality.object ON DELETE CASCADE
);
