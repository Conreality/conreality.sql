DROP TABLE IF EXISTS conreality.state CASCADE;

CREATE TABLE conreality.state (
  -- The state timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now() PRIMARY KEY,
  -- The state transition.
  action conreality.state_action NOT NULL
);

DROP TRIGGER IF EXISTS state_check ON conreality.state;

CREATE TRIGGER state_check
  BEFORE INSERT ON conreality.state
  FOR EACH ROW
  EXECUTE FUNCTION conreality.state_check();
