CREATE OR REPLACE FUNCTION conreality.message_notify() RETURNS trigger AS $$
BEGIN
  PERFORM pg_notify(TG_TABLE_NAME, NEW.id::text);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
