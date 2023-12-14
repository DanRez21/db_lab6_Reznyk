-- Перевірка роботи функції
SELECT * FROM get_taster_by_country('Spain');

-- Перевірка роботи процедури та тригера одночасно(додавання дегустатора з маленької літери)
--CALL add_taster(6, 'MARCO ROB', '@marcorob');
SELECT * FROM taster;

--перевірка окремо тригера
INSERT INTO taster(taster_id, taster_name, taster_twitter_handle) 
VALUES (7, 'Julian Han', '@JH');

SELECT * FROM taster;