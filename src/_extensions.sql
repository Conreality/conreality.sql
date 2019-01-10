-- Enable pgcrypto
-- See: https://www.postgresql.org/docs/current/static/pgcrypto.html
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Enable PostGIS (includes raster)
-- See: https://postgis.net
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
--CREATE EXTENSION IF NOT EXISTS postgis_sfcgal;

-- Enable PL/Lua
-- See: https://github.com/pllua/pllua
--CREATE EXTENSION IF NOT EXISTS pllua;
