-- Database table creation
-- This file creates the tables used for CPSC368
-- Project by Kourosh Shahbazi, Oliver Gullery, Riddhi Battu & Sam Thorne | 83910448

-- Creating schema


-- Adding in the tables:

CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    Name VARCHAR(30)
);

CREATE TABLE EmissionData (
    EmissionID INT PRIMARY KEY,
    CarbonDioxideEmissions FLOAT,
    NitrousOxideEmissions FLOAT,
    TotalGHGEmissions FLOAT,
    MethaneEmissions FLOAT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE HealthSystem (
    HealthSystemID INT PRIMARY KEY,
    CountryID INT,
    CompletenessOfBirthRegistration FLOAT,
    CompletenessOfDeathRegistration FLOAT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE HealthExpenditure (
    HealthSystemID INT PRIMARY KEY,
    PercentOfGDP FLOAT,
    PercentOfPublicFunded FLOAT,
    PercentOutOfPocketCosts FLOAT,
    PerCapita FLOAT,
    ExternalHealthExpenditure FLOAT,
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE HealthWorkers (
    HealthSystemID INT PRIMARY KEY,
    NumberOfNursesMidwives INT,
    NumberOfSpecialistSurgicalWorkforce INT,
    NumberOfPhysicians FLOAT,
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE HealthRiskFactors (
    HealthRiskFactorID INT PRIMARY KEY,
    CountryID INT,
    HealthSystemID INT,
    MaleTobaccoUse FLOAT,
    FemaleTobaccoUse FLOAT,
    IncidenceOfTuberculosis FLOAT,
    PrevalenceOfDiabetes FLOAT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
    FOREIGN KEY (HealthSystemID) REFERENCES HealthSystem(HealthSystemID)
);

CREATE TABLE PopulationCauseOfDeath (
    DeathID INT PRIMARY KEY,
    HealthRiskFactorID INT,
    Injuries FLOAT,
    NonCommunicableDiseases FLOAT,
    CommunicableDiseases FLOAT,
    FOREIGN KEY (HealthRiskFactorID) REFERENCES HealthRiskFactors(HealthRiskFactorID)
);

CREATE TABLE PrevalenceOfHIV (
    IncidenceOfHIV INT PRIMARY KEY,
    YouthMale FLOAT,
    YouthFemale FLOAT,
    WomanAge15Plus FLOAT
);


-- Adding Tuples:
-- Adding into Country:
