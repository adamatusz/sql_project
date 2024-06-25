CREATE TABLE zamówienia_szczegóły (
  zamówienia_szczegóły_id SERIAL NOT NULL PRIMARY KEY,
  zamówienia_id INT,
  produkt_id INT,
  ilość INT
);