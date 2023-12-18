-- -----------------------------------------------------
-- Schema DBAPP
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS DBAPP;
-- CREATE SCHEMA IF NOT EXISTS DBAPP;
-- USE DBAPP;

-- -----------------------------------------------------
-- Table position
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS position (
  position_name 		VARCHAR(30) NOT NULL,
  PRIMARY KEY 			(position_name)
);
			
-- -----------------------------------------------------
-- Add records to position
-- -----------------------------------------------------
INSERT INTO position 
	VALUES
		('Dean'),
		('Professor'),
		('Assistant Professor'),
		('Associate Professor'),
		('IT Support Staff');
        
-- -----------------------------------------------------
-- Table department
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS department (
  department_name 		VARCHAR(50) NOT NULL,
  description 			VARCHAR(50) NULL,
  PRIMARY KEY 			(department_name)
);

-- -----------------------------------------------------
-- Add records to department
-- -----------------------------------------------------
INSERT INTO department
	VALUES
		('CCS', 'College of Computer Studies'),
		('COS', 'College of Science'),
		('COB', 'College of Business'),
		('COE', 'College of Engineering');   
        
-- -----------------------------------------------------
-- Table academic_year
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS academic_year(
  acad_year 		VARCHAR(30) NOT NULL,
  PRIMARY KEY 		(acad_year)
  );

-- -----------------------------------------------------
-- Add records to academic_year
-- -----------------------------------------------------
INSERT INTO academic_year
	VALUES
		('AY 2020-2021'),
		('AY 2021-2022'),
		('AY 2022-2023'),
		('AY 2023-2024');

-- -----------------------------------------------------
-- Table faculty_profile
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS faculty_profile (
  faculty_id         INT(5) NOT NULL,
  last_name          VARCHAR(20) NOT NULL,
  first_name         VARCHAR(20) NOT NULL,
  gender             ENUM('Male', 'Female') NOT NULL,
  department_name    VARCHAR(50) NOT NULL,
  position_name      VARCHAR(30) NOT NULL,
  date_of_birth      DATE NOT NULL,
  mobile_number      VARCHAR(15) NOT NULL,
  is_eligible        ENUM('Yes', 'No') NOT NULL,
  PRIMARY KEY        (faculty_id),
  UNIQUE INDEX       (mobile_number ASC),
  INDEX             (position_name ASC),
  INDEX             (department_name ASC),
  FOREIGN KEY       (position_name) REFERENCES position (position_name),
  FOREIGN KEY       (department_name) REFERENCES department (department_name)
);

-- -----------------------------------------------------
-- Add records to faculty_profile
-- -----------------------------------------------------     
INSERT INTO faculty_profile
	VALUES
		(10001, 'Smith', 'Emma', 		'Female', 'CCS', 'Professor', 			'1990-09-12', '9012345678', 'Yes'),
		(10002, 'Brown', 'Ava',  		'Female', 'COS', 'Dean', 	  			'1994-08-29', '9023456789', 'No'),
		(10003, 'Miller', 'Sophia', 	'Female', 'COB', 'Assistant Professor', '1988-12-01', '9034567890', 'Yes'),
		(10004, 'Wilson', 'Mia', 		'Female', 'COE', 'Associate Professor', '1985-06-27', '9045678901', 'Yes'),
		(10005, 'Taylor', 'Amelia', 	'Female', 'COS', 'Professor', 			'1997-09-22', '9056789012', 'No'),
		(10006, 'Hernandez', 'Benjamin','Male',   'CCS', 'IT Support Staff', 	'1993-08-18', '9067890123', 'Yes');


