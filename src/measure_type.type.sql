DROP TYPE IF EXISTS conreality.measure_type CASCADE;

CREATE TYPE conreality.measure_type AS ENUM (
  'measured', -- directly measured in real-time
  'observed', -- visually observed in real-time
  'predicted' -- computationally estimated from past data
);
