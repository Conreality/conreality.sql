CREATE OR REPLACE FUNCTION conreality.state_check() RETURNS trigger AS $$
DECLARE
  old_state conreality.state_action;
  new_state conreality.state_action;
BEGIN
  SELECT NEW.action INTO new_state;
  SELECT action FROM conreality.state ORDER BY timestamp DESC LIMIT 1 INTO old_state;
  CASE old_state
    WHEN 'begin' THEN
      IF new_state <> 'pause' AND new_state <> 'end' THEN
        RAISE EXCEPTION 'invalid state transition: % => %', old_state, new_state;
      END IF;
    WHEN 'pause' THEN
      IF new_state <> 'resume' AND new_state <> 'end' THEN
        RAISE EXCEPTION 'invalid state transition: % => %', old_state, new_state;
      END IF;
    WHEN 'resume' THEN
      IF new_state <> 'pause' AND new_state <> 'end' THEN
        RAISE EXCEPTION 'invalid state transition: % => %', old_state, new_state;
      END IF;
    WHEN 'end' THEN
      RAISE EXCEPTION 'invalid state transition: % => %', old_state, new_state;
    ELSE -- IS NULL
      IF new_state <> 'begin' THEN
        RAISE EXCEPTION 'invalid state transition: % => %', old_state, new_state;
      END IF;
  END CASE;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
