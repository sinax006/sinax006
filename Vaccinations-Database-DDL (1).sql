CREATE TABLE Persons (
    Email           VARCHAR(128) NOT NULL,
    First_Name      VARCHAR(50) NOT NULL,
    Last_Name       VARCHAR(50) NOT NULL,
    Date_of_Birth   DATE NOT NULL,
    Sex             CHAR(1) NOT NULL,
    
    PRIMARY KEY (Email),
    CHECK (Sex IN ('M', 'F'))
);

CREATE TABLE Nurses (
    Email   VARCHAR(128) NOT NULL,
    
    FOREIGN KEY (Email) REFERENCES Persons(Email),
    PRIMARY KEY (Email)
);

CREATE TABLE Cities (
    City    VARCHAR(20) NOT NULL,
    State   VARCHAR(20) NOT NULL,

    PRIMARY KEY (City, State)
);

CREATE TABLE Vaccine_Providers (
    Company VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (Company)
);

CREATE TABLE Vaccination_Sites (
    Site    VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City    VARCHAR(20) NOT NULL,
    State   VARCHAR(20) NOT NULL,
    Opens   TIME NOT NULL,
    Closes  TIME NOT NULL,

    PRIMARY KEY (Site),
    FOREIGN KEY (City, State) REFERENCES Cities (City, State),
    CHECK (Closes > Opens)
);

CREATE TABLE Vaccinations (
    Recipient           VARCHAR(128) NOT NULL,
    Vaccination_Time    DATETIME NOT NULL,
    Vaccine             VARCHAR(20) NOT NULL,
    Site                VARCHAR(20) NOT NULL,
    Nurse               VARCHAR(128) NOT NULL,
    Comments            VARCHAR(100) NULL,
    
    PRIMARY KEY (Recipient, Vaccination_Time),
    FOREIGN KEY (Recipient) REFERENCES Persons (Email),
    FOREIGN KEY (Vaccine) REFERENCES Vaccine_Providers (Company),
    FOREIGN KEY (Site) REFERENCES Vaccination_Sites (Site),
    FOREIGN KEY (Nurse) REFERENCES Nurses(Email)
);
