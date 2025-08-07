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
<img width="251" height="77" alt="Screenshot 2025-08-07 151834" src="https://github.com/user-attachments/assets/d5001d76-20cd-43d7-a733-a2248cc6b84c" />

2. Full name of male patients:
   SELECT CONCAT(NAME,' ',SURNAME) AS Patients_Fullname, GENDER FROM PATIENT WHERE GENDER = 'MALE';
<img width="451" height="79" alt="Screenshot 2025-08-07 152014" src="https://github.com/user-attachments/assets/76478f8d-90f7-4d86-8681-39b4734520ab" />

3. Registered nurses who are head of department:
   SELECT * FROM NURSE WHERE POSITION = 'Head Nurse' AND REGISTERED = 'YES';
<img width="390" height="62" alt="Screenshot 2025-08-07 152222" src="https://github.com/user-attachments/assets/02184a58-1058-4f94-9f42-b417f02e8459" />

4. Nurses who are Team Leaders or not registered:
   SELECT NAME, POSITION, REGISTERED FROM NURSE WHERE POSITION = 'Team Leader' OR REGISTERED = 'NO';
<img width="365" height="95" alt="Screenshot 2025-08-07 152230" src="https://github.com/user-attachments/assets/f2838862-0b0b-4eef-b77f-6158c970b9f4" />

5. Average cost of all medical procedures:
   SELECT AVG(COST) AS Average_cost FROM PROCEDURES;
<img width="160" height="68" alt="Screenshot 2025-08-07 152237" src="https://github.com/user-attachments/assets/cebbdb24-7a28-430d-82a2-7871f15deb86" />

6. Procedures costing more than 2000:
   SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST > 2000;
<img width="386" height="90" alt="Screenshot 2025-08-07 152245" src="https://github.com/user-attachments/assets/a20392c7-be76-496b-a3fc-110f55bfa6c6" />

Update and Alter Table Queries
------------------------------
7. Update name of patient (ID = 5) to :
   UPDATE PATIENT SET NAME = 'Robbert ', SURNAME = 'Fernandez' WHERE PATIENT_ID = 5;
<img width="295" height="130" alt="Screenshot 2025-08-07 152252" src="https://github.com/user-attachments/assets/03573679-dc6e-49ad-ba36-334963c28345" />

8. Drop phone column from PATIENT table:
   ALTER TABLE PATIENT DROP COLUMN PHONE;
<img width="196" height="104" alt="Screenshot 2025-08-07 152258" src="https://github.com/user-attachments/assets/bcd5a640-1333-4a95-b0af-c845aad3bb37" />

Aggregate Functions and Ranking
-------------------------------
9. Second maximum procedure cost:
   SELECT NAME, MAX(COST) AS Procedure_cost FROM PROCEDURES GROUP BY NAME ORDER BY Procedure_cost DESC LIMIT 1 OFFSET 1;
<img width="294" height="145" alt="Screenshot 2025-08-07 152306" src="https://github.com/user-attachments/assets/da54eddd-b54c-4e64-a193-05fab5ff26ff" />

LIKE Operator Usage
-------------------
10. Patients whose names start with 'A':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE 'A%';
<img width="416" height="94" alt="Screenshot 2025-08-07 152314" src="https://github.com/user-attachments/assets/f4b4706a-6c1c-4d6b-ae22-0e0302eb1579" />

11. Patients whose third letter is 'M':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE '__M%';
<img width="418" height="95" alt="Screenshot 2025-08-07 152320" src="https://github.com/user-attachments/assets/9052d360-fe97-4b15-93e3-7ca9bc503d6d" />

12. Patients whose name starts with 'J' and ends with 'Z':
    SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE 'J%Z';
<img width="418" height="85" alt="Screenshot 2025-08-07 152327" src="https://github.com/user-attachments/assets/6c4204e4-2445-4533-9a7a-b376e61864e8" />

Range and Pagination
--------------------
13. Get patients with ID from 11 to 20:
    SELECT * FROM PATIENT LIMIT 10 OFFSET 10;
<img width="116" height="95" alt="Screenshot 2025-08-07 152333" src="https://github.com/user-attachments/assets/e408ce22-1afe-4885-9cab-937759eab76f" />

Join Queries
------------
14. Physicians who are head of departments:
    SELECT p.NAME AS Doctor_name, d.DEPT_NAME FROM PHYSICIAN p INNER JOIN DEPARTMENT d ON p.EMPLOYEEID = d.HEAD;
<img width="324" height="122" alt="Screenshot 2025-08-07 152341" src="https://github.com/user-attachments/assets/e11760c3-f5dd-4521-bad3-b90c4c6537cc" />

