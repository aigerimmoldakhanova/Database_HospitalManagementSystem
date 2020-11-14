CREATE TABLE Doctors(
doctor_id INT,
doctor_surname VARCHAR(50),
doctor_name VARCHAR(50),	
birth_date DATE,
doctor_email CHAR(60),
speciality VARCHAR(60),
doctor_mobile INT,	
PRIMARY KEY (doctor_id)
);

CREATE TABLE Staff(
staff_id INT,
staff_name VARCHAR(50),
staff_position VARCHAR(60),
staff_mobile INT,
staff_email CHAR(60),
birth_date DATE,	
PRIMARY KEY (staff_id)
);

CREATE TABLE Bill(
bill_id INT,
amount INT,
payment_type VARCHAR(60),	
PRIMARY KEY (bill_id)
);

CREATE TABLE Treating_method (
method_id INT,
method_description VARCHAR(255),
medicine VARCHAR (255),	
PRIMARY KEY (method_id)
);

CREATE TABLE Pharmacy(
pharmacy_id INT,
pharmacy_name VARCHAR(60),
pharmacy_city VARCHAR(60),
pharmacy_address VARCHAR(255),	
PRIMARY KEY (pharmacy_id)
);

CREATE TABLE Equipment_purchase(
equipment_id INT,
equipment_name VARCHAR(255),
equipment_description TEXT,
price INT,
firm_name VARCHAR(60),
PRIMARY KEY (equipment_id)
);

CREATE TABLE Diagnosis(
diagnosis_id INT,
diagnosis_name VARCHAR(255),
diagnosis_description TEXT,
method_id INT,
PRIMARY KEY (diagnosis_id),
FOREIGN KEY (method_id) REFERENCES Treating_method (method_id)	
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
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),	
FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis (diagnosis_id),	
FOREIGN KEY (bill_id) REFERENCES Bill (bill_id)
);

CREATE TABLE Reception(
schedule_id INT,
schedule_time INT,
room_number INT,
patient_id INT,
doctor_id INT,
bill_id	INT,
PRIMARY KEY (schedule_id),
FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),	
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),	
FOREIGN KEY (bill_id) REFERENCES Bill (bill_id)	
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
FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy (pharmacy_id),	
FOREIGN KEY (equipment_id) REFERENCES Equipment_purchase (equipment_id),	
FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id),
FOREIGN KEY (staff_id) REFERENCES Staff (staff_id)
);






















































