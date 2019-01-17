DROP TABLE IF EXISTS conreality.entity CASCADE;

-- An abstract entity.
CREATE TABLE conreality.entity (
  -- The entity's sequential identifier (ID).
  id   bigserial NOT NULL PRIMARY KEY,
  -- The entity's universally unique identifier (UUID).
  uuid uuid NOT NULL DEFAULT gen_random_uuid() UNIQUE,
  -- The entity's type.
  type conreality.entity_type NOT NULL,
  -- The entity's name.
  name varchar(63) NULL CHECK (name <> '') UNIQUE
);
