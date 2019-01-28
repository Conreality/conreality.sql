DROP TRIGGER IF EXISTS state_check ON conreality.state;

CREATE TRIGGER state_check
  BEFORE INSERT ON conreality.state
  FOR EACH ROW
  EXECUTE FUNCTION conreality.state_check();
