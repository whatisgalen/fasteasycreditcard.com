BEGIN;

ALTER TABLE credit_cards_
   ADD COLUMN row_modified_ TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT clock_timestamp();

ALTER TABLE users_
   ADD COLUMN row_modified_ TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT clock_timestamp();


ALTER TABLE credit_cards_
   ADD COLUMN row_created_ TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT clock_timestamp();

ALTER TABLE users_
   ADD COLUMN row_created_ TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT clock_timestamp();


CREATE OR REPLACE FUNCTION update_row_modified_function_()
RETURNS TRIGGER 
AS 
$$
BEGIN
    -- ASSUMES the table has a column named exactly "row_modified_".
    -- Fetch date-time of actual current moment from clock, rather than start of statement or start of transaction.
    NEW.row_modified_ = clock_timestamp(); 
    RETURN NEW;
END;
$$ 
language 'plpgsql';

CREATE TRIGGER row_mod_on_credit_cards_trigger_
BEFORE UPDATE
ON credit_cards_ 
FOR EACH ROW 
EXECUTE PROCEDURE update_row_modified_function_();

CREATE TRIGGER row_mod_on_users_trigger_
BEFORE UPDATE
ON users_ 
FOR EACH ROW 
EXECUTE PROCEDURE update_row_modified_function_();

COMMIT;