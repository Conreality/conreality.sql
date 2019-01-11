DROP TABLE IF EXISTS conreality.player RESTRICT;

CREATE TABLE conreality.player (
  -- The player's sequential identifier (ID).
  id       bigint NOT NULL PRIMARY KEY REFERENCES conreality.object ON DELETE CASCADE,
  -- The player's nickname.
  nick     varchar(31) NOT NULL CHECK (nick <> '') UNIQUE,
  -- The player's full name.
  name     varchar(63) NULL CHECK (name <> ''),
  -- The player's military rank.
  rank     varchar(63) NULL CHECK (rank <> ''),
  -- The player's IPv4/IPv6 address.
  ip_addr  inet NULL CHECK ((family(ip_addr) = 4 AND masklen(ip_addr) = 32) OR (family(ip_addr) = 6 AND masklen(ip_addr) = 128)),
  -- The player's avatar image.
  avatar   bigint NULL REFERENCES conreality.binary ON DELETE SET NULL,
  -- The player's primary language (ISO 639-1 code).
  language varchar(5) NULL CHECK (length(language) = 2 OR length(language) = 5)
);
