DROP TRIGGER IF EXISTS player_status_notify ON conreality.player_status;

CREATE TRIGGER player_status_notify
  AFTER INSERT ON conreality.player_status
  FOR EACH ROW
  EXECUTE FUNCTION conreality.player_status_notify();
