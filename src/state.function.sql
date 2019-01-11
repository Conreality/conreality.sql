DROP FUNCTION IF EXISTS conreality.state() RESTRICT;

CREATE FUNCTION conreality.state() RETURNS text AS $$
DECLARE
  state conreality.state_action;
BEGIN
  SELECT action FROM conreality.state ORDER BY timestamp DESC LIMIT 1 INTO state;
  RETURN state;
END;
$$ LANGUAGE plpgsql;
