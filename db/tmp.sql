


----create new user, uuid from front-end, insert user and its map to contract-group


with t_new_user as (
insert into public.user (uuid, name_key, content) 
          values ($1, $2, $3)
          on conflict (uuid)
          do update set name_key=$2, content=$3
      returning uuid
),
t_new_rel as (
  insert into public.rel_user_contractgroup (user_uuid, contractgroup_uuid)
    select * from jsonb_to_recordset($4) as x
    (user_uuid uuid, group_uuid uuid )
    on conflict (user_uuid, contractgroup_uuid) do nothing
    returning user_uuid
)
select * from t_new_user
  union all
select * from t_new_user
;



with t_new_user as (
insert into public.user (uuid, name_key, content) 
          values ('d062e8dd-df42-4820-a709-4cb9ea1c546e', 'ttt', '{"head":{"nameCode":"ttt","password":"123","firstName":"ert","lastName":"ewrt","email":"dfg","phone":"23","role":"310afc3e-0030-4fe2-b60d-ee12ad5c7929"}}')
          on conflict (uuid)
          do update set name_key='ttt', content='{"head":{"nameCode":"ttt","password":"123","firstName":"ert","lastName":"ewrt","email":"dfg","phone":"23","role":"310afc3e-0030-4fe2-b60d-ee12ad5c7929"}}'
      returning uuid
),
t_new_rel as (
  insert into public.rel_user_contractgroup (user_uuid, contractgroup_uuid)
    select * from jsonb_to_recordset('
    [ { "user_uuid": "edbf9a09-64a6-4427-bc9f-304a2893fcab",
      "group_uuid": "9ed11346-a831-4fcc-8fba-9ae302b2fc9e" },
    { "user_uuid": "edbf9a09-64a6-4427-bc9f-304a2893fcab",
      "group_uuid": "4f28156c-8956-478a-a1a8-3efe56b2fdd6" },
    { "user_uuid": "edbf9a09-64a6-4427-bc9f-304a2893fcab",
      "group_uuid": "3b706eb3-8d98-48cb-853e-b6201244375e" } ]') as x
    (user_uuid uuid, group_uuid uuid )
    on conflict (user_uuid, contractgroup_uuid) do nothing
    returning user_uuid
)
select * from t_new_user
  union all
select * from t_new_user
;
