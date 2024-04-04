DO $$
BEGIN	
	-- accident_severity
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'accident_severity' ) THEN 

		DROP TABLE accident_severity CASCADE;
		RAISE NOTICE 'Table accident_severity was dropped';
	END IF;
	
	CREATE TABLE accident_severity (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table accident_severity was created';

	-- road_type
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'road_type' ) THEN 

		DROP TABLE road_type CASCADE;
		RAISE NOTICE 'Table road_type was dropped';
	END IF;
	
	CREATE TABLE road_type (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table road_type was created';

	-- weather_conditions
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'weather_conditions' ) THEN 

		DROP TABLE weather_conditions CASCADE;
		RAISE NOTICE 'Table weather_conditions was dropped';
	END IF;
	
	CREATE TABLE weather_conditions (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table weather_conditions was created';
	
	-- accident
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'accident' ) THEN 

		DROP TABLE accident CASCADE;
		RAISE NOTICE 'Table accident was dropped';
	END IF;
	
	CREATE TABLE accident (
	  accident_index       char(13) NOT NULL, 
	  accident_year        int4 NOT NULL, 
	  longitude            float4, 
	  latitude             float4, 
	  accident_severity    int4 NOT NULL, 
	  number_of_vehicles   int4 NOT NULL, 
	  number_of_casualties int4 NOT NULL, 
	  "date"               date NOT NULL, 
	  time                 time NOT NULL, 
	  road_type            int4 NOT NULL, 
	  weather_conditions   int4 NOT NULL, 
	  PRIMARY KEY (accident_index));
	RAISE NOTICE 'Table accident was created';
	
	ALTER TABLE accident ADD CONSTRAINT FKaccident321648 FOREIGN KEY (accident_severity) REFERENCES accident_severity (id);
	ALTER TABLE accident ADD CONSTRAINT FKaccident700225 FOREIGN KEY (weather_conditions) REFERENCES weather_conditions (id);
	ALTER TABLE accident ADD CONSTRAINT FKaccident248902 FOREIGN KEY (road_type) REFERENCES road_type (id);
	RAISE NOTICE 'The Constraints of accident were created';

	-- vehicle_type
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'vehicle_type' ) THEN 

		DROP TABLE vehicle_type CASCADE;
		RAISE NOTICE 'Table vehicle_type was dropped';
	END IF;
	
	CREATE TABLE vehicle_type (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table vehicle_type was created';

	-- sex_of_driver
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'sex_of_driver' ) THEN 

		DROP TABLE sex_of_driver CASCADE;
		RAISE NOTICE 'Table sex_of_driver was dropped';
	END IF;
	
	CREATE TABLE sex_of_driver (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table sex_of_driver was created';

	-- age_band_of_driver
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'age_band_of_driver' ) THEN 

		DROP TABLE age_band_of_driver CASCADE;
		RAISE NOTICE 'Table age_band_of_driver was dropped';
	END IF;
	
	CREATE TABLE age_band_of_driver (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table age_band_of_driver was created';

	-- vehicle
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'vehicle' ) THEN 

		DROP TABLE vehicle CASCADE;
		RAISE NOTICE 'Table vehicle was dropped';
	END IF;
	
	CREATE TABLE vehicle (
	  accident_index     char(13) NOT NULL, 
	  accident_year      int4 NOT NULL, 
	  vehicle_reference  int4 NOT NULL, 
	  vehicle_type       int4 NOT NULL, 
	  sex_of_driver      int4 NOT NULL, 
	  age_of_driver      int4 NOT NULL, 
	  age_band_of_driver int4 NOT NULL, 
	  age_of_vehicle     int4 NOT NULL);
	RAISE NOTICE 'Table vehicle was created';
	
	ALTER TABLE vehicle ADD CONSTRAINT FKvehicle311809 FOREIGN KEY (vehicle_type) REFERENCES vehicle_type (id);
	ALTER TABLE vehicle ADD CONSTRAINT FKvehicle725298 FOREIGN KEY (accident_index) REFERENCES accident (accident_index);
	ALTER TABLE vehicle ADD CONSTRAINT FKvehicle545307 FOREIGN KEY (sex_of_driver) REFERENCES sex_of_driver (id);
	ALTER TABLE vehicle ADD CONSTRAINT FKvehicle352733 FOREIGN KEY (age_band_of_driver) REFERENCES age_band_of_driver (id);
	RAISE NOTICE 'The Constraints of vehicle were created';
	
	-- age_band_of_casualty
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'age_band_of_casualty' ) THEN 

		DROP TABLE age_band_of_casualty CASCADE;
		RAISE NOTICE 'Table age_band_of_casualty was dropped';
	END IF;
	
	CREATE TABLE age_band_of_casualty (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table age_band_of_casualty was created';
	
	-- casualty_class
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'casualty_class' ) THEN 

		DROP TABLE casualty_class CASCADE;
		RAISE NOTICE 'Table casualty_class was dropped';
	END IF;
	
	CREATE TABLE casualty_class (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table casualty_class was created';
	
	-- casualty_severity
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'casualty_severity' ) THEN 

		DROP TABLE casualty_severity CASCADE;
		RAISE NOTICE 'Table casualty_severity was dropped';
	END IF;
	
	CREATE TABLE casualty_severity (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table casualty_severity was created';
	
	-- sex_of_casualty
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'sex_of_casualty' ) THEN 

		DROP TABLE sex_of_casualty CASCADE;
		RAISE NOTICE 'Table sex_of_casualty was dropped';
	END IF;
	
	CREATE TABLE sex_of_casualty (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table sex_of_casualty was created';
	
	-- age_band_of_casualty
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'age_band_of_casualty' ) THEN 

		DROP TABLE age_band_of_casualty CASCADE;
		RAISE NOTICE 'Table age_band_of_casualty was dropped';
	END IF;
	
	CREATE TABLE age_band_of_casualty (
	  id   SERIAL NOT NULL, 
	  name varchar(50) NOT NULL, 
	  PRIMARY KEY (id));
	RAISE NOTICE 'Table age_band_of_casualty was created';

	-- casualty
	IF EXISTS
		(SELECT 1
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = 'casualty' ) THEN 

		DROP TABLE casualty CASCADE;
		RAISE NOTICE 'Table casualty was dropped';
	END IF;
	
	CREATE TABLE casualty (
	  accident_index       char(13) NOT NULL, 
	  accident_year        int4 NOT NULL, 
	  vehicle_reference    int4 NOT NULL, 
	  casualty_reference   int4 NOT NULL, 
	  casualty_class       int4 NOT NULL, 
	  sex_of_casualty      int4 NOT NULL, 
	  age_of_casualty      int4 NOT NULL, 
	  age_band_of_casualty int4 NOT NULL, 
	  casualty_severity    int4 NOT NULL);
	RAISE NOTICE 'Table casualty was created';
	
	ALTER TABLE casualty ADD CONSTRAINT FKcasualty104238 FOREIGN KEY (accident_index) REFERENCES accident (accident_index);
	ALTER TABLE casualty ADD CONSTRAINT FKcasualty375410 FOREIGN KEY (age_band_of_casualty) REFERENCES age_band_of_casualty (id);
	ALTER TABLE casualty ADD CONSTRAINT FKcasualty651712 FOREIGN KEY (sex_of_casualty) REFERENCES sex_of_casualty (id);
	ALTER TABLE casualty ADD CONSTRAINT FKcasualty83648 FOREIGN KEY (casualty_severity) REFERENCES casualty_severity (id);
	ALTER TABLE casualty ADD CONSTRAINT FKcasualty445613 FOREIGN KEY (casualty_class) REFERENCES casualty_class (id);
	RAISE NOTICE 'The Constraints of casualty were created';
 
END $$;







