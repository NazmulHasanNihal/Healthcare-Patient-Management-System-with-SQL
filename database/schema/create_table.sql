-- Active: 1744307726356@@127.0.0.1@5432@postgres@public
-- Creating Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    address TEXT,
    phone VARCHAR(20),
    email VARCHAR(255),
    insurance_provider VARCHAR(100),
    marital_status VARCHAR(20),
    ethnicity VARCHAR(50),
    occupation VARCHAR(100),
    diagnosis VARCHAR(255),
    treatment_history VARCHAR(255),
    allergies VARCHAR(255),
    chronic_conditions VARCHAR(10),
    medications VARCHAR(255)
);

-- Creating Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(255),
    availability VARCHAR(50),
    location VARCHAR(100)
);


-- Creating Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    appointment_status VARCHAR(50),
    reason_for_appointment VARCHAR(100),
    appointment_outcome VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Creating Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication_name VARCHAR(255),
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE,
    prescription_notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Creating Medical History Table 
CREATE TABLE medical_history (
    patient_id INT PRIMARY KEY,
    previous_diagnoses TEXT,
    previous_treatments TEXT,
    previous_medications TEXT,
    medical_notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Creating Treatments Table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_date DATE,
    treatment_type VARCHAR(50),
    treatment_outcome VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Creating Doctor Patient Link Table
CREATE TABLE doctor_patient_link (
    link_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    start_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Creating Billing Table
CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    patient_id INT,
    total_bill_amount DECIMAL(10, 2),
    insurance_provider VARCHAR(100),
    payment_status VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
