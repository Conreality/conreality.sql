DROP VIEW IF EXISTS conreality.player_object RESTRICT;

CREATE VIEW conreality.player_object AS
  SELECT * FROM conreality.player INNER JOIN conreality.object USING (uuid);
