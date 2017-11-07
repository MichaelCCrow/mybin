-- SELECT flder, ometag, fname 
-- FROM(
-- 	SELECT (
-- 		id as ometag, 
-- 		split_str(file_location, '/', 1) AS m, 
-- 		split_str(file_location, '/', 2) AS flder, 
-- 		split_str(file_location, '/', 3) AS fname 
-- 	) 
-- 	FROM files 
-- 	WHERE (
-- 		file_status = "approved" 
-- 		OR file_status = "finalapproved" 
-- 		OR file_status = "submit"
-- 	)
-- ) AS t1;


UPDATE files SET file_location = REPLACE(file_location, 'metadata/approved', 'metadata/accepted') WHERE file_status = "approved";
UPDATE files SET file_status = REPLACE(file_status, 'approved', 'accepted') WHERE file_status = "approved";

UPDATE files SET file_location = REPLACE(file_location, 'metadata/submit', 'metadata/submitted') WHERE file_status = "submit";
UPDATE files SET file_status = REPLACE(file_status, 'submit', 'submitted') WHERE file_status = "submit";

UPDATE files SET file_location = REPLACE(file_location, 'metadata/final_approved', 'metadata/approved') WHERE file_status = "finalapproved";
UPDATE files SET file_status = REPLACE(file_status, 'finalapproved', 'approved') WHERE file_status = "finalapproved";




 -- UPDATE files  SET file_location = REPLACE(file_location, 'metadata/approved', 'users/') WHERE file_status = "draft";