-- -----------------------------------------------------
-- Table applicant
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS applicant (
  applicant_id         INT NOT NULL,
  last_name            VARCHAR(20) NOT NULL,
  first_name           VARCHAR(20) NOT NULL,
  gender               ENUM('Male', 'Female') NOT NULL,
  position_name        VARCHAR(30) NOT NULL,
  application_date     DATE NOT NULL,
  qualifications       TEXT NOT NULL,
  date_of_birth        DATE NOT NULL,
  mobile_number        VARCHAR(15) NOT NULL,
  experiences          TEXT NULL,
  recom_faculty_id     INT(5) NOT NULL,
  PRIMARY KEY          (applicant_id),
  UNIQUE INDEX         (mobile_number ASC),
  INDEX               (position_name ASC),
  INDEX               (recom_faculty_id ASC),
  FOREIGN KEY         (position_name) REFERENCES position (position_name),
  FOREIGN KEY         (recom_faculty_id) REFERENCES faculty_profile (faculty_id)
);

-- -----------------------------------------------------
-- Add records to applicant (TO EDIT)
-- -----------------------------------------------------
INSERT INTO applicant
	VALUES
		(20001, 'Doe', 		'Jane', 	'Female', 	'Assistant Professor',	'2023-01-01', 'Ph.D. in Computer Science', 	'1990-05-15', 9394267508,'Previous teaching experience', 										10001),
		(20002, 'Johnson',  'Robert', 	'Male', 	'Professor',			'2023-02-15', 'M.S. in Chemistry', 			'1985-08-20', 9815670298,'Research experience in organic chemistry', 							10001),
		(20003, 'Williams', 'Emily', 	'Female', 	'Associate Professor',	'2023-03-20', 'Ph.D. in Economics', 		'1988-11-10', 9275186493,'Published research papers in economic journals', 						10002),
		(20004, 'Miller', 	'David', 	'Male', 	'Professor', 			'2023-04-12', 'Ph.D. in Physics', 			'1975-06-25', 9662907314,'Extensive teaching and research experience in theoretical physics', 	10002),
		(20005, 'Scott', 	'Mia', 		'Female', 	'Associate Professor', 	'2023-12-08', 'Advanced Degrees', 			'1997-02-10', 9937531806,'Specializes in automotive design and manufacturing processes',		10005),
		(20006, 'Alexander','Isabella', 'Female', 	'Professor', 			'2023-12-09', 'Grant-Funded Projects', 		'1984-06-12', 9213458029,'Expertise in machine learning algorithms and predictive analytics', 	10001);

-- -----------------------------------------------------
-- Table faculty_recruitment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS faculty_recruitment (
  recruitment_id 			INT(5) NOT NULL,
  applicant_id 				INT(5) NOT NULL,
  interview_date 			DATE NOT NULL,
  recruitment_status 		ENUM('Accepted', 'Rejected') NOT NULL,
  onboarding_date 			DATE NULL,
  PRIMARY KEY 				(recruitment_id),
  INDEX 					(applicant_id ASC),
    FOREIGN KEY 			(applicant_id)
    REFERENCES 				applicant (applicant_id)
);

-- -----------------------------------------------------
-- Add records to faculty_recruitment (no acad year yet)
-- -----------------------------------------------------
INSERT INTO faculty_recruitment 
	VALUES
		(30001, 20001, '2023-12-11', 'Rejected', NULL),
		(30002, 20002, '2023-12-11', 'Rejected', NULL),
		(30003, 20003, '2023-12-12', 'Rejected', NULL),
		(30004, 20004, '2023-12-12', 'Accepted', '2023-12-20'),
		(30005, 20005, '2023-12-13', 'Accepted', '2023-12-21'),
		(30006, 20006, '2023-12-13', 'Accepted', '2023-12-22');

-- -----------------------------------------------------
-- Table faculty_decision
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS faculty_decision (
  hiring_id 				INT(5) NOT NULL,
  recruitment_id 			INT(5) NOT NULL,
  department_name 			VARCHAR(50) NOT NULL,
  position_name 			VARCHAR(30) NOT NULL,
  acad_activities 			TEXT NOT NULL,
  responsibilities 			TEXT NOT NULL,
  acad_year 				VARCHAR(30) NOT NULL,
  PRIMARY KEY (hiring_id),
  INDEX  					(recruitment_id ASC),
  INDEX 					(position_name ASC),
  INDEX 					(department_name ASC),
    FOREIGN KEY 	(recruitment_id) REFERENCES faculty_recruitment (recruitment_id),
    FOREIGN KEY 	(position_name)  REFERENCES position (position_name),
    FOREIGN KEY 	(department_name)REFERENCES department (department_name),
	FOREIGN KEY 	(acad_year)		 REFERENCES academic_year(acad_year)
);

