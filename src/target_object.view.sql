DROP VIEW IF EXISTS conreality.target_object RESTRICT;

CREATE VIEW conreality.target_object AS
  SELECT * FROM conreality.target INNER JOIN conreality.object USING (uuid);
