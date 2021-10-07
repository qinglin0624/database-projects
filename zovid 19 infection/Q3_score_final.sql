alter table project1.census add column score double;

with all_exam as
((select id_Number, vital_cap, metabolism, exam_date
from project1.positive_physical_exam natural join project1.positive_cases) 
union
(select * from project1.patients_physical_exam))

update project1.census as c, 
(select id_Number, vital_cap, metabolism, exam_date, 
row_number() over (partition by id_number order by exam_date desc) as rn from all_exam) as b
set score = 25 * (b.vital_cap/5200 + b.metabolism/2800 + 1-abs(c.age-25)/75 + 1 - abs(c.bmi-23)/30)
where b.rn=1 and c.id_Number=b.id_Number;

with average as (select avg(score) from project1.census)
update project1.census set score=(select * from average) where score is null;

select * from  project1.census;
