alter table project1.census add column bmi double;
with bmi_info as 
(select weight_kg/(height_cm/100*height_cm/100) as bmi, id_Number from project1.patient_info)
update project1.census set bmi = 
(select bmi from bmi_info where project1.census.id_Number=bmi_info.id_Number);
select * from project1.census;