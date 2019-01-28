DROP TRIGGER IF EXISTS message_notify ON conreality.message;

CREATE TRIGGER message_notify
  AFTER INSERT ON conreality.message
  FOR EACH ROW
  EXECUTE FUNCTION conreality.message_notify();
