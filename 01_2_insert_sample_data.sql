-- -- Insert sample data into all tables


INSERT INTO Patient (PatientID, PatientName, PostCode)
            VALUES
                    ('OP001', 'Amina Yusuf', 'NE1 4AB'),
                    ('OP002', 'Daniel Reed', 'N16 7QP'),
                    ('OP003', 'Sofia Bennett', 'E8 2LD'),
                    ('OP004', 'Michael Okoro', 'SE6 3RT'),
                    ('OP005', 'Stefan Baranin', 'SE15 2TS'),
                    ('OP006', 'Andreea Meloni', 'SE5 5RT'),
                    ('OP007', 'James Brown', 'SE23 2FG'),
                    ('OP008', 'Jean-Claude Vandamme', 'E1 2ER'),
                    ('OP009', 'Donald Trump', 'CR0 2EG'),
                    ('OP010', 'Pino Nochio', 'SE1 1VS'),
                    ('OP011', 'Korrie Le-Good', 'SE5 4TX'),
                    ('OP012', 'Perri Levet', 'SE20 5UV'),
                    ('OP013', 'Jami Akinmousinian', 'E15 3RV'),
                    ('OP014', 'Gherardo Glanz', 'E20 2VX');
SELECT * FROM patient;


INSERT INTO Speciality (SpecialityID, SpecialityName)
            VALUES
                        ('S001', 'Glaucoma'),
                        ('S002', 'Retina'),
                        ('S003', 'Cornea'),   
                        ('S004', 'Cataract'),
                        ('S005', 'Paediatric Ophthalmology'),
                        ('S006', 'Oculoplastics'),
                        ('S007', 'Neuro-Ophthalmology'),
                        ('S008', 'Uveitis'),
                        ('S009', 'Medical Retina'),
                        ('S010', 'Optometry'),
                        ('S011', 'Refractive Surgery'),
                        ('S012', 'Ocular Oncology'),
                        ('S013', 'Low Vision Rehabilitation'); 

SELECT COUNT(*) AS TotalSpecialities
FROM Speciality;


INSERT INTO Clinician (ClinicianID, ClinicianName, SpecialityID)
            VALUES      
                        ('C001', 'Dr Maya Shah', 'S001'),
                        ('C002', 'Dr Leo Grant', 'S002'),
                        ('C003', 'Dr Priya Nair', 'S003'),
                        ('C004', 'Dr James Wilson', 'S004'),
                        ('C005', 'Dr Emily Carter', 'S005'),
                        ('C006', 'Dr Oliver Brown', 'S006'),
                        ('C007', 'Dr Sophia Taylor', 'S007'),
                        ('C008', 'Dr William Harris', 'S008'),
                        ('C009', 'Dr Amelia Clark', 'S009'),
                        ('C010', 'Dr George Lewis', 'S010'),
                        ('C011', 'Dr Grace Walker', 'S011'),
                        ('C012', 'Dr Henry Hall', 'S012'),
                        ('C013', 'Dr Lily Young', 'S013');





INSERT INTO Clinic (ClinicID, ClinicName)
            VALUES
                    ('CL001', 'Denmark Hill'),
                    ('CL002', 'Peckham'),
                    ('CL003', 'Westminster'),
                    ('CL004', 'Moorfields'),
                    ('CL005', 'Bristol Eye Clinic'),
                    ('CL006', 'Manchester Eye Clinic'),
                    ('CL007', 'Birmingham Eye Clinic'),
                    ('CL008', 'Leeds Eye Clinic'),
                    ('CL009', 'Liverpool Eye Clinic'),
                    ('CL010', 'Oxford Eye Clinic'),
                    ('CL011', 'Newcastle Eye Clinic'),
                    ('CL012', 'Sheffield Eye Clinic'),
                    ('CL013', 'Nottingham Eye Clinic');



INSERT INTO Appointment(AppointmentID, PatientID, ClinicianID, ClinicID, AppointmentDate, AppointmentTime, Notes)
                VALUES
                        ('A001', 'OP001', 'C001', 'CL001', '2026-10-05', '09:00:00', 'Review IOP'),
                        ('A002', 'OP002', 'C002', 'CL001', '2026-10-05', '09:30:00', 'OCT before review'),
                        ('A003', 'OP001', 'C001', 'CL002', '2026-11-16', '10:15:00', 'Visual field test'),
                        ('A004', 'OP003', 'C001', 'CL001', '2026-10-06', '11:00:00', 'Monitor'),
                        ('A005', 'OP004', 'C003', 'CL003', '2026-10-07', '14:00:00', 'Corneal topography'),
                        ('A006', 'OP002', 'C001', 'CL002', '2026-10-08', '09:00:00', 'Check eye pressure'),
                        ('A007', 'OP003', 'C002', 'CL003', '2026-10-09', '10:00:00', 'Retinal examination'),
                        ('A008', 'OP004', 'C003', 'CL002', '2026-10-10', '11:30:00', 'Review treatment'),
                        ('A009', 'OP001', 'C004', 'CL004', '2026-10-12', '09:15:00', 'Check vision'),
                        ('A010', 'OP002', 'C005', 'CL005', '2026-10-13', '10:30:00', 'Review scan results'),
                        ('A011', 'OP003', 'C006', 'CL006', '2026-10-14', '13:00:00', 'Monitor symptoms'),
                        ('A012', 'OP004', 'C007', 'CL007', '2026-10-15', '14:30:00', 'Follow-up examination'),
                        ('A013', 'OP001', 'C008', 'CL008', '2026-10-16', '15:00:00', 'Eye health assessment');


