-- Crownfield Eye Hospital Database
-- File: 01_schema.sql
-- Create database structure and relationships

CREATE DATABASE IF NOT EXISTS CrownfieldEyeHospital

USE CrownfieldEyeHospital

-- 1. Patient
CREATE TABLE Patient (PatientID VARCHAR(10) PRIMARY KEY NOT NULL,
    			        PatientName VARCHAR(100) NOT NULL,
   			        PostCode VARCHAR(10) NOT NULL);

-- 2. Speciality
CREATE TABLE Speciality (SpecialityID CHAR(4) PRIMARY KEY NOT NULL,
    			         SpecialityName VARCHAR(100) NOT NULL UNIQUE);

-- 3. Clinician
CREATE TABLE Clinician (ClinicianID VARCHAR(12) PRIMARY KEY NOT NULL,
   			            ClinicianName VARCHAR(100) NOT NULL,
   			            SpecialityID CHAR(4) NOT NULL,
   			            FOREIGN KEY (SpecialityID)
        			        REFERENCES Speciality(SpecialityID));

-- 4. Clinic
CREATE TABLE Clinic (ClinicID CHAR(5) PRIMARY KEY NOT NULL,
   			        ClinicName VARCHAR(100) NOT NULL);

-- 5. Appointment
CREATE TABLE Appointment (AppointmentID VARCHAR(12) PRIMARY KEY,
    				    AppointmentDate DATE NOT NULL,
    				    AppointmentTime TIME NOT NULL,
    				    Notes TEXT,
    				    PatientID VARCHAR(10),
    				    ClinicianID CHAR(4),
    				    ClinicID CHAR(5),
    				    FOREIGN KEY (PatientID)
       				    REFERENCES Patient(PatientID),
    				    FOREIGN KEY (ClinicianID)
        				REFERENCES Clinician(ClinicianID),
    				    FOREIGN KEY (ClinicID)
        				REFERENCES Clinic(ClinicID),
    			        UNIQUE (ClinicianID, AppointmentDate, AppointmentTime));

-- 6. Diagnosis
CREATE TABLE Diagnosis (DiagnosisID VARCHAR(10) PRIMARY KEY,
    		 	        DiagnosisName VARCHAR(150) NOT NULL UNIQUE);

-- 7. Appointment_Diagnosis
CREATE TABLE Appointment_Diagnosis (AppointmentID VARCHAR(12) NOT NULL,
    					        DiagnosisID VARCHAR(10) NOT NULL,
    					        PRIMARY KEY (AppointmentID, DiagnosisID),
    					        FOREIGN KEY (AppointmentID)
        					    REFERENCES Appointment(AppointmentID),
    					        FOREIGN KEY (DiagnosisID)
       					    REFERENCES Diagnosis(DiagnosisID));

-- 8. Prescription
CREATE TABLE Prescription (PrescriptionID VARCHAR(12) NOT NULL PRIMARY KEY,
    				       AppointmentID VARCHAR(12) NOT NULL,
    				       FOREIGN KEY (AppointmentID)
        				   REFERENCES Appointment(AppointmentID));

-- 9. Medicine
CREATE TABLE Medicine (MedicineID CHAR(4) NOT NULL PRIMARY KEY,
    			      MedicineName VARCHAR(150) NOT NULL UNIQUE);

-- 10. Prescription_Item
CREATE TABLE Prescription_Item (PrescriptionID VARCHAR(12) NOT NULL,
    				            MedicineID CHAR(4) NOT NULL,
    					        Dose VARCHAR(100) NOT NULL,
    					        Route VARCHAR(50) NOT NULL,
    					        Frequency VARCHAR(100) NOT NULL,
    					        Duration VARCHAR(100) NOT NULL,
    					        PRIMARY KEY (PrescriptionID, MedicineID),
    					        FOREIGN KEY (PrescriptionID)
        					    REFERENCES Prescription(PrescriptionID),
    					        FOREIGN KEY (MedicineID)
        					    REFERENCES Medicine(MedicineID));
SHOW CREATE TABLE Prescription;

-- 11. Follow_Up
CREATE TABLE Follow_Up (FollowUpID VARCHAR(15) PRIMARY KEY,
    				    AppointmentID VARCHAR(12) NOT NULL UNIQUE,
    				    DueDate DATE NOT NULL,
    				    Priority VARCHAR(20) NOT NULL,
    				    Status VARCHAR(20) NOT NULL,
    				    Notes TEXT,
    				    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    				    CHECK (Priority IN ('Routine', 'High', 'Urgent')),
    				    CHECK (Status IN ('Pending', 'Completed', 'Cancelled')));