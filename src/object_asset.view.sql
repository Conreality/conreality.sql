DROP VIEW IF EXISTS conreality.object_asset RESTRICT;

CREATE VIEW conreality.object_asset AS
  SELECT * FROM conreality.asset INNER JOIN conreality.object USING (uuid);
