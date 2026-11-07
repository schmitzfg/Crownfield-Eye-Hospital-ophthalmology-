-- 04_security.sql

USE crownfieldeyehospital;


-- 1. DATA PROTECTION USING HASHING


-- Add PasswordHash column.
-- Run this ALTER TABLE statement only once.
-- The column may already exist in the database.

ALTER TABLE Patient
ADD COLUMN PasswordHash VARCHAR(255);


-- Store hashed passwords for sample patients.

UPDATE Patient
SET PasswordHash = SHA2('Patient123!', 256)
WHERE PatientID = 'OP001';

UPDATE Patient
SET PasswordHash = SHA2('Patientpsw!', 256)
WHERE PatientID = 'OP005';


-- Display the stored password hashes.

SELECT PatientID, PasswordHash
FROM Patient;


-- SHA2() is used here for educational purposes.
-- Real applications use more advanced hashing algorithmes



-- 2. SQL INJECTION VULNERABILITY

-- Example of vulnerable Python code:

-- patient_id = input("Enter Patient ID: ")
-- query = "SELECT * FROM Patient WHERE PatientID = '" + patient_id + "'"

-- Example of an SQL injection input:
-- ' OR '1'='1' --

-- The resulting SQL query becomes:

-- SELECT * FROM Patient
-- WHERE PatientID = '' OR '1'='1' -- ';


-- 3. PREPARED STATEMENT


-- Demonstrate how a prepared statement prevents
-- the injected input from being executed as SQL code.

SET @PatientID = "' OR '1'='1";

PREPARE secure_query FROM
'SELECT * FROM Patient WHERE PatientID = ?';

EXECUTE secure_query USING @PatientID;

DEALLOCATE PREPARE secure_query;


-- =============================================
-- 4. ACCESS CONTROL
-- =============================================


-- Create users for permissions
CREATE USER IF NOT EXISTS 'hospital_admin'@'%'
IDENTIFIED BY 'Admin123!';

CREATE USER IF NOT EXISTS 'doctor'@'%'
IDENTIFIED BY 'Doctor123!';

CREATE USER IF NOT EXISTS 'receptionist'@'%'
IDENTIFIED BY 'Reception123!';

-- Total access for administrator
GRANT ALL PRIVILEGES
ON crownfieldeyehospital.*
TO 'hospital_admin'@'%';

-- Doctor access for necesar medical data only
GRANT SELECT, UPDATE
ON crownfieldeyehospital.Patient
TO 'doctor'@'%';

GRANT SELECT, UPDATE
ON crownfieldeyehospital.Appointment
TO 'doctor'@'%';

GRANT SELECT, INSERT
ON crownfieldeyehospital.Diagnosis
TO 'doctor'@'%';

GRANT SELECT, INSERT
ON crownfieldeyehospital.Appointment_Diagnosis
TO 'doctor'@'%';

GRANT SELECT
ON crownfieldeyehospital.Clinician
TO 'doctor'@'%';

GRANT SELECT
ON crownfieldeyehospital.Clinic
TO 'doctor'@'%';

GRANT SELECT
ON crownfieldeyehospital.Speciality
TO 'doctor'@'%';

GRANT SELECT, INSERT
ON crownfieldeyehospital.Prescription
TO 'doctor'@'%';

GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Prescription_Item
TO 'doctor'@'%';

GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Follow_Up
TO 'doctor'@'%';

GRANT SELECT
ON crownfieldeyehospital.Medicine
TO 'doctor'@'%';



-- Receptionist: access to gestionate patients and appointments only
GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Patient
TO 'receptionist'@'%';

GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Appointment
TO 'receptionist'@'%';

GRANT SELECT
ON crownfieldeyehospital.Clinician
TO 'receptionist'@'%';

GRANT SELECT
ON crownfieldeyehospital.Clinic
TO 'receptionist'@'%';

GRANT SELECT
ON crownfieldeyehospital.Speciality
TO 'receptionist'@'%';

GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Follow_Up
TO 'receptionist'@'%';



-- Access Control Matrix:

-- Database permissions       Administrator  Doctor  Receptionist
-- View patients (SELECT)          Yes         Yes        Yes
-- Add patients (INSERT)           Yes         No         Yes
-- Update patients (UPDATE)        Yes         Yes        Yes
-- Delete patients (DELETE)        Yes         No         No
-- View appointments               Yes         Yes        Yes
-- Create appointments             Yes         No         Yes
-- Update appointments             Yes         Yes        Yes
-- Delete appointments             Yes         No         No
-- View diagnoses                  Yes         Yes        No
-- Add diagnoses                   Yes         Yes        No
-- View prescriptions              Yes         Yes        No
-- Create prescriptions            Yes         Yes        No
-- Manage database structure       Yes         No         No

-- Least Privileges foe users receive only the permissions required to perform their duties.


-- 5. VERIFY USER PERMISSIONS


SHOW GRANTS FOR 'hospital_admin'@'%';

SHOW GRANTS FOR 'doctor'@'%';

SHOW GRANTS FOR 'receptionist'@'%';
