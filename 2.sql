CREATE OR REPLACE FUNCTION hello() RETURNS TEXT AS $$
DECLARE
    current_hour INTEGER;
BEGIN
    current_hour := EXTRACT(HOUR FROM NOW()); -- Получение текущего часа

    IF current_hour >= 6 AND current_hour < 12 THEN
        RETURN 'Доброе утро';
    ELSIF current_hour >= 12 AND current_hour < 18 THEN
        RETURN 'Добрый день';
    ELSIF current_hour >= 18 AND current_hour < 24 THEN
        RETURN 'Добрый вечер';
    ELSE
        RETURN 'Доброй ночи';
    END IF;
END;
$$ LANGUAGE plpgsql;
