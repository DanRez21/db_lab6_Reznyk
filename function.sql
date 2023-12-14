-- Функція, яка повертає інформацію про дегустаторів в кожній країні
DROP FUNCTION IF EXISTS get_taster_by_country(char);

CREATE OR REPLACE FUNCTION get_taster_by_country (in_country CHAR(20))
	RETURNS TABLE (taster_name CHAR(20), taster_twitter_handle CHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.taster_name, t.taster_twitter_handle
    FROM taster t
    JOIN evaluation e ON e.taster_id = t.taster_id
    JOIN wine w ON w.eva_id = e.eva_id
    JOIN location_ l ON l.wine_id = w.wine_id
    WHERE l.country = in_country;
END;
$$;

SELECT *
FROM get_taster_by_country('US');