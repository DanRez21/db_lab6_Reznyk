-- Процедура, яка додає в таблицю taster новий рядок з аргументами
DROP PROCEDURE IF EXISTS add_taster(taster);

CREATE OR REPLACE PROCEDURE add_taster(in_taster_id INT, in_taster_name CHAR(20), in_taster_twitter_handle CHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM taster WHERE taster_id = in_taster_id OR taster_name = in_taster_name) THEN
        RAISE EXCEPTION 'This taster exist';
    ELSE
        INSERT INTO taster (taster_id, taster_name, taster_twitter_handle) VALUES (in_taster_id, in_taster_name, in_taster_twitter_handle);
        RAISE NOTICE 'Completed!';
    END IF;
END;
$$;

CALL add_taster(6, 'Jane Smith', '@jamesmith');
SELECT * FROM taster;
