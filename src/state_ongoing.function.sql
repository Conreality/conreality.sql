CREATE OR REPLACE FUNCTION conreality.state_ongoing() RETURNS boolean AS $$
DECLARE
  state conreality.state_action;
  result boolean;
BEGIN
  SELECT action FROM conreality.state ORDER BY timestamp DESC LIMIT 1 INTO state;
  CASE state
    WHEN 'begin', 'resume' THEN result := true;
    ELSE result := false;
  END CASE;
  RETURN result;
END;
$$ LANGUAGE plpgsql;
