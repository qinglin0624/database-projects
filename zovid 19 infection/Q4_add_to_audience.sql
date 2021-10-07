alter table project1.audiences drop column score;
alter table project1.audiences drop column test_result;
alter table project1.audiences add column test_result text;
alter table project1.audiences add column score double;

update project1.audiences 
set test_result = 
(select result from project1.zovid12test 
where project1.audiences.id_Number=project1.zovid12test.id_Number);

update project1.audiences 
set score = 
(select score from project1.census 
where project1.audiences.id_Number=project1.census.id_Number);

select * from project1.audiences;