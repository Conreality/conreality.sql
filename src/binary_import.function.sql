DROP FUNCTION IF EXISTS conreality.binary_import(oid) RESTRICT;

CREATE FUNCTION conreality.binary_import(binary_oid oid) RETURNS bigint AS $$
DECLARE
  binary_data bytea;
  binary_sha256 bytea;
  binary_mime text := 'application/octet-stream';
BEGIN
  SELECT lo_get(binary_oid) INTO STRICT binary_data;
  SELECT digest(binary_data, 'sha256'::text) INTO STRICT binary_sha256;
  INSERT INTO conreality.binary
    (sha256, type, data)
    VALUES (binary_sha256, binary_mime::conreality.binary_type, binary_data)
    RETURNING id;
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;
