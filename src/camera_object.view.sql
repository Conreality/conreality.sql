DROP VIEW IF EXISTS conreality.camera_object RESTRICT;

CREATE VIEW conreality.camera_object AS
  SELECT * FROM conreality.camera INNER JOIN conreality.object USING (uuid);
