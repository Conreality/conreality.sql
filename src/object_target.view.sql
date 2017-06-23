DROP VIEW IF EXISTS conreality.object_target RESTRICT;

CREATE VIEW conreality.object_target AS
  SELECT * FROM conreality.target INNER JOIN conreality.object USING (uuid);
