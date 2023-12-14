-- тригер , який при вставці нового рядка в таблицю taster записує taster_name у нижньому регістрі

DROP TRIGGER IF EXISTS taster_insert ON taster;

CREATE OR REPLACE FUNCTION correct_taster_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE taster SET taster_name = LOWER(taster_name)
	WHERE taster.taster_name = NEW.taster_name;
    RETURN NULL;
END;
$$;

CREATE TRIGGER taster_insert
AFTER INSERT ON taster
FOR EACH ROW EXECUTE FUNCTION correct_taster_insert();

INSERT INTO taster (taster_id, taster_name, taster_twitter_handle) 
VALUES (6, 'MARCO ROB', '@marcorob');

select * from taster;
