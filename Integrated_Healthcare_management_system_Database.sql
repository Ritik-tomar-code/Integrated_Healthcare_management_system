#CREATE DATABASE
  
CREATE DATABASE HOSPITAL_MANAGMENT_SYSTEM;

#Use DATABASE
  
USE HOSPITAL_MANAGMENT_SYSTEM;

#CREATION OF TABLE & ROW INSERTION 

#Physician Table

CREATE TABLE Physician(
employeeid INT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
position VARCHAR(150) NOT NULL
);

INSERT INTO Physician(employeeid,name,position) 
VALUES
(1,'Dr. Hansraj Hathi','Staff Internist'),
(2,'Dr. Daya Mehta','Attending Physician'),
(3,'Dr. Taarak Mehta','Surgical Attending Physician'),
(4,'Dr. Aatmaram Bhide','Senior Attending Physician'),
(5,'Dr. Iyer','Head Chief of pulmonology'),
(6,'Dr. Jethalal Gada','Surgical Attending Physician'),
(7,'Dr. Popatlal Pandey','Surgical Attending Physician'),
(8,'Dr. Sodhi','Resident'),
(9,'Dr. Babita Iyer','Attending Psychiatrist'),
(10,'Dr. Anjali Mehta','Senior Attending Nephrologist'),
(11,'Dr. Roshan Sodhi','Resident'),
(12,'Dr. Champaklal Gada','Senior Attending Gynecologist'),
(13,'Dr. Sunder Lal','Cardiologist'),
(14,'Dr. Bagha','Assistant Intensivist'),
(15,'Dr. Abdul','Senior ENT Surgeon'),
(16,'Dr. Natu Kaka','Junior Resident'),
(17,'Dr. Pinku','Assistant Orthopedic Surgeon'),
(18,'Dr. Rita Reporter','Head chief of Gastroenterology'),
(19,'Dr. Madhavi Bhide','Assistant Neuro Surgeon'),
(20,'Dr. Tapu','Junior Intensivist'),
(21,'Dr. Goli','Head Chief of Orthopedics'),
(22,'Dr. Gogi','Head chief of neonatal'),
(23,'Dr. Sonu','Staff Internist'),
(24,'Dr. Meena','Assistant Physiotherapist'),
(25,'Dr. Pankaj Diwan','Senior Intensivist'),
(26,'Dr. Hemraj','Assistant Gastro Surgeon'),
(27,'Dr. Mrs. Roshan','Head chief of physiotherapy'),
(28,'Dr. Mr. Sharma','Senior attending Urologist'),
(29,'Dr. Santosh','Intensivist'),
(30,'Dr. Prakash','Senior Attending Neurologist'),
(31,'Dr. Kirti','Senior Resident'),
(32,'Dr. Rani','Junior Resident'),
(33,'Dr. Jaya','Assistant neonatologist'),
(34,'Dr. Vandana','Senior Resident'),
(35,'Dr. Tina','Head Chief of Urology');

# Affiliated_with

CREATE TABLE affiliated_with(
physicianid INT NOT NULL,
departmentid INT NOT NULL,
primaryaffiliation VARCHAR(1) NOT NULL,
FOREIGN KEY(physicianid) references Physician(employeeid),
Foreign Key(departmentid) references department(department_id)
);

INSERT INTO affiliated_with(physicianid,departmentid,primaryaffiliation) 
VALUES
(1,1,'t'),
(2,1,'t'),
(3,1,'f'),
(3,2,'t'),
(4,1,'t'),
(5,10,'t'),
(6,2,'t'),
(7,1,'f'),
(7,2,'t'),
(8,1,'t'),
(9,3,'t'),
(10,5,'t'),
(11,4,'f'),
(12,12,'t'),
(13,4,'t'),
(14,14,'f'),
(15,9,'t'),
(16,10,'f'),
(17,15,'t'),
(18,11,'t'),
(19,7,'t'),
(20,14,'f'),
(21,15,'t'),
(22,13,'t'),
(23,14,'f'),
(24,8,'t'),
(25,14,'t'),
(26,11,'f'),
(27,8,'t'),
(28,6,'t'),
(29,14,'t'),
(30,7,'t'),
(31,5,'f'),
(32,4,'f'),
(33,13,'t'),
(34,11,'t'),
(35,6,'t');

