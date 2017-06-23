DROP FUNCTION IF EXISTS conreality.session_terminate() RESTRICT;

CREATE FUNCTION conreality.session_terminate() RETURNS void AS $$
  UPDATE conreality.player
    SET ip_addr = NULL
    WHERE uuid = session_user::uuid;
  SELECT pg_notify('session.terminate', session_user);
$$ LANGUAGE sql VOLATILE PARALLEL UNSAFE;
