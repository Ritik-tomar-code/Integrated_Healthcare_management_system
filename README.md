# Integrated_Healthcare_management_system

Integrated Healthcare Management System

Project Overview
----------------
Integrated Healthcare Management System is a comprehensive SQL project designed to simulate the real-world operations of a hospital. It focuses on data organization, efficiency, and accessibility using relational database systems.

Hospitals interact with numerous patients and staff daily, involving complex tasks such as scheduling doctors, diagnosing patients, maintaining medical records, and managing various departments. This system simplifies these tasks by storing, retrieving, and managing all information through SQL queries and database relationships.

Database Structure
------------------
This SQL project uses the MySQL RDBMS and includes the following 7 tables:

1. Physician – Stores details of doctors, including their ID, name, and position.
2. Affiliated_With – Records which physicians are affiliated with which departments.
3. Department – Contains information about hospital departments and their heads.
4. Nurse – Stores information about nurses, including registration and position.
5. Patient – Contains all patient-related information including demographics.
6. Patient_Diagnosis – Stores patient diagnosis and prescriptions.
7. Procedures – Records medical procedures along with their cost.

Technologies Used
-----------------
- Database: MySQL
- Language: SQL (Structured Query Language)

SQL Queries
-----------
Below are key SQL queries written for the project to retrieve, manipulate, and analyze data from the healthcare database:

Basic SQL Queries
-----------------
1. Get Physician names in alphabetical order:
   SELECT NAME AS PHYSICIAN_NAME FROM PHYSICIAN ORDER BY NAME;

2. Full name of male patients:
   SELECT CONCAT(NAME,' ',SURNAME) AS Patients_Fullname, GENDER FROM PATIENT WHERE GENDER = 'MALE';

3. Registered nurses who are head of department:
   SELECT * FROM NURSE WHERE POSITION = 'Head Nurse' AND REGISTERED = 'YES';

4. Nurses who are Team Leaders or not registered:
   SELECT NAME, POSITION, REGISTERED FROM NURSE WHERE POSITION = 'Team Leader' OR REGISTERED = 'NO';

5. Average cost of all medical procedures:
   SELECT AVG(COST) AS Average_cost FROM PROCEDURES;

6. Procedures costing more than 2000:
   SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST > 2000;

Update and Alter Table Queries
------------------------------
7. Update name of patient (ID = 5) to Kamal:
   UPDATE PATIENT SET NAME = 'Kamal', SURNAME = '' WHERE PATIENT_ID = 5;

8. Drop phone column from PATIENT table:
   ALTER TABLE PATIENT DROP COLUMN PHONE;

Aggregate Functions and Ranking
-------------------------------
9. Second maximum procedure cost:
   SELECT NAME, MAX(COST) AS Procedure_cost FROM PROCEDURES GROUP BY NAME ORDER BY Procedure_cost DESC LIMIT 1 OFFSET 1;

LIKE Operator Usage
-------------------
10. Patients whose names start with 'A':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE 'A%';

11. Patients whose third letter is 'M':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE '__M%';

12. Patients whose name starts with 'J' and ends with 'Z':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE 'J%Z';

Range and Pagination
--------------------
13. Get patients with ID from 11 to 20:
    SELECT * FROM PATIENT LIMIT 10 OFFSET 10;

Join Queries
------------
14. Physicians who are head of departments:
    SELECT p.NAME AS Doctor_name, d.DEPT_NAME FROM PHYSICIAN p INNER JOIN DEPARTMENT d ON p.EMPLOYEEID = d.HEAD;

15. Patients and their primary check physician:
    SELECT CONCAT(p.NAME,' ',p.SURNAME) AS PATIENT_NAME, ph.NAME AS PHY_WHO_DID_PRI_TREATMENT FROM PATIENT p LEFT JOIN PHYSICIAN ph ON p.PRIMARY_CHECK = ph.EMPLOYEEID;

16. Physicians and their affiliated departments (primary only):
    SELECT p.NAME AS Physician_Name, d.DEPT_NAME AS Department_Name FROM PHYSICIAN p INNER JOIN AFFILIATED_WITH aw ON p.EMPLOYEEID = aw.PHYSICIANID INNER JOIN DEPARTMENT d ON aw.DEPARTMENTID = d.DEPARTMENT_ID WHERE aw.PRIMARYAFFILIATION = 't';

17. Physician, position, and department they are affiliated with:
    SELECT p.NAME AS Physician_Name, p.POSITION AS Physician_Position, d.DEPT_NAME AS Department_Name FROM PHYSICIAN p JOIN AFFILIATED_WITH a ON p.EMPLOYEEID = a.PHYSICIANID JOIN DEPARTMENT d ON a.DEPARTMENTID = d.DEPARTMENT_ID;

18. Patient treatment details with physician and diagnosis:
    SELECT PH.EMPLOYEEID, PH.NAME AS Physician_Name, PH.POSITION AS Designation, P.PATIENT_ID, CONCAT(P.NAME,' ',P.SURNAME) AS Patient_Treated, P.GENDER, PD.DIAGNOSIS, PD.PRESCRIPTION FROM PATIENT_DIAGNOSIS PD LEFT JOIN PHYSICIAN PH ON PD.PHYSICIAN_ID = PH.EMPLOYEEID LEFT JOIN PATIENT P ON P.PATIENT_ID = PD.PATIENT_ID;

Subqueries
----------
19. Maximum procedure cost:
    SELECT NAME, COST FROM PROCEDURES WHERE COST = (SELECT MAX(COST) FROM PROCEDURES);

20. Patient diagnosed with chronic pain:
    SELECT * FROM PATIENT WHERE PATIENT_ID IN (SELECT PATIENT_ID FROM PATIENT_DIAGNOSIS WHERE DIAGNOSIS = 'Chronic Pain');

21. Procedures costing more than average:
    SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST > (SELECT AVG(COST) FROM PROCEDURES);

22. Procedures costing less than average:
    SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST < (SELECT AVG(COST) FROM PROCEDURES);

23. Physicians who are Head Chief or Senior:
    SELECT * FROM PHYSICIAN WHERE POSITION IN (SELECT POSITION FROM PHYSICIAN WHERE POSITION LIKE '%Senior%' OR POSITION LIKE '%Head Chief%');

24. Physicians without primary affiliation:
    SELECT * FROM PHYSICIAN WHERE EMPLOYEEID IN (SELECT PHYSICIANID FROM AFFILIATED_WITH WHERE PRIMARYAFFILIATION = 'f');


