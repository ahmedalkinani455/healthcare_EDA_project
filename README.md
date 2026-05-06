# Healthcare Patient EDA - MySQL

This is an exploratory data analysis project on a dataset of 50,000+ patients using MySQL.
The goal was to discover patterns in lifestyle habits, BMI, heart rate, and blood pressure across different patient groups.

## Dataset 
- Source: https://www.kaggle.com/datasets/sauryayan/synthetic-healthcare-records-and-financial-outcomes?select=patients.csv (used patients.csv)
- Size: 50,000+ rows
- Key columns: age, sex, bmi, heart_rate, systolic_bp, diastolic_bp, alcohol_use, smoking_status, and exercise_level

## Questions Explored
- How does BMI an heart rate vary across exercise levels?
- What is the BMI distribution across clinical categories (Underweight, Healthy, Overweight, Obese)?
- How many high risk patients are there and how do their metrics compare to the overall dataset? (High risk patient -> sedentary exercise level, heavy use of alcohol and currently smoking)
- How are patients distributed across blood pressure stages?
- How do BMI and heart rate change across age groups?
- How does each patient's BMI compare to the average for their exercise level?

## Key Findings
- Most patients peform light exercise (34, 979 patients), which corresponds to the highest average BMI among all exercise levels
- The majority of patients are classified as obese (32,683 patients) with an average heart rate of 72.16 bpm
- Stage 2 Hypertension is most common in patients who are 80 and above (28, 043 pateints)
- There are more patients who are considered healthy in the 45-59 age group than those who are under 30
- High risk patients (sedentary + heavy alcohol + current smoker) have a higher average BMI than the overall dataset average
- Blood pressure risk increases with age — the 60+ groups show significantly higher rates of Stage 1 and Stage 2 Hypertension

## SQL Concepts Used
- Aggregate Functions (COUNT, AVG, ROUND)
- GROUP BY and ORDER BY
- CASE statements for custom categorization
- Subqueries in SELECT for dataset-wide comparisons
- Window functions (AVG OVER, PARTITION BY) for per-group comparisons

## Files
- `healthcare_eda.sql` - all queries with inline comments and findings