15. Patients and their primary check physician:
    SELECT CONCAT(p.NAME,' ',p.SURNAME) AS PATIENT_NAME, ph.NAME AS PHY_WHO_DID_PRI_TREATMENT FROM PATIENT p LEFT JOIN PHYSICIAN ph ON p.PRIMARY_CHECK = ph.EMPLOYEEID;
<img width="456" height="139" alt="Screenshot 2025-08-07 152350" src="https://github.com/user-attachments/assets/91b538e1-7476-45e2-85bc-17e63b99e702" />

16. Physicians and their affiliated departments (primary only):
    SELECT p.NAME AS Physician_Name, d.DEPT_NAME AS Department_Name FROM PHYSICIAN p INNER JOIN AFFILIATED_WITH aw ON p.EMPLOYEEID = aw.PHYSICIANID INNER JOIN DEPARTMENT d ON aw.DEPARTMENTID = d.DEPARTMENT_ID WHERE aw.PRIMARYAFFILIATION = 't';
<img width="468" height="184" alt="Screenshot 2025-08-07 152402" src="https://github.com/user-attachments/assets/8217d631-bd49-4b68-a449-33dafde38634" />

17. Physician, position, and department they are affiliated with:
    SELECT p.NAME AS Physician_Name, p.POSITION AS Physician_Position, d.DEPT_NAME AS Department_Name FROM PHYSICIAN p JOIN AFFILIATED_WITH a ON p.EMPLOYEEID = a.PHYSICIANID JOIN DEPARTMENT d ON a.DEPARTMENTID = d.DEPARTMENT_ID;
<img width="506" height="183" alt="Screenshot 2025-08-07 152410" src="https://github.com/user-attachments/assets/79ded444-9cea-4b89-bcf7-bb3c38de8956" />

18. Patient treatment details with physician and diagnosis:
    SELECT PH.EMPLOYEEID, PH.NAME AS Physician_Name, PH.POSITION AS Designation, P.PATIENT_ID, CONCAT(P.NAME,' ',P.SURNAME) AS Patient_Treated, P.GENDER, PD.DIAGNOSIS, PD.PRESCRIPTION FROM PATIENT_DIAGNOSIS PD LEFT JOIN PHYSICIAN PH ON PD.PHYSICIAN_ID = PH.EMPLOYEEID LEFT JOIN PATIENT P ON P.PATIENT_ID = PD.PATIENT_ID;
<img width="509" height="212" alt="Screenshot 2025-08-07 152419" src="https://github.com/user-attachments/assets/0e373d3f-7837-43d9-8988-09b9ba6f226f" />

Subqueries
----------
19. Maximum procedure cost:
    SELECT NAME, COST FROM PROCEDURES WHERE COST = (SELECT MAX(COST) FROM PROCEDURES);
<img width="412" height="88" alt="Screenshot 2025-08-07 152429" src="https://github.com/user-attachments/assets/80a3fcb0-acd7-41d3-8e12-be2ee369ceff" />

20. Patient diagnosed with chronic pain:
    SELECT * FROM PATIENT WHERE PATIENT_ID IN (SELECT PATIENT_ID FROM PATIENT_DIAGNOSIS WHERE DIAGNOSIS = 'Chronic Pain');
<img width="504" height="90" alt="Screenshot 2025-08-07 152436" src="https://github.com/user-attachments/assets/1e794e0e-5e59-47cd-a316-2e5a7492fb1d" />

21. Procedures costing more than average:
    SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST > (SELECT AVG(COST) FROM PROCEDURES);
<img width="368" height="100" alt="Screenshot 2025-08-07 152442" src="https://github.com/user-attachments/assets/6765ee71-1268-4ceb-a8ae-81e91169bb76" />

22. Procedures costing less than average:
    SELECT NAME AS Procedure_Name, COST AS Procedure_Cost FROM PROCEDURES WHERE COST < (SELECT AVG(COST) FROM PROCEDURES);
<img width="349" height="104" alt="Screenshot 2025-08-07 152448" src="https://github.com/user-attachments/assets/98b9f490-903c-4c58-8f8a-14195152844d" />

23. Physicians who are Head Chief or Senior:
    SELECT * FROM PHYSICIAN WHERE POSITION IN (SELECT POSITION FROM PHYSICIAN WHERE POSITION LIKE '%Senior%' OR POSITION LIKE '%Head Chief%');
<img width="392" height="212" alt="Screenshot 2025-08-07 152456" src="https://github.com/user-attachments/assets/93fb0dc6-afb2-4a47-9579-0970b979f2ef" />

24. Physicians without primary affiliation:
    SELECT * FROM PHYSICIAN WHERE EMPLOYEEID IN (SELECT PHYSICIANID FROM AFFILIATED_WITH WHERE PRIMARYAFFILIATION = 'f');

    <img width="392" height="185" alt="Screenshot 2025-08-07 152505" src="https://github.com/user-attachments/assets/a200bc93-715b-4edb-bd97-48a9bbd02196" />



