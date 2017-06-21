DROP VIEW IF EXISTS conreality.object_asset RESTRICT;

CREATE VIEW conreality.object_asset AS
  SELECT * FROM conreality.asset INNER JOIN conreality.object USING (uuid);

DROP VIEW IF EXISTS conreality.object_camera RESTRICT;

CREATE VIEW conreality.object_camera AS
  SELECT * FROM conreality.camera INNER JOIN conreality.object USING (uuid);

DROP VIEW IF EXISTS conreality.object_player RESTRICT;

CREATE VIEW conreality.object_player AS
  SELECT * FROM conreality.player INNER JOIN conreality.object USING (uuid);

DROP VIEW IF EXISTS conreality.object_target RESTRICT;

CREATE VIEW conreality.object_target AS
  SELECT * FROM conreality.target INNER JOIN conreality.object USING (uuid);
