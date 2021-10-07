alter table project1.census add column age int(3);
update project1.census set age = 2020- SUBSTRING(project1.census.id_Number,6,4);
select * from project1.census;