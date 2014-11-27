--find the working directory - used to ensure I placed the csv file in the correct directory
--SHOW data_directory;

COPY (SELECT * 
FROM chiparks
INNER JOIN parkclass ON parkclass."parkclass_number" = chiparks."parkclass_number"
INNER JOIN wards ON wards."ward_number" = chiparks."ward_number"
INNER JOIN zips ON zips."zip_number" = chiparks."zip_number") TO  'C:/Program Files/PostgreSQL/9.3/data/pg_output13.csv' WITH CSV header;