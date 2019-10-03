CREATE TABLE file_history
(
    id INT NOT NULL AUTO_INCREMENT,
    record_id VARCHAR(10) NOT NULL,
    previous_status VARCHAR(30),
    current_status VARCHAR(30),
    previous_name VARCHAR(300),
    current_name VARCHAR(300),
    USER VARCHAR(60) DEFAULT 'unknown' NOT NULL,
    DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
COMMENT='A table containing file status and name change information.';

CREATE TRIGGER tr_upd_file_history
BEFORE UPDATE ON 
    records
    FOR EACH ROW 
    INSERT INTO file_history (record_id, previous_status, current_status, previous_name, current_name, user)
    VALUES(NEW.record_id, OLD.ome_status, NEW.ome_status, OLD.filename, NEW.filename, NEW.updated_by);


CREATE TRIGGER tr_ins_file_history
AFTER INSERT ON 
    records
    FOR EACH ROW 
    INSERT INTO file_history (record_id, current_status, current_name, user)
    VALUES(NEW.record_id, NEW.ome_status, NEW.filename, NEW.updated_by);
    
    