INSERT INTO Diagnosis (DiagnosisID, DiagnosisName)
            VALUES
                    ('D001', 'Ocular hypertension'),
                    ('D002', 'Diabetic macular oedema'),
                    ('D003', 'Glaucoma suspect'),
                    ('D004', 'Keratoconus'),
                    ('D005', 'Cataract'),
                    ('D006', 'Dry eye disease'),
                    ('D007', 'Retinal detachment'),
                    ('D008', 'Age-related macular degeneration'),
                    ('D009', 'Conjunctivitis'),
                    ('D010', 'Uveitis'),
                    ('D011', 'Optic neuritis'),
                    ('D012', 'Blepharitis'),
                    ('D013', 'Retinal vein occlusion');


INSERT INTO Appointment_Diagnosis (AppointmentID, DiagnosisID)
                        VALUES
                                ('A001', 'D003'),
                                ('A002', 'D001'),
                                ('A003', 'D005'),
                                ('A004', 'D002'),
                                ('A005', 'D004'),
                                ('A006', 'D001'),
                                ('A007', 'D006'),
                                ('A008', 'D003'),
                                ('A009', 'D008'),
                                ('A010', 'D004'),
                                ('A011', 'D010'),
                                ('A012', 'D007');


INSERT INTO Medicine (MedicineID, MedicineName)
                VALUES
                    ('M001', 'Latanoprost'),
                    ('M002', 'Timolol'),
                    ('M003', 'Aflibercept'),
                    ('M004', 'Sodium chloride drops'),
                    ('M005', 'Brimonidine'),
                    ('M006', 'Dorzolamide'),
                    ('M007', 'Brinzolamide'),
                    ('M008', 'Travoprost'),
                    ('M009', 'Bimatoprost'),
                    ('M010', 'Prednisolone eye drops'),
                    ('M011', 'Ofloxacin eye drops'),
                    ('M012', 'Artificial tears');


INSERT INTO Prescription (PrescriptionID, AppointmentID)
                VALUES
                        ('PR001', 'A001'),
                        ('PR002', 'A002'),
                        ('PR003', 'A003'),
                        ('PR004', 'A004'),
                        ('PR005', 'A005'),
                        ('PR006', 'A006'),
                        ('PR007', 'A007'),
                        ('PR008', 'A008'),
                        ('PR009', 'A009'),
                        ('PR010', 'A010'),
                        ('PR011', 'A011'),
                        ('PR012', 'A012');


INSERT INTO Prescription_Item(PrescriptionID, MedicineID, Dose, Route, Frequency, Duration)
                        VALUES
                            ('PR001', 'M001', '1 drop', 'Eye drops', 'Once daily', '30 days'),
                            ('PR001', 'M002', '1 drop', 'Eye drops', 'Twice daily', '30 days'),
                            ('PR002', 'M003', '2 mg', 'Intravitreal injection', 'As prescribed', '1 dose'),
                            ('PR003', 'M001', '1 drop', 'Eye drops', 'Once daily', '30 days'),
                            ('PR004', 'M004', '1 drop', 'Eye drops', 'As needed', '30 days'),
                            ('PR005', 'M005', '1 drop', 'Eye drops', 'Twice daily', '30 days'),
                            ('PR006', 'M006', '1 drop', 'Eye drops', 'Twice daily', '30 days'),
                            ('PR007', 'M007', '1 drop', 'Eye drops', 'Twice daily', '30 days'),
                            ('PR008', 'M008', '1 drop', 'Eye drops', 'Once daily', '30 days'),
                            ('PR009', 'M009', '1 drop', 'Eye drops', 'Once daily', '30 days'),
                            ('PR010', 'M010', '1 drop', 'Eye drops', 'As prescribed', '14 days'),
                            ('PR011', 'M011', '1 drop', 'Eye drops', 'As prescribed', '7 days');


INSERT INTO Follow_Up(FollowUpID, AppointmentID, DueDate, Priority, Status, Notes)
               VALUES
                    ('F001', 'A001', '2026-11-16', 'High', 'Pending', 'Review IOP'),
                    ('F002', 'A002', '2026-11-02', 'Urgent', 'Pending', 'OCT before review'),
                    ('F003', 'A003', '2027-02-08', 'Routine', 'Pending', 'Visual field test'),
                    ('F004', 'A004', '2027-04-07', 'Routine', 'Pending', 'Monitor'),
                    ('F005', 'A005', '2026-12-02', 'Routine', 'Pending', 'Corneal topography'),
                    ('F006', 'A006', '2026-11-20', 'High', 'Pending', 'Check eye pressure'),
                    ('F007', 'A007', '2026-11-25', 'Routine', 'Pending', 'Retinal examination'),
                    ('F008', 'A008', '2026-12-10', 'High', 'Pending', 'Review treatment'),
                    ('F009', 'A009', '2026-11-30', 'Routine', 'Pending', 'Check vision'),
                    ('F010', 'A010', '2026-12-15', 'Urgent', 'Pending', 'Review scan results'),
                    ('F011', 'A011', '2027-01-10', 'Routine', 'Pending', 'Monitor symptoms'),
                    ('F012', 'A012', '2026-12-20', 'High', 'Pending', 'Follow-up examination');