DROP FUNCTION IF EXISTS conreality.message_send(text) RESTRICT;
DROP FUNCTION IF EXISTS conreality.message_send(text, text) RESTRICT;

CREATE FUNCTION conreality.message_send(message_text text) RETURNS bigint AS $$
DECLARE
  message_id bigint;
BEGIN
  SELECT conreality.message_send(session_user, message_text) INTO STRICT message_id;
  RETURN message_id;
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION conreality.message_send(message_sender text,
                                        message_text text) RETURNS bigint AS $$
  local query  = "INSERT INTO conreality.message (sender, text) VALUES ($1::uuid, $2) RETURNING id";
  local insert = server.prepare(query, {"text", "text"});
  local result = insert:execute({message_sender, message_text}, false, 1);
  local message_id = result[1].id -- an int64
  server.execute("NOTIFY message, '" .. tostring(message_id) .. "'", false);
  return message_id;
$$ LANGUAGE pllua VOLATILE PARALLEL UNSAFE;
