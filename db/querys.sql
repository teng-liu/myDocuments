





with t_role as (
	select r.uuid as role_uuid,
		jsonb_build_object('uuid', r.uuid, 'display', r.content#>>'{head, display}') as role
	from public.user u
	inner join public.role r
		on u.content#>>'{head, role}' = r.uuid::text
	group by r.uuid
)
select u.*, r.role
	from public.user u
	inner join t_role r
		on u.content#>>'{head, role}' = r.role_uuid::text
	where u.name_key = 'admin';






select w.*, 
	array_agg(a.name_key) as possible_action 
from workflow w      
	inner join workflow_action a 
		on a.from_state=w.current_state
	group by w.uuid, w.name_key, w.current_state, w.template_uuid, w.contract_uuid, w.description, w.options;


select row_to_json(t)
from (
  select text, pronunciation,
    (
      select array_to_json(array_agg(row_to_json(d)))
      from (
        select part_of_speech, body
        from definitions
        where word_id=words.id
        order by position asc
      ) d
    ) as definitions
  from words
  where text = 'autumn'
) t




-- query filtered contract list based on vendor (username)
select c.uuid, c.name_key, c.content
    from public.contract c
inner join public.user u
    on u.content#>'{head, vendorName}' = c.content#>'{body, partB-company}'
where u.name_key = 'delta';




update workflow set template_uuid = '1bfbbd70-f8c6-45fe-807d-61117c7be173' where workflow.name_key='aaaa';

select t.content#>'{head, title}' as template
    from workflow w 
inner join contract_template t where w.template_uuid = t.uuid 

---v3.0---query all workflow with possible_actions as an array
select w.*, 
	array_agg(a.name_key) as possible_action 
from workflow w      
	inner join workflow_action a 
		on a.from_state=w.current_state
	group by w.uuid, w.name_key, w.current_state, w.template_uuid, w.contract_uuid, w.description, w.options;



--v2.0---query all the workflow with its possible_actions
select w.name_key as workflow, 
    w.current_state as current_state, 
    a.name_key as possible_action 
from workflow w      
    inner join workflow_action a on a.from_state=w.current_state;




--v1.0-find possible actions => given a workflow id (and its current_state)
select w.name_key as workflow, 
        w.current_state as current_state, 
        a.name_key as possible_action 
    from workflow w
    inner join workflow_action a on a.from_state=w.current_state
    where w.name_key = 'workflow001';




with t_workflow as (
    select w.name_key as workflow,
            w.current_state as current_state,
            a.name_key as action,
            a.to_state as new_state
        from workflow w
        inner join workflow_action a
            on a.from_state=w.current_state
        where a.name_key='level4Approve'
    )
update workflow set current_state=t_workflow.new_state 
	from t_workflow 
	where workflow.name_key='workflow001'; 




with t1 as (
	select name_key, content#>'{head, state}' as state, content#>'{head, possible-actions}' as actions
		from public.process 
		where name_key = 'prj-test-NO.1'
	),
	t2 as (
	select name_key, jsonb_array_elements_text(actions) as action_name
		from t1
	)
	select x.name_key, x.action_name, y.content#>'{head, relations, 0, to}'
		from t2 x
			inner join process_action y
				on y.name_key = x.action_name;