-- created dim_category
create table analytics_schema.dim_category as 
select
id as category_id,
initcap(trim(category_name)) as category_name,
current_timestamp as loaded_at
from 
raw_schema.category;
