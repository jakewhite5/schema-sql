
DROP TABLE IF EXISTS user CASCADE;
DROP TABLE IF EXISTS resteraunt CASCADE;
DROP TABLE IF EXISTS food CASCADE;
DROP TABLE IF EXISTS app CASCADE;
DROP TABLE IF EXISTS driver CASCADE;

CREATE TABLE "user" (
    "id" int   NOT NULL,
    "name_first" varchar(50)   NOT NULL,
    "name_last" varchar(50)   NOT NULL,
    "address" varchar(50)   NOT NULL,
    CONSTRAINT "pk_user" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "resteraunt" (
    "id" int   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "address" varchar(50)   NOT NULL,
    "food_id" int   NOT NULL,
    CONSTRAINT "pk_resteraunt" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "food" (
    "id" int   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "price" int   NOT NULL,
    CONSTRAINT "pk_food" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "app" (
    "id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "resteraunt_id" int   NOT NULL,
    "driver_id" int   NOT NULL,
    CONSTRAINT "pk_app" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "driver" (
    "id" int   NOT NULL,
    "location" varchar(50)   NOT NULL,
    CONSTRAINT "pk_driver" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "user" ADD CONSTRAINT "fk_user_id" FOREIGN KEY("id")
REFERENCES "app" ("user_id");

ALTER TABLE "resteraunt" ADD CONSTRAINT "fk_resteraunt_id" FOREIGN KEY("id")
REFERENCES "app" ("resteraunt_id");

ALTER TABLE "food" ADD CONSTRAINT "fk_food_id" FOREIGN KEY("id")
REFERENCES "resteraunt" ("food_id");

ALTER TABLE "driver" ADD CONSTRAINT "fk_driver_id" FOREIGN KEY("id")
REFERENCES "app" ("driver_id");

