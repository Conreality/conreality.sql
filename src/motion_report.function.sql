DROP FUNCTION IF EXISTS conreality.motion_report(geometry, real) RESTRICT;
DROP FUNCTION IF EXISTS conreality.motion_report(geography, real) RESTRICT;

CREATE FUNCTION conreality.motion_report("position" geometry, accuracy real) RETURNS geography AS $$
DECLARE
  reporter_uuid    uuid      := session_user::uuid;             --
  theater_location geography;                                   -- GPS longitude/latitude of origin
  theater_origin   geometry  := conreality.point_3d(0, 0, 0);   -- 3D origin
  distance         float;                                       -- length of hypotenuse, in meters
  azimuth          float;                                       -- angle from origin, in radians
  location         geography;                                   -- GPS longitude/latitude
BEGIN
  SELECT t.location FROM conreality.theater t
    INNER JOIN conreality.object o ON t.uuid = o.theater
    WHERE o.uuid = reporter_uuid
    INTO theater_location;
  SELECT ST_Distance(theater_origin, position) INTO distance;
  SELECT ST_Azimuth(theater_origin, position) INTO azimuth;
  SELECT ST_Project(theater_location, distance, azimuth) INTO location;
  INSERT INTO conreality.object_motion
    (uuid, type, location, position, position_accuracy)
    VALUES (reporter_uuid, 'reported', location, position, accuracy);
  RETURN location;
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION conreality.motion_report(location geography, accuracy real) RETURNS geometry AS $$
DECLARE
  reporter_uuid    uuid      := session_user::uuid;             --
  theater_location geography;                                   -- GPS longitude/latitude of origin
  theater_origin   geometry  := conreality.point_3d(0, 0, 0);   -- 3D origin
  distance         float;                                       -- length of hypotenuse, in meters
  azimuth          float;                                       -- angle from origin, in radians
  position_x       float;                                       -- X displacement from origin, in meters
  position_y       float;                                       -- Y displacement from origin, in meters
  position_z       float     := 0;                              -- Z displacement from origin, in meters
  "position"       geometry;                                    -- 3D
BEGIN
  SELECT t.location FROM conreality.theater t
    INNER JOIN conreality.object o ON t.uuid = o.theater
    WHERE o.uuid = reporter_uuid
    INTO theater_location;
  SELECT ST_DistanceSphere(theater_location::geometry, location::geometry) INTO distance;
  SELECT ST_Azimuth(theater_location, location) INTO azimuth;
  SELECT round((sin(azimuth) * distance)::numeric, 3)::float INTO position_x;
  SELECT round((cos(azimuth) * distance)::numeric, 3)::float INTO position_y;
  SELECT conreality.point_3d(position_x, position_y, position_z) INTO position;
  INSERT INTO conreality.object_motion
    (uuid, type, location, position, position_accuracy)
    VALUES (reporter_uuid, 'reported', location, position, accuracy);
  RETURN position;
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;
