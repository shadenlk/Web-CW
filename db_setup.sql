DROP DATABASE IF EXISTS accom;
CREATE DATABASE accom;
USE accom;

CREATE TABLE Building (
    BuildingID 			SMALLINT AUTO_INCREMENT NOT NULL,
    B_Name 					VARCHAR(255),
    B_Address 				VARCHAR(255),
    B_Maintenance	 		ENUM('Y', 'N'),
    PRIMARY KEY (BuildingID)
);

CREATE TABLE Room (
    RoomID          		INT(6) NOT NULL,
    BuildingID     		SMALLINT NOT NULL,
    R_RoomBand      		ENUM('A', 'B', 'C', 'D', 'E'),
    R_Status        		ENUM ('Occupied', 'Unoccupied'),
    R_TenancyStart  		DATE,
    R_TenancyEnd    		DATE,
    R_Maintenance   		ENUM('Y', 'N'),
    PRIMARY KEY (RoomID),
    FOREIGN KEY (BuildingID) REFERENCES Building (BuildingID)
);

CREATE TABLE Studio (
    BuildingID      SMALLINT NOT NULL,
    StudioNumber    VARCHAR(255) NOT NULL,
    RoomID          INT(6) NOT NULL,
    Studio_Floor    VARCHAR(255) NOT NULL,
    PRIMARY KEY (StudioNumber),
    FOREIGN KEY (BuildingID) REFERENCES Building (BuildingID),
    FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
);

CREATE TABLE Single (
	 BuildingID      		SMALLINT NOT NULL,
    SingleNumber    		VARCHAR(255) NOT NULL,
    RoomID          		INT(6) NOT NULL,
    Single_Floor    		VARCHAR(255) NOT NULL,
    PRIMARY KEY (SingleNumber),
    FOREIGN KEY (BuildingID) REFERENCES Building (BuildingID),
    FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
);

CREATE TABLE Shared (
	 BuildingID      SMALLINT NOT NULL,
    SharedNumber    VARCHAR(255) NOT NULL,
    RoomID          INT(6) NOT NULL,
    Shared_Floor    VARCHAR(255) NOT NULL,
    PRIMARY KEY (SharedNumber),
    FOREIGN KEY (BuildingID) REFERENCES Building (BuildingID),
    FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
    
    
);

CREATE TABLE Student (
    URN 						INT(6) UNIQUE NOT NULL,
    ST_FirstName 			VARCHAR(255) NOT NULL,
    ST_Surname 			VARCHAR(255) NOT NULL,
    ST_DOB 					DATE NOT NULL,
    ST_Email 				VARCHAR(255) NOT NULL,
    ST_Degree 				VARCHAR(255) NOT NULL,
    ST_Town 				VARCHAR(255) NOT NULL,
    ST_Street 				VARCHAR(255) NOT NULL,
    ST_PostCode 			VARCHAR(255) NOT NULL,
    ST_PhoneNumber	 	VARCHAR(10),
    PRIMARY KEY (URN)
);

CREATE TABLE Employee (
    EMP_ID 					INT(6) UNIQUE NOT NULL,
    EMP_Firstname 		VARCHAR(255) NOT NULL,
    EMP_Surname 			VARCHAR(255) NOT NULL,
    EMP_Role 				ENUM('Supervisor', 'Junior'),
    EMP_Department	 	VARCHAR(255) NOT NULL,
    EMP_Email				VARCHAR(255) NOT NULL,
    EMP_Phone				VARCHAR(10),
    PRIMARY KEY (EMP_ID)
);
    
CREATE TABLE Account (
    URN                 INT(6) UNIQUE NOT NULL,
    RoomID              INT(6) UNIQUE NOT NULL,
    APP_FirstName       VARCHAR(255) NOT NULL,
    APP_Surname         VARCHAR(255) NOT NULL,
    APP_Email           VARCHAR(255) NOT NULL,
    APP_TermLength      VARCHAR(255) NOT NULL,
    APP_PaymentStatus   VARCHAR(255) NOT NULL,
    PRIMARY KEY (URN),
    FOREIGN KEY (RoomID) REFERENCES Room (RoomID),
    FOREIGN KEY (URN) REFERENCES Student (URN)
);

