USE CrownfieldEyeHospital;

-- TASK B: CONTROLLED UPDATE AND DELETE
-- 1. Check record F006 before updating
SELECT * FROM Follow_Up
WHERE FollowUpID = 'F006';


-- 2. Update the priority from High to Routine
UPDATE Follow_Up
SET Priority = 'Routine'
WHERE FollowUpID = 'F006';


-- 3. Check the updated record
SELECT * FROM Follow_Up
WHERE FollowUpID = 'F006';


-- 4. Check record F012 before deleting
SELECT * FROM Follow_Up
WHERE FollowUpID = 'F012';


-- 5. Delete record F012
DELETE FROM Follow_Up
WHERE FollowUpID = 'F012';


-- 6. Verify that F012 has been deleted
SELECT * FROM Follow_Up
WHERE FollowUpID = 'F012';


-- TASK C: INDIVIDUAL SQL QUERIES

-- 1. Aggregate query using GROUP BY and HAVING
-- Display clinicians with more than one appointment

SELECT ClinicianID, COUNT(AppointmentID) AS TotalAppointments
FROM Appointment
GROUP BY ClinicianID
HAVING COUNT(AppointmentID) > 1;


-- 2. INNER JOIN across three related tables
-- Display appointments with patient and clinician details

SELECT  Appointment.AppointmentID,
        Patient.PatientName,
        Clinician.ClinicianName,
        Appointment.AppointmentDate,
        Appointment.AppointmentTime,
        Appointment.Notes
FROM Appointment
INNER JOIN Patient
    ON Appointment.PatientID = Patient.PatientID
INNER JOIN Clinician
    ON Appointment.ClinicianID = Clinician.ClinicianID;


-- 3. LEFT JOIN
-- Display all appointments, including those without follow-ups

SELECT
    Appointment.AppointmentID,
    Appointment.AppointmentDate,
    Appointment.Notes,
    Follow_Up.FollowUpID,
    Follow_Up.DueDate,
    Follow_Up.Priority,
    Follow_Up.Status
FROM Appointment
LEFT JOIN Follow_Up
    ON Appointment.AppointmentID = Follow_Up.AppointmentID;


-- 4. Subquery
-- Find patients who have appointments with clinician C001

SELECT PatientID, PatientName
FROM Patient
WHERE PatientID IN (SELECT PatientID FROM Appointment
                    WHERE ClinicianID = 'C001');





