CREATE TABLE zamówienia (
  zamówienia_id SERIAL NOT NULL PRIMARY KEY,
  klient_id INT,
  zamówienie_data DATE
);