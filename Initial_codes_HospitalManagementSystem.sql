CREATE TABLE Doctors(
doctor_id INT,
doctor_surname VARCHAR(50),
doctor_name VARCHAR(50),	
birth_date DATE,
doctor_email CHAR(60),
speciality VARCHAR(60),
doctor_mobile INT,	
PRIMARY KEY (doctor_id)
);--Creating a table to display data about doctors

CREATE TABLE Staff(
staff_id INT,
staff_name VARCHAR(50),
staff_position VARCHAR(60),
staff_mobile INT,
staff_email CHAR(60),
birth_date DATE,	
PRIMARY KEY (staff_id)
);--This table includes the data of secondary hospital workers

CREATE TABLE Bill(
bill_id INT,
amount INT,
payment_type VARCHAR(60),	
PRIMARY KEY (bill_id)
);--The "Bill" table contains the types of payments and the number of checks made by patients

CREATE TABLE Treating_method (
method_id INT,
method_description VARCHAR(255),
medicine VARCHAR (255),	
PRIMARY KEY (method_id)
);--This table contains data on the methods of treatment for a different disease

CREATE TABLE Pharmacy(
pharmacy_id INT,
pharmacy_name VARCHAR(60),
pharmacy_city VARCHAR(60),
pharmacy_address VARCHAR(255),	
PRIMARY KEY (pharmacy_id)
);--Since the hospital purchases the necessary medicines, this table shows the cooperation with pharmacies to purchase medicines

CREATE TABLE Equipment_purchase(
equipment_id INT,
equipment_name VARCHAR(255),
equipment_description TEXT,
price INT,
firm_name VARCHAR(60),
PRIMARY KEY (equipment_id)
);--The table contains information about purchased equipment for the hospital

CREATE TABLE Diagnosis(
diagnosis_id INT,
diagnosis_name VARCHAR(255),
diagnosis_description TEXT,
method_id INT,
PRIMARY KEY (diagnosis_id),
FOREIGN KEY (method_id) REFERENCES Treating_method (method_id)--Different types of diagnosis have a method of treatment	
);

CREATE TABLE Patient(
patient_id INT,
patient_fname VARCHAR(50),	
patient_lname VARCHAR(50),	
patient_email CHAR(60),
doctor_id INT,
diagnosis_id INT,
bill_id	INT,
PRIMARY KEY (patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),--Shows to which doctor the patient made an appointment	
FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis (diagnosis_id), --Information about the patient's diagnosis	
FOREIGN KEY (bill_id) REFERENCES Bill (bill_id)--Shows the patient's payment
);

CREATE TABLE Reception(
schedule_id INT,
schedule_time INT,
room_number INT,
patient_id INT,
doctor_id INT,
bill_id	INT,
PRIMARY KEY (schedule_id),
FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),--Since this table display data about reception, there must be access to information about the registered patients	
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),--	The reception has information about the doctors
FOREIGN KEY (bill_id) REFERENCES Bill (bill_id)--Reception has data about payment type	
);

CREATE TABLE Administration(
hosp_id INT,
hosp_name VARCHAR(60),
hosp_address VARCHAR(255),	
hosp_city VARCHAR (60),
pharmacy_id INT,
equipment_id INT,
doctor_id INT,
staff_id INT,
PRIMARY KEY (hosp_id),
FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy (pharmacy_id),--The hospital administration cooperates with many pharmacies to buy medicines	
FOREIGN KEY (equipment_id) REFERENCES Equipment_purchase (equipment_id),--The hospital administration buys the necessary equipment from different companies	
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),--The administration has access to information about all doctors
FOREIGN KEY (staff_id) REFERENCES Staff (staff_id)--The administration has access to information about all staff
);






















































