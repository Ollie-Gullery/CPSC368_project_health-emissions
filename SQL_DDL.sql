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
    HealthSystemID INT PRIMARY KEY,
    PercentOfGDP DECIMAL,
    PercentOfPublicFunded DECIMAL,
    PercentOutOfPocketCosts DECIMAL,
    PerCapita DECIMAL,
    ExternalHealthExpenditure DECIMAL,
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE Environment.HealthWorkers (
    HealthSystemID INT PRIMARY KEY,
    NumberOfNursesMidwives INT,
    NumberOfSpecialistSurgicalWorkforce INT,
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
    IncidenceOfHIV INT,
    DeathID INT,
    YouthMale DECIMAL,
    YouthFemale DECIMAL,
    WomanAge15Plus DECIMAL,
    PRIMARY KEY (IncidenceOfHIV, DeathID),
    FOREIGN KEY (DeathID) REFERENCES PopulationCauseOfDeath(DeathID)
);


-- Adding Tuples:
-- Adding into Country:
