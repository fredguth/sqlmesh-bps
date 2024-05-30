SELECT c.database_name, c.schema_name, c.table_name, v.comment as table_description, c.column_name, c.comment as column_description, c.data_type
  FROM duckdb_views v
  JOIN duckdb_columns c
  ON v.view_oid = c.table_oid
  AND v.schema_oid = c.schema_oid
  WHERE v.schema_name NOT LIKE '%__dev';