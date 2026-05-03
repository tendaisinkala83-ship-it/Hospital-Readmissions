create database Hospital_Readmissions;
use Hospital_Readmissions;

select *
from synthetic_hospital_readmissions;

create table SHR_Staging
like synthetic_hospital_readmissions;

insert into SHR_Staging
select *
from synthetic_hospital_readmissions;

select *
from SHR_Staging;

create table Patients as 
select distinct
	patient_id,
    age_group,
    sex,
    race,
    payer
from SHR_Staging;

alter table Patients
add primary key (patient_id);

select *
from Patients;

create table Admissions as
select 
	ROW_NUMBER() over (order by admission_date) as admission_id,
    patient_id,
    admission_date,
    discharge_date,
    length_of_stay,
    readmitted_30d,
    CASE
		when dayofweek(discharge_date) in (1,7)
        then 'weekend'
        else 'weekday'
	end as discharge_day_type
from SHR_Staging;

alter table Admissions 
add primary key (admission_id),
add index (patient_id);

select *
from Admissions;


create table Diagnoses as
select
	a.admission_id,
    s.diagnosis_group
from SHR_Staging s
join admissions a
	on s.patient_id = a.patient_id
    and s.admission_date = a.admission_date;
    
    alter table Diagnoses
    add index (admission_id);
    
    select *
    from Diagnoses;
    
    
    select 
		round(avg(readmitted_30d) * 100, 2) as Readmission_rate_pct
	from Admissions;
    
    select
		d.diagnosis_group,
        count(*) as total_admissions,
        sum(a.readmitted_30d) as readmissions,
        round(avg(readmitted_30d) * 100, 2) as readmission_rate_pct
	from Admissions a
    join Diagnoses d
		on a.admission_id = d.admission_id
	group by d.diagnosis_group
    order by readmission_rate_pct desc;
    
    select
    case
		when length_of_stay <= 3 then 'short (<3 days)'
        when length_of_stay between 4 and 7 then 'medium (4-7 days)'
        else 'long (8+ days)'
	end as los_bucket,
    count(*) as total_readmissions,
    round(avg(readmitted_30d) * 100,2) as readmission_rate_pct
    from Admissions
    group by los_bucket
    order by readmission_rate_pct desc;
    
    select
		discharge_day_type,
        count(*) as total_discharges,
        round(avg(readmitted_30d) * 100, 2) as readmission_rate_pct
        from admissions
        group by discharge_day_type;
        
        select
			p.age_group,
            count(*) as total_admissions,
            round(avg(a.readmitted_30d) * 100, 2) as readmission_rate_pct
            from Admissions a
            join Patients p
				on a.patient_id= p.patient_id
                group by p.age_group
                order by readmission_rate_pct desc;
                
	select 
    p.payer,
    count(*) as total_admissions,
    round(avg(a.readmitted_30d) * 100, 2) as readmission_rate_pct
    from Admissions a
    join Patients p
		on a.patient_id = p.patient_id
        group by p.payer
        order by readmission_rate_pct desc;
        
	select
		p.age_group,
        d.diagnosis_group,
        a.discharge_day_type,
        count(*) as total_admissions,
        round(avg(readmitted_30d) * 100,2) as readmission_rate_pct
	from Admissions a
    join Patients p 
		on a.patient_id= p.patient_id
	join Diagnoses d 
		on a.admission_id= d.admission_id
	group by
		p.age_group,
        d.diagnosis_group,
        a.discharge_day_type
	having count(*) >= 25
    order by readmission_rate_pct desc;
    
    
    select 
		count(*) as total_admissions,
        sum(readmitted_30d) as total_readmissions,
        round(avg(readmitted_30d) * 100, 2) as readmission_rate_pct,
        round(avg(length_of_stay), 1) as avg_length_of_stay
	from Admissions;
    
    
    select * from Admissions;
    select * from Diagnoses;
    select * from Patients;
    select * from synthetic_hospital_readmissions;
    

    