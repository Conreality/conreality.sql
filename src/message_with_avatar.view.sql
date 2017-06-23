DROP VIEW IF EXISTS conreality.message_with_avatar RESTRICT;

CREATE VIEW conreality.message_with_avatar AS
  SELECT m.*, p.avatar FROM conreality.message m INNER JOIN conreality.player p ON m.sender = p.uuid;
