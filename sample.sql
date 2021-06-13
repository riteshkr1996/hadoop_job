use my_db;

create table if not exists hr_data (
Employee_Name varchar(50), 
EmpID int, 
MarriedID tinyint,  
DeptID smallint, 
Salary int,  
PositionID smallint,
Position string, 
State varchar(5), 
Zip int, 
DOB date,
Sex char(1), 
MaritalDesc varchar(20),
CitizenDesc varchar(50), 
DateofHire date, 
Department varchar(100), 
ManagerName varchar(50), 
ManagerID decimal(3,1), 
PerformanceScore varchar(50))

ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/ritesh/Desktop/HRdata_temp.csv' into table hr_data;
