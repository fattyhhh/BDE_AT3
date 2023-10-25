
  
    

  create  table "postgres"."public_warehouse"."dim_room__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."public_staging"."room_stg"
  );
  