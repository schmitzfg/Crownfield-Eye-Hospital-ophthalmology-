-- Crownfield Eye Hospital Database
-- 03_procedure_and_trigger.sql
-- Stored Procedures and Triggers

USE CrownfieldEyeHospital;


-- =========================================
-- TASK: STORED PROCEDURE
-- Display appointments for a selected patient
-- =========================================

DROP PROCEDURE IF EXISTS GetPatientAppointments;

DELIMITER //

CREATE PROCEDURE GetPatientAppointments(IN p_PatientID VARCHAR(12))
BEGIN
    SELECT
        AppointmentID,
        PatientID,
        ClinicianID,
        AppointmentDate,
        AppointmentTime,
        Notes
    FROM Appointment
    WHERE PatientID = p_PatientID;
END //

DELIMITER ;


-- Example: Execute the procedure

CALL GetPatientAppointments('OP001');


-- =========================================
-- TASK: CREATE AUDIT TABLE
-- Store changes to Follow-Up priorities
-- =========================================

CREATE TABLE IF NOT EXISTS FollowUp_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    FollowUpID VARCHAR(12),
    OldPriority VARCHAR(50),
    NewPriority VARCHAR(50),
    ChangeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- TASK: BEFORE UPDATE TRIGGER
-- Validate Follow-Up priority
-- =========================================

DROP TRIGGER IF EXISTS BeforeFollowUpPriorityUpdate;

DELIMITER //

CREATE TRIGGER BeforeFollowUpPriorityUpdate
BEFORE UPDATE ON Follow_Up
FOR EACH ROW
BEGIN
    IF NEW.Priority NOT IN ('High', 'Routine') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Follow-Up priority';
    END IF;
END //

DELIMITER ;


-- =========================================
-- TASK: AFTER UPDATE TRIGGER
-- Record changes to Follow-Up priority
-- =========================================

DROP TRIGGER IF EXISTS AfterFollowUpPriorityUpdate;

DELIMITER //

CREATE TRIGGER AfterFollowUpPriorityUpdate
AFTER UPDATE ON Follow_Up
FOR EACH ROW
BEGIN
    IF OLD.Priority <> NEW.Priority THEN
        INSERT INTO FollowUp_Audit
            (FollowUpID, OldPriority, NewPriority)
        VALUES
            (OLD.FollowUpID, OLD.Priority, NEW.Priority);
    END IF;
END //

DELIMITER ;


-- =========================================
-- TEST THE TRIGGERS
-- =========================================

-- Check the current Follow-Up record
SELECT * FROM Follow_Up
WHERE FollowUpID = 'F006';

-- Change priority to High to test the triggers
UPDATE Follow_Up
SET Priority = 'High'
WHERE FollowUpID = 'F006';

-- Check the audit table
SELECT * FROM FollowUp_Audit
WHERE FollowUpID = 'F006';