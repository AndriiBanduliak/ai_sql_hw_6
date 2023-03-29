-- Создание таблицы users_old
CREATE TABLE users_old (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

-- Создание процедуры для перемещения пользователя
CREATE OR REPLACE PROCEDURE move_user_to_old_table(user_id INTEGER) AS $$
BEGIN
    -- Начало транзакции
    BEGIN
        -- Удаление пользователя из таблицы users и вставка его в таблицу users_old
        DELETE FROM users WHERE id = user_id RETURNING * INTO users_old;
        -- Фиксация изменений
        COMMIT;
    EXCEPTION WHEN OTHERS THEN
        -- Откат изменений при возникновении ошибки
        ROLLBACK;
        RAISE;
    END;
END;
$$ LANGUAGE plpgsql;
