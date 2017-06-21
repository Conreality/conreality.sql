DROP TABLE IF EXISTS conreality.group CASCADE;

CREATE TABLE conreality.group (
  -- The group's unique identifier.
  uuid        uuid NOT NULL PRIMARY KEY,
  -- The group's designated label.
  label       varchar(31) NULL CHECK (label <> '')
);