#Department Table

create table department(
department_id int Primary Key ,
dept_name VARCHAR(150) NOT NULL,
head int not null,
Foreign Key(head) references Physician(employeeid)
);

Insert into department(department_id,dept_name,head)
values
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9),
(4,'Cardiology',13),
(5,'Nephrology',10),
(6,'Urology',35),
(7,'Neurology',30),
(8,'Physiotherapy',27),
(9,'ENT',15),
(10,'Pulmonology',5),
(11,'Gastroenterology',18),
(12,'Gynecology',12),
(13,'Neonatal',22),
(14,'Critical care',25),
(15,'Orthopedics',21);

# Nurse Table

CREATE TABLE Nurse(
nurse_id INT NOT NULL  ,
name VARCHAR(150) NOT NULL,
position VARCHAR(150) NOT NULL,
registered VARCHAR(10) NOT NULL
);

INSERT INTO Nurse(nurse_id,name,position,registered)
VALUES 
(1,'Kokila Modi','Head Nurse','Yes'),
(2,'Savitri Devi','Nurse','Yes'),
(3,'Bharti Sharma','Nurse','No'),
(4,'Archana Deshmukh','Team Leader','No'),
(5,'Shanaya Singh','Sister Ir','Yes'),
(6,'Prerna Bajaj','Nurse','Yes'),
(7,'Tulsi Virani','Head Nurse','Yes'),
(8,'Aparna Sinha','Nurse','No'),
(9,'Kusum Joshi','Sister IR','No'),
(10,'Avantika Shekhawat','Head Nurse','Yes'),
(11,'Meher Khan','Team Leader','Yes'),
(12,'Divya Bhaskar','Nurse','No'),
(13,'Ishaani Patel','NS Supdt','Yes'),
(14,'Rajjo Yadav','Nurse','No'),
(15,'Gunjan Rao','Nurse','Yes'),
(16,'Mitali Nair','Nurse','No'),
(17,'Juhi Kapoor','Team Leader','Yes'),
(18,'Tanisha Paul','Nurse','No'),
(19,'Aaliya Qureshi','Sister Ir','Yes'),
(20,'Sneha Jindal','Nurse','Yes'),
(21,'Pallavi Tripathi','Head Nurse','Yes'),
(22,'Trisha Rawat','Nurse','No'),
(23,'Vidya Menon','Sister Ir','Yes'),
(24,'Namrata Rathi','Team Leader','Yes'),
(25,'Amrita Kaur','Nurse','No'),
(26,'Reema Saxena','Nurse','No'),
(27,'Lavanya Goyal','Head Nurse','No'),
(28,'Bhavya Reddy','Nurse','Yes'),
(29,'Niyati Solanki','Team Leader','Yes'),
(30,'Kritika Vyas','Nurse','No'),
(31,'Saanvi Chawla','Head Nurse','Yes'),
(32,'Harleen Gill','Nurse','Yes'),
(33,'Esha Malhotra','Sister Ir','No');

# Patient Table

CREATE TABLE Patient(
patient_id INT Primary key auto_increment,
name VARCHAR(100) NOT NULL,
surname VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
Gender VARCHAR(150) NOT NULL,
phone VARCHAR(150) NOT NULL,
primary_check INT NOT NULL,
FOREIGN KEY(PRIMARY_CHECK) REFERENCES Physician(employeeid)
);


