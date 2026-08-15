CREATE DATABASE road_accident_analysis;

USE road_accident_analysis;

CREATE TABLE Dim_Governorate (
    Governorate_Key INT PRIMARY KEY,
    `Governorate ID` VARCHAR(10),
    Governorate VARCHAR(100)
);
CREATE TABLE Dim_Year (
    Year_ID INT PRIMARY KEY,
    Year INT
);
CREATE TABLE Dim_Month (
    Month_ID INT PRIMARY KEY,
    Month VARCHAR(20)
);
CREATE TABLE Dim_Gender (
    Gender_ID INT PRIMARY KEY,
    Gender VARCHAR(20)
);
CREATE TABLE Dim_Age (
    Age_ID INT PRIMARY KEY,
    Age_Group VARCHAR(20)
);
CREATE TABLE Dim_Road_User (
    RoadUser_ID INT PRIMARY KEY,
    Road_User_Type VARCHAR(50)
);
CREATE TABLE Dim_Vehicle (
    Vehicle_ID INT PRIMARY KEY,
    Vehicle_Type VARCHAR(50)
);
SHOW TABLES;
CREATE TABLE Fact_Monthly (
    Governorate_Key INT,
    Year_ID INT,
    Month_ID INT,
    Injuries INT,
    Deaths INT
);
CREATE TABLE Fact_Age (
    Governorate_Key INT,
    Year_ID INT,
    Age_ID INT,
    Injuries INT,
    Deaths INT
);
CREATE TABLE Fact_Gender (
    Governorate_Key INT,
    Year_ID INT,
    Gender_ID INT,
    Injuries INT,
    Deaths INT
);
CREATE TABLE Fact_RoadUser (
    Governorate_Key INT,
    Year_ID INT,
    RoadUser_ID INT,
    Injuries INT,
    Deaths INT
);
CREATE TABLE Fact_Vehicle (
    Governorate_Key INT,
    Year_ID INT,
    Vehicle_ID INT,
    Injuries INT,
    Deaths INT
);
CREATE TABLE Fact_Population (
    Governorate_Key INT,
    Year_ID INT,
    Gender_ID INT,
    Population INT
);
CREATE TABLE Fact_Ambulance (
    Governorate_Key INT,
    Year_ID INT,
    `Number Of Ambulances` INT,
    `Number Of Ambulance Points` INT
);
SHOW TABLES;

SELECT * 
FROM Dim_Governorate;
SELECT COUNT(*) AS Total_Governorates
FROM Dim_Governorate;

SELECT * FROM Dim_Year;
SELECT COUNT(*) AS Total_Years
FROM Dim_Year;

SELECT * FROM Dim_Month;
SELECT COUNT(*) AS Total_Months
FROM Dim_Month;

SELECT * FROM Dim_Gender;
SELECT COUNT(*) AS Total_Genders
FROM Dim_Gender;

SELECT * FROM Dim_Age;
SELECT COUNT(*) AS Total_Age_Groups
FROM Dim_Age;

SELECT * FROM Dim_Road_User;
SELECT COUNT(*) AS Total_Road_User_Types
FROM Dim_Road_User;

USE road_accident_analysis;

SELECT 'Dim_Governorate' AS Table_Name, COUNT(*) AS Row_Count
FROM Dim_Governorate
UNION ALL
SELECT 'Dim_Year', COUNT(*) FROM Dim_Year
UNION ALL
SELECT 'Dim_Month', COUNT(*) FROM Dim_Month
UNION ALL
SELECT 'Dim_Gender', COUNT(*) FROM Dim_Gender
UNION ALL
SELECT 'Dim_Age', COUNT(*) FROM Dim_Age
UNION ALL
SELECT 'Dim_Road_User', COUNT(*) FROM Dim_Road_User
UNION ALL
SELECT 'Dim_Vehicle', COUNT(*) FROM Dim_Vehicle
UNION ALL
SELECT 'Fact_Monthly', COUNT(*) FROM Fact_Monthly
UNION ALL
SELECT 'Fact_Age', COUNT(*) FROM Fact_Age
UNION ALL
SELECT 'Fact_Gender', COUNT(*) FROM Fact_Gender
UNION ALL
SELECT 'Fact_RoadUser', COUNT(*) FROM Fact_RoadUser
UNION ALL
SELECT 'Fact_Vehicle', COUNT(*) FROM Fact_Vehicle
UNION ALL
SELECT 'Fact_Population', COUNT(*) FROM Fact_Population
UNION ALL
SELECT 'Fact_Ambulance', COUNT(*) FROM Fact_Ambulance;

SELECT * FROM Fact_Monthly LIMIT 5;

SELECT * FROM Fact_Age LIMIT 5;

SELECT * FROM Fact_Gender LIMIT 5;

