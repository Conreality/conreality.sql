DROP TYPE IF EXISTS conreality.state_action RESTRICT;

CREATE TYPE conreality.state_action AS ENUM (
  'begin',
  'pause',
  'resume',
  'end'
);
