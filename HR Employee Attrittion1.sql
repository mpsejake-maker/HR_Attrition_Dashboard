-- Databricks notebook source
Select *
From hr_employee_attrition.default.ibm_hr_employee_attrition;
 

SELECT 
    COUNT(*) AS Total_Headcount
FROM hr_employee_attrition.default.ibm_hr_employee_attrition;


SELECT 
    Department,
    COUNT(*) AS Headcount
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Department
ORDER BY Department;


Select Gender, COUNT (*) AS TOTAL
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Gender;


SELECT 
    Department,
    Gender,
    COUNT(*) AS Total
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Department, Gender
ORDER BY Department;



SELECT 
    Department,
    COUNT(*) AS Total
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Department
ORDER BY Department;




SELECT 
    Department,
    COUNT(*) AS Attrition_Count
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Department;



SELECT 
    Age,
    COUNT(*) AS Attrition_Count
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Age
ORDER BY Age;




SELECT 
    Department,
    COUNT(CASE WHEN Attrition = 'No' THEN 1 END) AS Retained_Employees,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition = 'No' THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS Retention_Rate
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Department
ORDER BY Department;



SELECT 
    Gender,
    COUNT(CASE WHEN Attrition = 'No' THEN 1 END) AS Retained_Employees,
    COUNT(*) AS Total_Employees,
    ROUND( COUNT(CASE WHEN Attrition = 'No' THEN 1 END) * 100.0 / COUNT(*), 
        2 ) AS Retention_Rate
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Gender
ORDER BY Gender;


SELECT 
    ROUND(AVG(CASE WHEN Gender = 'Male' THEN MonthlyIncome END), 2) AS Avg_Male_Salary,
    ROUND(AVG(CASE WHEN Gender = 'Female' THEN MonthlyIncome END), 2) AS Avg_Female_Salary,
    ROUND( AVG(CASE WHEN Gender = 'Male' THEN MonthlyIncome END) -
        AVG(CASE WHEN Gender = 'Female' THEN MonthlyIncome END), 
        2) AS Pay_Gap
FROM hr_employee_attrition.default.ibm_hr_employee_attrition;



SELECT 
    Gender,
    EducationField,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Gender, EducationField
ORDER BY Gender, EducationField;


SELECT 
    YearsAtCompany,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

SELECT
    YearsAtCompany,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(*) AS Total_Employees,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 1.0 / COUNT(*)) * 100, 
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;


SELECT 
    JobRole,
    COUNT(*) AS Attrition_Count
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY JobRole;


SELECT 
    Gender,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY Gender
ORDER BY Gender;



SELECT 
    MaritalStatus,
    ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction
FROM hr_employee_attrition.default.ibm_hr_employee_attrition
GROUP BY MaritalStatus
ORDER BY MaritalStatus;