SELECT * FROM Fact_RoadUser LIMIT 5;

SELECT * FROM Fact_Vehicle LIMIT 5;

SELECT * FROM Fact_Population LIMIT 5;

SELECT * FROM Fact_Ambulance LIMIT 5;






-- 1. total injuries and deaths

select
    sum(Injuries) as total_injuries,
    sum(Deaths) as total_deaths
from Fact_Monthly;


-- 2. total casualties
select
    sum(Injuries) + sum(Deaths) as total_casualties
from Fact_Monthly;

-- 3
-- 3. injuries and deaths by year

select
    y.Year,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Monthly f
join Dim_Year y
    on f.Year_ID = y.Year_ID
group by y.Year;



-- 4. injuries and deaths by month

select
    m.Month,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Monthly f
join Dim_Month m
    on f.Month_ID = m.Month_ID
group by m.Month_ID, m.Month;


-- 5. highest month by casualties

select
    m.Month,
    sum(f.Injuries) + sum(f.Deaths) as total_casualties
from Fact_Monthly f
join Dim_Month m
    on f.Month_ID = m.Month_ID
group by m.Month_ID, m.Month
order by total_casualties desc
limit 1;


-- 6. lowest month by casualties

select
    m.Month,
    sum(f.Injuries) + sum(f.Deaths) as total_casualties
from Fact_Monthly f
join Dim_Month m
    on f.Month_ID = m.Month_ID
group by m.Month_ID, m.Month
order by total_casualties
limit 1;


-- 7. injuries and deaths by governorate

select
    g.Governorate,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths,
    sum(f.Injuries) + sum(f.Deaths) as total_casualties
from Fact_Monthly f
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
group by g.Governorate_Key, g.Governorate;


-- 8. injuries and deaths by governorate and year

select
    g.Governorate,
    y.Year,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Monthly f
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
join Dim_Year y
    on f.Year_ID = y.Year_ID
group by
    g.Governorate,
    y.Year;
    
    
-- 9. top governorates by casualties

select
    g.Governorate,
    sum(f.Injuries) + sum(f.Deaths) as total_casualties
from Fact_Monthly f
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
group by g.Governorate
order by total_casualties desc
limit 10;


-- 10. population by governorate and year
select
    g.Governorate,
    y.Year,
    sum(f.Population) as total_population
from Fact_Population f
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
join Dim_Year y
    on f.Year_ID = y.Year_ID
group by
    g.Governorate,
    y.Year;




-- 11. death rate per 100,000

select
    g.Governorate,
    sum(f.Deaths) as total_deaths,
    sum(p.Population) as total_population,
    round(sum(f.Deaths) * 100000.0 / sum(p.Population),2) as death_rate
from Fact_Gender f
join Fact_Population p
    on f.Governorate_Key = p.Governorate_Key
    and f.Year_ID = p.Year_ID
    and f.Gender_ID = p.Gender_ID
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
group by g.Governorate;


-- 12. injury rate per 100,000

select
    g.Governorate,
    sum(f.Injuries) as total_injuries,
    sum(p.Population) as total_population,
    round(sum(f.Injuries) * 100000.0 / sum(p.Population), 2) as injury_rate
from Fact_Gender f
join Fact_Population p
    on f.Governorate_Key = p.Governorate_Key
    and f.Year_ID = p.Year_ID
    and f.Gender_ID = p.Gender_ID
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
group by g.Governorate;

    
-- 13. injuries and deaths by age group

select
    a.Age_Group,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Age f
join Dim_Age a
    on f.Age_ID = a.Age_ID
group by a.Age_ID, a.Age_Group;

-- 14. injuries and deaths by gender

select
    g.Gender,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Gender f
join Dim_Gender g
    on f.Gender_ID = g.Gender_ID
group by g.Gender_ID, g.Gender;


-- 15. injuries and deaths by road user

select
    r.Road_User_Type,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_RoadUser f
join Dim_Road_User r
    on f.RoadUser_ID = r.RoadUser_ID
group by r.Road_User_Type;


-- 16. injuries and deaths by vehicle type

select
    v.Vehicle_Type,
    sum(f.Injuries) as total_injuries,
    sum(f.Deaths) as total_deaths
from Fact_Vehicle f
join Dim_Vehicle v
    on f.Vehicle_ID = v.Vehicle_ID
group by v.Vehicle_Type;


-- 17. ambulances and ambulance points by governorate

select
    g.Governorate,
    sum(f.`Number Of Ambulances`) as total_ambulances,
    sum(f.`Number Of Ambulance Points`) as total_ambulance_points
from Fact_Ambulance f
join Dim_Governorate g
    on f.Governorate_Key = g.Governorate_Key
group by g.Governorate;



