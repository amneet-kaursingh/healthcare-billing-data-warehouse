-- Star schema data warehouse
-- Generated from the MySQL Workbench model in this repository.

CREATE TABLE Dimension_Time (
  TimeKey INT NOT NULL,
  FullDate DATE NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Quarter INT NOT NULL,
  Year INT NOT NULL,
  MonthName VARCHAR(20) NOT NULL,
  PRIMARY KEY (TimeKey)
);

CREATE TABLE Dimension_Patient (
  PatientKey INT NOT NULL,
  PatientID INT NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PRIMARY KEY (PatientKey)
);

CREATE TABLE Dimension_Doctor (
  DoctorKey INT NOT NULL,
  DoctorID INT NOT NULL,
  DoctorName VARCHAR(100) NOT NULL,
  Specialization VARCHAR(100) NOT NULL,
  DoctorContact VARCHAR(100) NOT NULL,
  PRIMARY KEY (DoctorKey)
);

CREATE TABLE Dimension_Procedure (
  ProcedureKey INT NOT NULL,
  ProcedureID INT NOT NULL,
  ProcedureName VARCHAR(100) NOT NULL,
  PRIMARY KEY (ProcedureKey)
);

CREATE TABLE Fact_BillingPerformance (
  BillingPerformanceKey INT NOT NULL,
  InvoiceID INT NOT NULL,
  AppointmentID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  AppointmentCount INT NOT NULL,
  BillingCount INT NOT NULL,
  Dimension_Time_TimeKey INT NOT NULL,
  Dimension_BillingItem_BillingItemKey INT NOT NULL,
  Dimension_Procedure_ProcedureKey INT NOT NULL,
  Dimension_Doctor_DoctorKey INT NOT NULL,
  Dimension_Patient_PatientKey INT NOT NULL,
  PRIMARY KEY (BillingPerformanceKey),
  FOREIGN KEY (Dimension_Time_TimeKey) REFERENCES Dimension_Time (TimeKey),
  FOREIGN KEY (Dimension_BillingItem_BillingItemKey) REFERENCES Dimension_BillingItem (BillingItemKey),
  FOREIGN KEY (Dimension_Procedure_ProcedureKey) REFERENCES Dimension_Procedure (ProcedureKey),
  FOREIGN KEY (Dimension_Doctor_DoctorKey) REFERENCES Dimension_Doctor (DoctorKey),
  FOREIGN KEY (Dimension_Patient_PatientKey) REFERENCES Dimension_Patient (PatientKey)
);

CREATE TABLE Dimension_BillingItem (
  BillingItemKey INT NOT NULL,
  BillingItem VARCHAR(100) NOT NULL,
  PRIMARY KEY (BillingItemKey)
);
