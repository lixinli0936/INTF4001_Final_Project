DO $$
BEGIN
    	-- Constraints on Complaint
	IF EXISTS
		(SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE TABLE_NAME = 'complaint'
				AND CONSTRAINT_NAME = 'fkcomplaint137471' ) THEN
		ALTER TABLE complaint DROP CONSTRAINT fkcomplaint137471;
		RAISE NOTICE 'fkcomplaint137471 was dropped';
	END IF;

CREATE TABLE vehicle (
  accident_index     int4 NOT NULL, 
  accident_year      int4 NOT NULL, 
  vehicle_reference  int4 NOT NULL, 
  vehicle_type       int4 NOT NULL, 
  sex_of_driver      int4 NOT NULL, 
  age_of_driver      int4 NOT NULL, 
  age_band_of_driver int4 NOT NULL, 
  age_of_vehicle     int4 NOT NULL);
CREATE TABLE casualty (
  accident_index       int4 NOT NULL, 
  accident_year        int4 NOT NULL, 
  vehicle_reference    int4 NOT NULL, 
  casualty_reference   int4 NOT NULL, 
  casualty_class       int4 NOT NULL, 
  sex_of_casualty      int4 NOT NULL, 
  age_of_casualty      int4 NOT NULL, 
  age_band_of_casualty int4 NOT NULL, 
  casualty_severity    int4 NOT NULL);
CREATE TABLE accident (
  accident_index       SERIAL NOT NULL, 
  accident_year        int4 NOT NULL, 
  longitude            float4 NOT NULL, 
  latitude             float4 NOT NULL, 
  accident_severity    int4 NOT NULL, 
  number_of_vehicles   int4 NOT NULL, 
  number_of_casualties int4 NOT NULL, 
  "date"               date NOT NULL, 
  time                 time NOT NULL, 
  road_type            int4 NOT NULL, 
  weather_conditions   int4 NOT NULL, 
  PRIMARY KEY (accident_index));
CREATE TABLE accident_severity (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE age_band_of_casualty (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE age_band_of_driver (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE casualty_class (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE casualty_severity (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE road_type (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE sex_of_casualty (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE sex_of_driver (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE vehicle_type (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE weather_conditions (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL, 
  PRIMARY KEY (id));

ALTER TABLE casualties ADD CONSTRAINT FKcasualty104238 FOREIGN KEY (accident_index) REFERENCES collisions (accident_index);
ALTER TABLE casualties ADD CONSTRAINT FKcasualties375410 FOREIGN KEY (age_band_of_casualty) REFERENCES age_band_of_casualty (id);
ALTER TABLE casualties ADD CONSTRAINT FKcasualties651712 FOREIGN KEY (sex_of_casualty) REFERENCES sex_of_casualty (id);
ALTER TABLE casualties ADD CONSTRAINT FKcasualties83648 FOREIGN KEY (casualty_severity) REFERENCES casualty_severity (id);
ALTER TABLE casualties ADD CONSTRAINT FKcasualties445613 FOREIGN KEY (casualty_class) REFERENCES casualty_class (id);

ALTER TABLE collision ADD CONSTRAINT FKcollision321648 FOREIGN KEY (accident_severity) REFERENCES accident_severity (id);
ALTER TABLE collision ADD CONSTRAINT FKcollision700225 FOREIGN KEY (weather_conditions) REFERENCES weather_conditions (id);
ALTER TABLE collision ADD CONSTRAINT FKcollision248902 FOREIGN KEY (road_type) REFERENCES road_type (id);

ALTER TABLE accident ADD CONSTRAINT FKvehicle311809 FOREIGN KEY (vehicle_type) REFERENCES vehicle_type (id);
ALTER TABLE accident ADD CONSTRAINT FKvehicle725298 FOREIGN KEY (accident_index) REFERENCES collisions (accident_index);
ALTER TABLE accident ADD CONSTRAINT FKvehicle545307 FOREIGN KEY (sex_of_driver) REFERENCES sex_of_driver (id);
ALTER TABLE accident ADD CONSTRAINT FKvehicle352733 FOREIGN KEY (age_band_of_driver) REFERENCES age_band_of_driver (id);



