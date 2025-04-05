-- Creating Patients Table
CREATE TABLE Patients (
                          Patient_ID INT PRIMARY KEY,
                          First_Name VARCHAR(100),
                          Last_Name VARCHAR(100),
                          Date_of_Birth DATE,
                          Gender VARCHAR(10),
                          Address VARCHAR(255),
                          Phone VARCHAR(15),
                          Email VARCHAR(100),
                          Insurance_Provider VARCHAR(100)
);

-- Creating Doctors Table
CREATE TABLE Doctors (
                         Doctor_ID INT PRIMARY KEY,
                         First_Name VARCHAR(100),
                         Last_Name VARCHAR(100),
                         Specialization VARCHAR(100),
                         Phone VARCHAR(15),
                         Email VARCHAR(100),
                         Availability VARCHAR(100)
);

-- Creating Appointments Table
CREATE TABLE Appointments (
                              Appointment_ID INT PRIMARY KEY,
                              Patient_ID INT,
                              Doctor_ID INT,
                              Appointment_Date DATE,
                              Appointment_Status VARCHAR(20),
                              Reason_for_Appointment VARCHAR(255),
                              FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
                              FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Creating Prescriptions Table
CREATE TABLE Prescriptions (
                               Prescription_ID INT PRIMARY KEY,
                               Patient_ID INT,
                               Doctor_ID INT,
                               Medication_Name VARCHAR(100),
                               Dosage VARCHAR(50),
                               Start_Date DATE,
                               End_Date DATE,
                               Prescription_Notes TEXT,
                               FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
                               FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Creating Medical History Table
CREATE TABLE Medical_History (
                                 Patient_ID INT,
                                 Diagnosis VARCHAR(255),
                                 Treatment_History TEXT,
                                 Allergies VARCHAR(255),
                                 Chronic_Conditions VARCHAR(255),
                                 PRIMARY KEY (Patient_ID),
                                 FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Creating Treatments Table
CREATE TABLE Treatments (
                            Treatment_ID INT PRIMARY KEY,
                            Patient_ID INT,
                            Doctor_ID INT,
                            Treatment_Date DATE,
                            Treatment_Type VARCHAR(100),
                            Treatment_Outcome VARCHAR(50),
                            FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
                            FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Creating Doctor Patient Lin Table
CREATE TABLE Doctor_Patient_Link (
                                     Link_ID INT PRIMARY KEY,
                                     Patient_ID INT,
                                     Doctor_ID INT,
                                     Start_Date DATE,
                                     FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
                                     FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Creating Billing Table
CREATE TABLE Billing (
                         Billing_ID INT PRIMARY KEY,
                         Patient_ID INT,
                         Total_Bill_Amount DECIMAL(10, 2),
                         Insurance_Provider VARCHAR(100),
                         Payment_Status VARCHAR(20),
                         Payment_Date DATE,
                         FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);




