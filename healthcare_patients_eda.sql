select *
from `healthcare_patients`.patients;


-- check how many rows in the dataset
select count(*) as total_patients
from patients;

-- determine average age
select round(avg(age), 2) as avg_age
from patients;

-- check average bmi and heart rate of patients for each exercise level
select exercise_level,
round(avg(bmi), 2) as avg_bmi,
round(avg(heart_rate), 2) as avg_heart_rate,
count(*) as patient_count
from patients
group by exercise_level
order by avg_bmi desc;
# Most patients perform light exercise with 34,979 patients. This explains why the average bmi being the highest amongst all exercise levels
 
 
 -- categorize each patient as underweight, healthy, overweight, or obese depending on their bmi
select 
case 
	when bmi < 18.5 then "Underweight"
    when bmi < 25 then "Healthy"
    when bmi < 30 then "Overweight"
    else "Obese"
end as bmi_category,
count(*) as patient_count,
round(avg(heart_rate), 2) as avg_heart_rate
from patients
group by bmi_category;
# Most patients are categorized as obese with 32,683 patients along with an average heart rate of 72.16 bpm


-- compare high risk patient count vs overall dataset averages for bmi and heart rate
select sex, count(*) as high_risk_patients,
(select round(avg(bmi), 2) 
from patients) as avg_bmi,
(select round(avg(heart_rate), 2) from patients) as avg_heart_rate
from patients
where alcohol_use = 'heavy'
and exercise_level = 'sedentary'
and smoking_status = 'current'
group by sex;


-- analyze blood pressure
select 
case 
	when diastolic_bp < 80 and systolic_bp < 120 then "Healthy"
    when diastolic_bp < 80 and systolic_bp < 129 then "Elevated"
    when diastolic_bp < 89 and systolic_bp < 139 then "Stage 1 Hypertension"
    when diastolic_bp >= 90 and systolic_bp >= 140 then "Stage 2 Hypertension"
    when systolic_bp > 180 and diastolic_bp > 120 then "Hypertension Crisis"
end as blood_pressure_check,
count(*) as patient_count,
round(avg(bmi), 2) as avg_bmi
from patients
group by blood_pressure_check;


-- group the patients in an age bracket
select
case 
	when age < 30 then "Under 30"
    when age < 45 then "30 - 44"
    when age < 60 then "45 - 59"
    when age < 80 then "60 - 79"
    else "80+"
end as age_group,
count(*) as patient_count,
round(avg(bmi), 2) as avg_bmi,
round(avg(heart_rate), 2) as avg_heart_rate
from patients
group by age_group
order by age_group asc;




-- compare each patients bmi with the average and compare the difference 
select patient_id, sex, bmi,
round(avg(bmi) over (partition by exercise_level), 2) as avg_bmi,
round(bmi - avg(bmi) over (partition by exercise_level), 2) as diff_from_avg
from patients;
	


-- overall lifestyle risk summary
select exercise_level, alcohol_use, smoking_status,
count(*) as patient_count,
round(avg(bmi), 2) as avg_bmi,
round(avg(heart_rate), 2) as avg_heart_rate
from patients
group by exercise_level, smoking_status, alcohol_use
order by patient_count desc;





