DROP VIEW IF EXISTS conreality.object_camera RESTRICT;

CREATE VIEW conreality.object_camera AS
  SELECT * FROM conreality.camera INNER JOIN conreality.object USING (uuid);
