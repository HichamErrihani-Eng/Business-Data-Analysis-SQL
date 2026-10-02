-- Industrial Downtime & OEE Analytics
-- Schema: Star Schema with 1 Fact and 3 Dimensions

CREATE TABLE Dim_Site (
    SiteID INT PRIMARY KEY,
    SiteName VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE Dim_ProductionLine (
    LineID INT PRIMARY KEY,
    LineName VARCHAR(50),
    SiteID INT FOREIGN KEY REFERENCES Dim_Site(SiteID)
);

CREATE TABLE Dim_Time (
    TimeID INT PRIMARY KEY,
    EventDate DATE,
    Shift VARCHAR(20)
);

CREATE TABLE Fact_Downtime (
    DowntimeID INT PRIMARY KEY,
    LineID INT FOREIGN KEY REFERENCES Dim_ProductionLine(LineID),
    TimeID INT FOREIGN KEY REFERENCES Dim_Time(TimeID),
    DowntimeMinutes INT,
    CauseCategory VARCHAR(50),
    ErrorCode VARCHAR(20)
);

-- Calculate OEE (Simplified Example)
-- OEE = Availability * Performance * Quality
-- Availability = Run Time / Planned Production Time
-- Performance = Ideal Cycle Time / Actual Cycle Time
-- Quality = Good Units / Total Units
