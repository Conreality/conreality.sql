DROP FUNCTION IF EXISTS conreality.player_deregister(uuid) RESTRICT;

CREATE FUNCTION conreality.player_deregister(player_uuid uuid) RETURNS void AS $$
BEGIN
  DELETE FROM conreality.player p WHERE p.uuid = player_uuid;
  DELETE FROM conreality.object o WHERE o.uuid = player_uuid;
  -- Permissions for the "pllua" schema:
  EXECUTE format('REVOKE SELECT ON TABLE %I.%I FROM %I', 'pllua', 'init', player_uuid);
  EXECUTE format('REVOKE USAGE ON SCHEMA %I FROM %I', 'pllua', player_uuid);
  -- Permissions for the "public" schema:
  EXECUTE format('REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA %I FROM %I', 'public', player_uuid);
  EXECUTE format('REVOKE USAGE ON SCHEMA %I FROM %I', 'public', player_uuid);
  -- Permissions for the "conreality" schema:
  EXECUTE format('REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA %I FROM %I', 'conreality', player_uuid);
  EXECUTE format('REVOKE USAGE, SELECT ON ALL SEQUENCES IN SCHEMA %I FROM %I', 'conreality', player_uuid);
  EXECUTE format('REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %I FROM %I', 'conreality', player_uuid);
  EXECUTE format('REVOKE USAGE ON SCHEMA %I FROM %I', 'conreality', player_uuid);
  -- Permissions for the database itself:
  EXECUTE format('REVOKE CONNECT ON DATABASE %I FROM %I', current_database(), player_uuid);
  EXECUTE format('DROP USER %I', player_uuid);
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;
