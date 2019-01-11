DROP TABLE IF EXISTS conreality.state CASCADE;

CREATE TABLE conreality.state (
  -- The state timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now() PRIMARY KEY,
  -- The state transition.
  action conreality.state_action NOT NULL
);
