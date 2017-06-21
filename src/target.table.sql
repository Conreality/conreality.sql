DROP TABLE IF EXISTS conreality.target RESTRICT;

CREATE TABLE conreality.target (
  -- The target's unique identifier.
  uuid uuid NOT NULL PRIMARY KEY REFERENCES conreality.object ON DELETE CASCADE
);
