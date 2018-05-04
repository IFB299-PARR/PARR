CREATE DATABASE IF NOT EXISTS `proto_musicschool`;
USE `proto_musicschool`;
Create table Students (
StudentID  int NOT NULL auto_increment,
FirstName varchar (60) NOT NULL,
LastName varchar (60) NOT NULL,
DOB date NOT NULL,
Address varchar (100) NOT NULL,
Sex enum ('Male','Female') NOT NULL,
PhoneNumber varchar (15) NOT NULL,
Email varchar (100) NOT NULL,
FacebookID int NULL,
TeacherInstrument enum ('Acoustic Guitar', 'Electric Guitar', 'Bass Guitar', 'Piano ','Cello','Drums','Violin','Voice','Saxophone','Harmonium', 'Tablas','Santurs','Vina') NOT NULL,
LessonDays enum ('Mon','Tues','Wed','Thurs','Fri','Sat','Sun'),
LessonTime time NOT NULL,
TeacherLanguageSkills enum ('English','Chinese','Spanish','Hindi','Arabic','Portuguese','Bengali','Russian','Japanese','Punjabi') NOT NULL,
TeacherInstrumentSkills enum ('Master','High','Mediocre') NOT NULL,
TeacherGender enum ('Male','Female')NOT NULL,
primary key (StudentID)
);

Create table Admins (
AdminID  int NOT NULL auto_increment,
FirstName varchar (60) NOT NULL,
LastName varchar (60) NOT NULL,
DOB date NOT NULL,
Sex enum ('Male','Female') NOT NULL,
PhoneNumber varchar (15) NOT NULL,
Email varchar (100) NOT NULL,
FacebookID int NULL,
primary key (AdminID)
);

create Table Teachers (
TeacherID int not null auto_increment,
FirstName varchar(60) not null,
LastName varchar (60) not null,
Sex enum ('Male','Female') not null,
DOB date not null,
Qualifications varchar (100) not null, #A couple of sentences on their education, teaching experience etc
Email varchar (100) not null,
PhoneNumber varchar (15) not null,
FacebookID int NULL,
Instrument enum ('Electric Guitar','Bass Guitar','Acoustic Guitar',  'Voice' ,  'Piano', 'Cello' , 'Drums',  'Harmonium' , 'Tablas', 'Santurs', 'Vina') not null,
Languages enum ('English','Chinese','Spanish','Hindi','Arabic','Portuguese','Bengali','Russian','Japanese','Punjabi') not null,
primary key (TeacherID));

create table Instruments (
InstrumentID int not null auto_increment,
InstrumentType enum ('Electric Guitar','Bass Guitar','Acoustic Guitar',  'Voice' ,  'Piano', 'Cello' , 'Drums',  'Harmonium' , 'Tablas', 'Santurs', 'Vina') not null,
HireCost int not null, #needs to be a static 10$ which is charged per week)
InstrumentCondition enum ('New','Excellent','Good','Repair','Discard') not null,
primary key (InstrumentID));

create table InstrumentHire (
HireID int not null auto_increment,
StudentID int not null,
InstrumentID int not null,
StartDate date not null,
EndDate date not null,
primary key (HireID),
foreign key (StudentID) references Students(StudentID),
foreign key (InstrumentID) references Instruments(InstrumentID));

create table TeachingSchedule (
ScheduleID int not null auto_increment,
TeacherID int not null,
TeachingDays enum ('Mon','Tues','Wed','Thurs','Fri','Sat','Sun') not null,
StartTime time not null,
EndTime time not null,
ScheduleStatus  enum ('Full','Empty'),
StudentID int not null,
primary key (ScheduleID),
foreign key (TeacherID) references Teachers (TeacherID),
foreign key (StudentID) references Students (StudentID));