INSERT INTO Building (B_Name, B_Address, B_Maintenance) VALUES 
    ('Marie Curie Residence', '123 Main Street', 'Y'),
    ('Rosalind Franklin Tower', '456 Oak Avenue', 'Y'),
    ('Jane Goodall Plaza', '789 Park Lane', 'Y'),
    ('Ada Lovelace Apartments', '101 Pine Street', 'Y'),
    ('Lise Meitner Gardens', '202 Maple Avenue', 'Y'),
    ('Emmy Noether Heights', '303 Elm Boulevard', 'N'),
    ('Grace Hopper Towers', '404 Cedar Lane', 'Y');
   
INSERT INTO Student VALUES 
	(233468, 'John', 'White', '1990-01-01', 'john.doe@surrey.ac.uk', 'Computer Science', 'Cityville', '123 Main St', 'ABC 123', '1234567890'),
  	(557890, 'Jane', 'Smith', '1992-05-15', 'jane.smith@surrey.ac.uk', 'Physics', 'Townton', '456 Oak St', 'XYZ 456', '9876543210'),
  	(567889, 'Alice', 'Wonderland', '1995-03-20', 'alice.wonderland@surrey.ac.uk', 'Literature', 'Dreamland', '789 Wonderland Ave', 'DEF 789', '2357965431'),
  	(685764, 'Bob', 'Johnson', '1988-09-10', 'bob.johnson@surrey.ac.uk', 'History', 'Historic Town', '567 History Blvd', 'HIJ 567', '8765432109'),
  	(234567, 'Eva', 'Williams', '1994-12-05', 'eva.williams@surrey.ac.uk', 'Mathematics', 'Math City', '321 Calculus Lane', 'MNO 321', '7654321098'),
  	(987643, 'David', 'Miller', '1997-07-18', 'david.miller@surrey.ac.uk', 'Chemistry', 'Labtown', '987 Science Rd', 'PQR 987', '6543210987'),
  	(213456, 'Sophie', 'Brown', '1991-11-30', 'sophie.brown@surrey.ac.uk', 'English', 'Litville', '456 Novel St', 'STU 456', '5432109876'),
 	(444789, 'Chris', 'Jones', '1993-04-25', 'chris.jones@surrey.ac.uk', 'Engineering', 'Tech City', '789 Tech Blvd', 'UVW 789', '4321098765'),
 	(754321, 'Grace', 'Anderson', '1998-02-15', 'grace.anderson@surrey.ac.uk', 'Psychology', 'Mindville', '654 Mind St', 'XYZ 654', '3210987654'),
 	(134660, 'Michael', 'Lee', '1987-06-08', 'michael.lee@surrey.ac.uk', 'Political Science', 'Policytown', '123 Policy Ave', 'ABC 123', '2109876543');
   
INSERT INTO Employee (EMP_ID, EMP_Firstname, EMP_Surname, EMP_Role, EMP_Department, EMP_Email, EMP_Phone)
VALUES
  	(101555, 'Jack', 'Brown', 'Supervisor', 'Management', 'jack.brown@surreystaff.ac.uk', '1234567890'),
  	(305552, 'Emily', 'Jones', 'Junior', 'Student support', 'emily.jones@surreystaff.ac.uk', '9876543210'),
  	(305099, 'Alex', 'Johnson', 'Supervisor', 'Reception', 'alex.johnson@surreystaff.ac.uk', '8765432109'),
 	(400099, 'Charlie', 'Davis', 'Junior', 'Management', 'charlie.davis@surreystaff.ac.uk', '7654321098'),
 	(570775, 'Olivia', 'Smith', 'Supervisor', 'Student support', 'olivia.smith@surreystaff.ac.uk', '6543210987');
   
