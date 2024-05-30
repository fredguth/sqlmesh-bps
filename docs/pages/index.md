
```sql schemas
select distinct schema_name as schema, '/'|| schema as schema_url from metadata
```


<DataTable data={schemas} link = schema_url/>

