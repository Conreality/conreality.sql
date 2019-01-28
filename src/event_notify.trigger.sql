DROP TRIGGER IF EXISTS event_notify ON conreality.event;

CREATE TRIGGER event_notify
  AFTER INSERT ON conreality.event
  FOR EACH ROW
  EXECUTE FUNCTION conreality.event_notify();