INSERT INTO Room (RoomID, BuildingID, R_RoomBand, R_Status, R_TenancyStart, R_TenancyEnd, R_Maintenance)
VALUES
    (40123, 5, 'B', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (50202, 3, 'C', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (60110, 1, 'D', 'Occupied', '2023-09-025', '2023-01-26', 'Y'),
    (70415, 7, 'E', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (80333, 4, 'A', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (90221, 2, 'B', 'Occupied', '2024-02-05', '2024-06-07', 'Y'),
    (100144, 6, 'C', 'Unoccupied', NULL, NULL, 'N'),
    (110011, 4, 'D', 'Unoccupied', NULL, NULL, 'N'),
    (120067, 2, 'E', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (130023, 5, 'A', 'Unoccupied', NULL, NULL, 'N'),
    (140077, 4, 'B', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (150045, 1, 'C', 'Unoccupied', NULL, NULL, 'N'),
    (160099, 7, 'D', 'Occupied', '2024-02-05', '2024-06-07', 'Y'),
    (170055, 3, 'E', 'Occupied', '2023-09-25', '2024-06-07', 'Y'),
    (180033, 2, 'A', 'Unoccupied', NULL, NULL, 'N');

INSERT INTO Studio (BuildingID, StudioNumber, RoomID, Studio_Floor)
VALUES
    (1, 'S001', 60110, '1st Floor'),
    (2, 'S002', 90221, '2nd Floor'),
    (1, 'S003', 150045, '2nd Floor'),
    (2, 'S004', 120067, '3rd Floor'),
    (2, 'S005', 180033, '1st Floor');

INSERT INTO Single (BuildingID, SingleNumber, RoomID, Single_Floor)
VALUES
    (3, 'SGL001', 50202, '4th Floor'),
    (4, 'SGL002', 80333, '5th Floor'),
    (4, 'SGL003', 110011, '5th Floor'),
    (4, 'SGL004', 140077, '3rd Floor'),
    (3, 'SGL005', 170055, '5th Floor');

INSERT INTO Shared (BuildingID, SharedNumber, RoomID, Shared_Floor)
VALUES
    (5, 'SHR001', 40123, '6th Floor'),
    (7, 'SHR002', 70415, '9th Floor'),
    (6, 'SHR003', 100144, '10th Floor'),
    (5, 'SHR004', 130023, '4th Floor'),
    (7, 'SHR005', 160099, '6th Floor');

INSERT INTO Account (URN, RoomID, APP_FirstName, APP_Surname, APP_Email, APP_TermLength, APP_PaymentStatus)
VALUES
    (233468, 40123, 'John', 'White', 'john.white@surrey.ac.uk', '38 weeks', 'Paid'),
    (557890, 50202, 'Jane', 'Smith', 'jane.smith@surrey.ac.uk', '38 weeks', 'Pending'),
    (567889, 60110, 'Alice', 'Wonderland', 'alice.wonderland@surrey.ac.uk', '19 weeks', 'Paid'),
    (685764, 70415, 'Bob', 'Johnson', 'bob.johnson@surrey.ac.uk', '38 weeks', 'Pending'),
    (234567, 80333, 'Eva', 'Williams', 'eva.williams@surrey.ac.uk', '38 weeks', 'Paid'),
    (987643, 90221, 'David', 'Miller', 'david.miller@surrey.ac.uk', '19 weeks', 'Paid'),
    (213456, 120067, 'Sophie', 'Brown', 'sophie.brown@surrey.ac.uk', '38 weeks', 'Pending'),
    (444789, 140077, 'Chris', 'Jones', 'chris.jones@surrey.ac.uk', '38 weeks', 'Paid'),
    (754321, 160099, 'Grace', 'Anderson', 'grace.anderson@surrey.ac.uk', '19 weeks', 'Pending'),
    (134660, 170055, 'Michael', 'Lee', 'michael.lee@surrey.ac.uk', '38 weeks', 'Paid');
