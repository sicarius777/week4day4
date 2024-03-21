CREATE TABLE "service" (
  "service_ticket" SERIAL,
  "history" VARCHAR(100),
  "service_date" TIMESTAMP,
  "staff_id" INTEGER,
  "customer_id" INTEGER,
  PRIMARY KEY ("service_ticket")
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "customer_id" INTEGER,
  "staff_id" INTEGER,
  PRIMARY KEY ("invoice_id")
);



CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "dealership_id" INTEGER,
  PRIMARY KEY ("customer_id")
);


CREATE TABLE "dealership" (
  "dealership_id" SERIAL,
  "dealer_type" VARCHAR,
  "dealer_name" VARCHAR,
  "dealer_address" VARCHAR,
  PRIMARY KEY ("dealership_id")
);


CREATE TABLE "inventory" (
  "inventory_id" SERIAL,
  "new_cars" VARCHAR,
  "used_cars" VARCHAR,
  "dealership_id" INTEGER,
  PRIMARY KEY ("inventory_id")
);

CREATE TABLE "staff" (
  "staff_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "dealership_id" INT,
  PRIMARY KEY ("staff_id")
);


INSERT INTO "service" ("history", "service_date", "staff_id", "customer_id")
VALUES ('Regular maintenance', '2024-03-16 10:00:00', 1, 1),
       ('Oil change', '2024-03-15 14:30:00', 2, 2);


INSERT INTO "invoice" ("customer_id", "staff_id")
VALUES (1, 1),
       (2, 2);


INSERT INTO "customer" ("first_name", "last_name", "dealership_id")
VALUES ('John', 'Doe', 1),
       ('Jane', 'Smith', 2);


INSERT INTO "dealership" ("dealer_type", "dealer_name", "dealer_address")
VALUES ('Car', 'ABC Motors', '123 Main St'),
       ('Truck', 'XYZ Auto', '456 Elm St');


INSERT INTO "inventory" ("new_cars", "used_cars", "dealership_id")
VALUES ('Toyota Camry', 'Honda Accord', 1),
       ('Ford F-150', 'Chevrolet Silverado', 2);


INSERT INTO "staff" ("first_name", "last_name", "dealership_id")
VALUES ('Mike', 'Johnson', 1),
       ('Sarah', 'Williams', 2);
       
      
      
      
ALTER TABLE "service" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");
ALTER TABLE "service" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");
ALTER TABLE "invoice" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");

ALTER TABLE "customer" ADD FOREIGN KEY ("dealership_id") REFERENCES "dealership" ("dealership_id");

ALTER TABLE "inventory" ADD FOREIGN KEY ("dealership_id") REFERENCES "dealership" ("dealership_id");

ALTER TABLE "staff" ADD FOREIGN KEY ("dealership_id") REFERENCES "dealership" ("dealership_id");
