DROP VIEW IF EXISTS conreality.object_player RESTRICT;

CREATE VIEW conreality.object_player AS
  SELECT * FROM conreality.player INNER JOIN conreality.object USING (uuid);