create table contract (
ContractID int not null auto_increment,
StartDate date not null,
EndDate date not null,
LessonType enum ('Electric Guitar','Bass Guitar','Acoustic Guitar',  'Voice' ,  'Piano', 'Cello' , 'Drums',  'Harmonium' , 'Tablas', 'Santurs', 'Vina') not null,
Duration enum ('30 min','1 hour') not null,
Cost int not null,
StudentID int not null,
TeacherID int not null,
LessonDays enum ('Mon','Tues','Wed','Thurs','Fri','Sat','Sun') not null,
LessonTimes time not null,
primary key (ContractID),
foreign key (StudentID) references Students (StudentID));

create table TeacherFeedback (
FeedBackID int not null auto_increment,
TeacherID int not null,
Instrumentskill int not null,
LanguageSkil int not null,
TeachingSkill int not null,
FeedbackComment varchar (100) not null,
primary key (FeedbackID),
foreign key (TeacherID) references Teachers(TeacherID));



Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('Joel','White', '1998-09-23', '23 Astreet Elanora', 'Male', 0423876754,'jeff@gmail.com', 5000298, 'Electric Guitar','Mon', '13:00:00', 'English','Master','Male');



 Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('Joel','White', '1998-09-23', '23 Astreet Elanora', 'Male', 0423876754,'jeff@gmail.com', 5000298, 'Electric Guitar','Mon', '13:00:00', 'English','Master','Male');


insert into Teachers (FirstName,LastName,DOB, Sex, Qualifications, Email, PhoneNumber, FacebookID, Instrument, Languages)
values ('Jeff','Sniff', '1980-09-23','Male','Masters in Music at Griffith University', 'me@gmail.com',03486000, 4749427, 'Electric Guitar','English');

Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('Jake','Black', '1996-06-09', '19 Hooper Drive Currumbin', 'Male', 0490726754,'largeman@gmail.com', 12000249, 'Piano','Tues', '09:00:00', 'English','High','Male');


Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('Li','Jing', '2007-01-04', '29 Doteral Drive Burleigh Waters', 'Female', 0498052679,'ZhangWei@gmail.com', 4212379, 'Cello','Wed', '11:00:00', 'Chinese','Master','Female');


Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('James ','Rodríguez', '1991-07-12', '15 Colevale Lane Yeronga', 'Male', 0488032964,'James@gmail.com', 7830972, 'Vina','Sat', '16:00:00', 'Spanish','Mediocre','Male');

Insert into Students (FirstName,LastName,DOB,Address,Sex,PhoneNumber,Email,FacebookID, TeacherInstrument,LessonDays, LessonTime,TeacherLanguageSkills,TeacherInstrumentSkills, TeacherGender)
values ('Amara ','Khouri', '2003-12-13', '12 Raquel  Avenue Springwood', 'Female', 0458033982,'Layla@gmail.com', 3983991, 'Santurs','Mon', '12:00:00', 'Arabic','Master','Female');


Insert into Teachers (FirstName,LastName,Sex,DOB, Qualifications, Email, PhoneNumber,  Instrument, Languages)
values ('Tim ','Smith', 'Male', '1988-07-26', 'Masters Degree in Music Queensland Conservatorium', 'musicman@outlook.com',  0453035780, 'Electric Guitar', 'English');
Insert into Teachers  (`FirstName`, `LastName`, `Sex`, `DOB`, `Qualifications`, `Email`, `PhoneNumber`, `FacebookID`, `Instrument`, `Languages`) VALUES ('Pablo', 'García', 'Male', '1989-08-12', 'Studying Bachelors Degree in Music Queensland Conservatorium', 'pablo@gmail.com', '0456718291', '321326910', 'Vina', 'Spanish');
Insert into Teachers  (`FirstName`, `LastName`, `Sex`, `DOB`, `Qualifications`, `Email`, `PhoneNumber`, `FacebookID`, `Instrument`, `Languages`) VALUES ('Zara', 'Antoun', 'Female', '1982-06-04', 'Master Degree in music Australian Institute of Music', 'Zaraaa@outlook.com', '0467198471', '713512435', 'Santurs', 'Arabic');

INSERT INTO Instruments (`InstrumentType`, `HireCost`, `InstrumentCondition`) VALUES ( 'Piano', '30', 'New');




