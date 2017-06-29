DROP VIEW IF EXISTS conreality.asset_object RESTRICT;

CREATE VIEW conreality.asset_object AS
  SELECT * FROM conreality.asset INNER JOIN conreality.object USING (uuid);