INSERT INTO Patient(Patient_id,name,surname,address,Gender,phone,primary_check)
VALUES
(01,'Aarav','Verma','Sector 21, Noida','Male','+91-9876543210',2),
(02,'Ishita','Rana','MG Road, Pune','Female','+91-9876501234',2),
(03,'Raghav','Malhotra','Lajpat Nagar, Delhi','Male','+91-9988776655',9),
(04,'Vivaan','Sharma','Civil Lines, Kanpur','Male','+91-9090909090',17),
(05,'Diya','Agarwal','Kalighat, Kolkata','Female','+91-9123456789',24),
(06,'Yash','Kapoor','JP Nagar, Bengaluru','Male','+91-9988001122',7),
(07,'Tanya','Mishra','Boring Road, Patna','Female','+91-9911002233',13),
(08,'Kabir','Nanda','Sector 15, Gurugram','Male','+91-9810101010',25),
(09,'Riya','Saxena','Alkapuri, Vadodara','Female','+91-9845612345',28),
(10,'Dev','Chauhan','Maninagar, Ahmedabad','Male','+91-9765432187',19),
(11,'Saanvi','Pillai','Gandhibagh, Nagpur','Female','+91-9833445566',5),
(12,'Kunal','Shetty','Marine Drive, Mumbai','Male','+91-9944112233',33),
(13,'Mehul','Joshi','Charni Road, Mumbai','Male','+91-9321567890',3),
(14,'Nitya','Deshmukh','Camp, Pune','Female','+91-9786561234',18),
(15,'Krish','Bajwa','Model Town, Ludhiana','Male','+91-9865321478',6),
(16,'Aanya','Gill','Sector 18, Chandigarh','Female','+91-9611223344',19),
(17,'Arnav','Tiwari','Dharampeth, Nagpur','Male','+91-9856231478',15),
(18,'Avni','Thakur','Patliputra, Patna','Female','+91-9977886655',26),
(19,'Reyansh','Duggal','MVP Colony, Vizag','Male','+91-9789012345',6),
(20,'Myra','Sethi','Race Course, Coimbatore','Female','+91-9798654321',20),
(21,'Vihaan','Rawat','BTM Layout, Bengaluru','Male','+91-9900990099',28),
(22,'Jiya','Grewal','South Extension, Delhi','Female','+91-9888877766',6),
(23,'Parth','Khatri','Hiran Magri, Udaipur','Male','+91-9877087654',25),
(24,'Anvi','Purohit','Sadar Bazar, Indore','Female','+91-9797979797',19),
(25,'Shaurya','Rastogi','Sector 12, Faridabad','Male','+91-9678563412',24),
(26,'Tisha','Bhattacharya','Garia, Kolkata','Female','+91-9837889123',28),
(27,'Atharv','Ray','Gariahat, Kolkata','Male','+91-9966554433',27),
(28,'Prisha','Dey','Lake Town, Kolkata','Female','+91-9098445566',6),
(29,'Aryan','Banerjee','Salt Lake, Kolkata','Male','+91-9812345670',33),
(30,'Kiara','Reddy','Hitech City, Hyderabad','Female','+91-9873214560',10),
(31,'Zayan','Naik','Colaba, Mumbai','Male','+91-9988771234',5),
(32,'Amaira','Panchal','Mira Road, Mumbai','Female','+91-9760012345',18),
(33,'Dhruv','Tripathi','Ram Nagar, Varanasi','Male','+91-9977001122',2),
(34,'Vanya','Nair','MG Road, Kochi','Female','+91-9755554321',13),
(35,'Neil','Mahajan','Shivaji Nagar, Bhopal','Male','+91-9911223344',20),
(36,'Ridhima','Talwar','New Market, Bhopal','Female','+91-9666123456',21),
(37,'Ayaan','Chand','Ashok Nagar, Ranchi','Male','+91-9844556677',9),
(38,'Anaya','Kurian','Kacheripady, Kochi','Female','+91-9800554433',30),
(39,'Harsh','Modi','Thaltej, Ahmedabad','Male','+91-9990011223',15);

# Patient_Diagnosis Table

CREATE TABLE PATIENT_DIAGNOSIS(
Diagnosis VARCHAR(150) NOT NULL,
Prescription VARCHAR(150) NOT NULL,
Patient_ID INT NOT NULL,
Physician_id INT NOT NULL,
FOREIGN KEY(Patient_id) references Patient(Patient_id),
FOREIGN KEY(Physician_id) references Physician(employeeid)
);

