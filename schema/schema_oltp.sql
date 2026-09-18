-- Operational database (OLTP) for the clinic
-- Generated from the MySQL Workbench model in this repository.

CREATE TABLE Patient (
  PatientID INT NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PRIMARY KEY (PatientID)
);

CREATE TABLE Doctor (
  DoctorID INT NOT NULL,
  DoctorName VARCHAR(100) NOT NULL,
  Specialization VARCHAR(100) NOT NULL,
  DoctorContact VARCHAR(100) NOT NULL,
  PRIMARY KEY (DoctorID)
);

CREATE TABLE Appointment (
  AppointmentID INT NOT NULL,
  AppointmentDate DATE NOT NULL,
  AppointmentTime VARCHAR(8) NOT NULL,
  Patient_PatientID INT NOT NULL,
  Doctor_DoctorID INT NOT NULL,
  PRIMARY KEY (AppointmentID),
  FOREIGN KEY (Patient_PatientID) REFERENCES Patient (PatientID),
  FOREIGN KEY (Doctor_DoctorID) REFERENCES Doctor (DoctorID)
);

CREATE TABLE MedicalProcedure (
  ProcedureID INT NOT NULL,
  ProcedureName VARCHAR(100) NOT NULL,
  Appointment_AppointmentID INT NOT NULL,
  PRIMARY KEY (ProcedureID),
  FOREIGN KEY (Appointment_AppointmentID) REFERENCES Appointment (AppointmentID)
);

CREATE TABLE Billing (
  InvoiceID INT NOT NULL,
  BillingItem VARCHAR(100) NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Appointment_AppointmentID INT NOT NULL,
  Patient_PatientID INT NOT NULL,
  PRIMARY KEY (InvoiceID),
  FOREIGN KEY (Appointment_AppointmentID) REFERENCES Appointment (AppointmentID),
  FOREIGN KEY (Patient_PatientID) REFERENCES Patient (PatientID)
);