-- -----------------------------------------------------
-- Add records to faculty_decision
-- -----------------------------------------------------
INSERT INTO faculty_decision
	VALUES
		(40001, 30004, 'COS', 'Professor', 		  'Conducting research, teaching courses', 	'Mentoring students', 								 'AY 2020-2021'),
		(40002, 30005, 'COS', 'IT Support Staff', 'Malware Cleaning', 						'Providing technical support for IT infrastructure', 'AY 2023-2024'),
		(40003, 30006, 'CCS', 'Associate Professor', 'Teaching, research', 					'Contributing to academic leadership', 				 'AY 2023-2024');

-- -----------------------------------------------------
-- Table faculty_achievements
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS faculty_achievements (
  achievement_id 			INT(5) NOT NULL,
  faculty_id 				INT(5) NOT NULL,
  achievement_description 	LONGTEXT NULL,
  contribution 				TEXT NULL,
  project_name 				VARCHAR(45) NULL,
  PRIMARY KEY (achievement_id),
  INDEX 					 (faculty_id ASC),
  FOREIGN KEY (faculty_id)	REFERENCES faculty_profile (faculty_id)
);

-- -----------------------------------------------------
-- Add records to faculty_achievements 
-- -----------------------------------------------------   
INSERT INTO faculty_achievements 
	VALUES
		(89001, 10001, 'Published Research in Top Journals', 'Conducted extensive research and wrote comprehensive research', 'Achievements in Scientific Research'),
		(89002, 10001, 'Secured Significant Research Grants', 'Prepared detailed grant proposals and secured funding', 'Innovation in Biomedical Research'),
		(89003, 10003, 'Leadership in Academic Committee Contributions', 'Led initiatives to streamline committee processes', 'Academic Development and Improvement'),
		(89004, 10004, 'Interdisciplinary Collaboration Leading to Noteworthy Outcomes', 'Collaborated with multiple departments for interdisciplinary research', 'Exploration of Sustainable Technologies'),
		(89005, 10006, 'Innovative Course Development and Student Engagement', 'Designed new curriculum with interactive modules', 'Engaging Students in Computer Science');

-- -----------------------------------------------------
-- Table promotion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS promotion (
  evaluation_id 				INT(5) NOT NULL,
  faculty_id 					INT(5) NOT NULL,
  achievement_id 				INT(5) NOT NULL,
  qualifications 				TEXT NOT NULL,
  promotion_status 				ENUM('Accepted', 'Rejected') NOT NULL,
  transaction_date              DATE NOT NULL,
  PRIMARY KEY 					(evaluation_id),
  INDEX 						(faculty_id ASC),
  INDEX 						(achievement_id ASC),
    FOREIGN KEY (faculty_id)	REFERENCES faculty_profile (faculty_id),
    FOREIGN KEY (achievement_id)REFERENCES faculty_achievements (achievement_id)
);

-- -----------------------------------------------------
-- Add records to promotion
-- ----------------------------------------------------- 
INSERT INTO promotion
	VALUES
  		(50001, 10001, 89001, 'Ph.D. in Computer Science', 'Accepted', '2021-05-28'),
  		(50002, 10003, 89003, 'Ph.D. in Business Administration', 'Accepted', '2021-05-28'),
  		(50003, 10004, 89004, 'Ph.D. in Education, Research Experience', 'Rejected', '2023-03-19'),
  		(50004, 10006, 89005, 'Relevant IT Certification, Associate Degree in IT', 'Accepted', '2023-03-19');