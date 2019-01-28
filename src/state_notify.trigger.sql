DROP TRIGGER IF EXISTS state_notify ON conreality.state;

CREATE TRIGGER state_notify
  AFTER INSERT ON conreality.state
  FOR EACH ROW
  EXECUTE FUNCTION conreality.state_notify();
