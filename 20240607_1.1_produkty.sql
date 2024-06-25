CREATE TABLE produkty (
  produkt_id SERIAL NOT NULL PRIMARY KEY,
  produkt_nazwa VARCHAR(255),
  kategoria_id INT,
  opakowania VARCHAR(255),
  cena DECIMAL(10, 2)
);