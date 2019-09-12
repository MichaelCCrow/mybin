ALTER TABLE records CHANGE COLUMN ome_status ome_status VARCHAR(20) AFTER id;
ALTER TABLE records CHANGE COLUMN filename filename VARCHAR(255) AFTER id;
ALTER TABLE records CHANGE COLUMN record_id record_id VARCHAR(10) AFTER id;