-- Database table creation
-- This file creates the tables used for CPSC368
-- Project by Kourosh Shahbazi, Oliver Gullery, Riddhi Battu & Sam Thorne | 83910448

-- Creating schema
CREATE SCHEMA Environment;

-- Adding in the tables:

CREATE TABLE Environment.Country (
    CountryID INT,
    Name VARCHAR(30),
    PRIMARY KEY (CountryID),
    UNIQUE (CountryID, Name)
);

CREATE TABLE Environment.EmissionData (
    EmissionID INT PRIMARY KEY,
    CarbonDioxideEmissions DECIMAL,
    NitrousOxideEmissions DECIMAL,
    TotalGHGEmissions DECIMAL,
    MethaneEmissions DECIMAL,
    CountryID INT,
    Name VARCHAR(30),
    FOREIGN KEY (CountryID, Name) REFERENCES Country(CountryID, Name)
);

CREATE TABLE Environment.HealthSystem (
    HealthSystemID INT PRIMARY KEY,
    CountryID INT,
    CompletenessOfBirthRegistration DECIMAL,
    CompletenessOfDeathRegistration DECIMAL,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE Environment.HealthExpenditure (
    HealthExpenditureID INT,
    HealthSystemID INT,
    PercentOfGDP DECIMAL,
    PercentOfPublicFunded DECIMAL,
    PercentOutOfPocketCosts DECIMAL,
    PerCapita DECIMAL,
    ExternalHealthExpenditure DECIMAL,
    PRIMARY KEY(HealthExpenditureID, HealthSystemID),
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE Environment.HealthWorkers (
    HealthWorkerID INT PRIMARY KEY,
    HealthSystemID INT,
    NumberOfNursesMidwives DECIMAL,
    NumberOfSpecialistSurgicalWorkforce DECIMAL,
    NumberOfPhysicians DECIMAL,
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE Environment.HealthRiskFactors (
    HealthRiskFactorID INT PRIMARY KEY,
    CountryID INT,
    HealthSystemID INT,
    MaleTobaccoUse DECIMAL,
    FemaleTobaccoUse DECIMAL,
    IncidenceOfTuberculosis DECIMAL,
    PrevalenceOfDiabetes DECIMAL,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE Environment.PopulationCauseOfDeath (
    DeathID INT PRIMARY KEY,
    HealthRiskFactorID INT,
    Injuries DECIMAL,
    NonCommunicableDiseases DECIMAL,
    CommunicableDiseases DECIMAL,
    FOREIGN KEY (HealthRiskFactorID) REFERENCES HealthRiskFactors(HealthRiskFactorID)
);

CREATE TABLE Environment.PrevalenceOfHIV (
    HIVID INT,
    IncidenceOfHIV DECIMAL,
    DeathID INT,
    YouthMale DECIMAL,
    YouthFemale DECIMAL,
    WomanAge15Plus DECIMAL,
    PRIMARY KEY (HIVID, DeathID),
    FOREIGN KEY (DeathID) REFERENCES PopulationCauseOfDeath(DeathID)
);

-- change incidence of HIV primary key
-- Adding Tuples:
-- Adding into Country:
