DROP FUNCTION IF EXISTS conreality.session_start() RESTRICT;

CREATE FUNCTION conreality.session_start() RETURNS void AS $$
  UPDATE conreality.player
    SET ip_addr = inet_client_addr()
    WHERE uuid = session_user::uuid;
  SELECT pg_notify('session.start', session_user);
$$ LANGUAGE sql VOLATILE PARALLEL UNSAFE;