INSERT INTO PATIENT_DIAGNOSIS(Diagnosis,Prescription,Patient_ID,Physician_id)
VALUES
('Hypertension','Lisinopril',1,2),
('Arthritis','Naproxen & Aspirin',4,17), 
('Anxiety Disorder','Fluoxetine',3,9),     
('Muscular Dystrophy','Corticosteroids',5,24),                            
('Asthma','Albuterol',2,2),        
('IgA Nephropathy','Budesonide',30,10),     
('Chronic Pain','Tramadol',6,7),    
('Acoustic neuroma','Radiation therapy',7,13),     
('Septic Shock','Corticosteroids:Hydrocortisone',8,25),   
('Kidney Stones','Ibuprofen, Acetaminophen',9,28),     
('Parkinsons Disease,Pramipexole','Ropinirole',10,19),  
('Chronic Obstructive Pulmonary Disease (COPD)','Fluticasone,Budesonide',11,5), 
('Neonatal Jaundice','Phototherapy',12,33),  
('Chronic Pain','Tramadol',13,3),       
('Gallstones','Cholecystectomy',14,18),        
('Type 1 Diabetes','Insulin',15,6),                                  
('Migraine','Triptans',16,19),      
('Tonsillitis','Penicillin VK',17,15),         
('Inflammatory Bowel Disease','Mesalamine',18,26),       
('Coronary Artery Disease','Aspirin',19,6),     
('Chronic Obstructive Pulmonary Disease (COPD)','Tiotropium',20,20),   
('Urinary Tract Infection (UTI)','Nitrofurantoin',21,28),    
('Attention Deficit Disorder','Dextroamphetamine',22,6),      
('Traumatic Brain Injury (TBI)','Propofol,Midazolam',23,25),             
('Neuropathic Pain','Amitriptyline',24,19),                  
('Chronic Obstructive Pulmonary Disease','Breathing exercises',25,24),      
('Overactive Bladder','Oxybutynin',26,28),             
('Sports Injuries','muscle relaxants',27,27),                
('Psoriasis','Methotrexate',28,6),                            
('Respiratory Distress Syndrome','Beractant',29,33),
('Coronavirus Disease 2019 (COVID-191)','Remdesivir',31,5),   
('Chronic Gastritis','Pantoprazole',32,18),      
('Generalized Anxiety Disorder (GAD)','Buspirone',33,2),    
('Sinusitis','Acetaminophen',34,13),     
('Burn Injuries','Acetaminophen',35,20),
('Osteoporosis','Calcitonin',36,21),
('Depression','Fluoxetine',37,9),
('Myasthenia Gravis','Pyridostigmine',38,30),
('Otitis Media','Amoxicillin',39,15);

#Procedure Table

CREATE TABLE procedures(
code INT PRIMARY KEY,
name VARCHAR(150) NOT NULL,
cost INT NOT NULL
);

INSERT INTO procedures(code,name,cost)
VALUES
(1,'X-ray-Chest',1000),
(2,'X-ray-Abdomen',1200),
(3,'X-ray-Skull',900),
(4,'X-ray-Spine',1500),
(5,'MRI-Brain',5000),
(6,'MRI-Spine',6000),
(7,'CT Scan-Abdomen',3000),
(8,'CT Scan-Pelvis',3500),
(9,'Ultrasound-Abdomen',700),
(10,'Ultrasound-Obstetric',2500),
(11,'Mammogram',1200),
(12,'Bone Density Scan (DEXA)',1800),
(13,'PET-CT Scan',5000),
(14,'Fluoroscopy - Upper GI Series',7000),
(15,'Fluoroscopy - Barium Enema',4500),
(16,'Nuclear Medicine - Thyroid Scan',450),
(17,'Angiography - Cerebral',800),
(18,'Interventional Radiology - Biopsy',700),
(19,'X-ray-Extremities',300),
(20,'MRI-Knee',4000);

#DATA RETRIEVAL USING SELECT STATEMENT

SELECT * FROM physician;
SELECT * FROM affiliated_with;
SELECT * FROM department;
SELECT * FROM nurse;
SELECT * FROM patient;
SELECT * FROM patient_diagnosis;
SELECT * FROM procedures;

# DESC STATEMENT

DESC physician;
DESC affiliated_with;
DESC department;
DESC nurse;
DESC patient;
DESC patient_diagnosis;
DESC procedures;