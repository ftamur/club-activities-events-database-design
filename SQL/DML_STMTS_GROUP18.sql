PRAGMA foreign_keys = OFF;

-- UPDATE - SQL

--class
UPDATE class
SET class_capacity = 60
WHERE class_id = "Z10" AND faculty_id = "CASE";

UPDATE class
SET class_capacity = 70
WHERE class_id = "Z20" AND faculty_id = "SOS";

UPDATE class
SET class_capacity = 50
WHERE class_id = "Z30" AND faculty_id = "LAW";

UPDATE class
SET class_capacity = 75
WHERE class_id = "Z40" AND faculty_id = "MED";

UPDATE class
SET class_capacity = 80
WHERE class_id = "120" AND faculty_id = "ENG";

--club
UPDATE club
SET club_name = "Visual Arts Club"
WHERE club_name = "Cinema Club";

UPDATE club
SET club_name = "Professional Astrology Club"
WHERE club_name = "Amateur Astronomy Club";

UPDATE club
SET club_name = "Bioinformatics Research Club"
WHERE club_name = "Biology and Genetics Society";

UPDATE club
SET club_name = "Biochemistry Club"
WHERE club_name = "Chemistry Society";

UPDATE club
SET club_name = "ACM"
WHERE club_name = "Computer Club";


--club_event
UPDATE club_event
SET club_event_start_date = '2002-01-01'
WHERE club_event_id = 1;

UPDATE club_event
SET club_event_start_date = '2003-01-01'
WHERE club_event_id = 2;

UPDATE club_event
SET club_event_start_date = '2005-01-01'
WHERE club_event_id = 4;

UPDATE club_event
SET club_event_start_date = '2006-01-01'
WHERE club_event_id = 3;

UPDATE club_event
SET club_event_start_date = '2007-01-01'
WHERE club_event_id = 2;

--club_member
UPDATE club_member
SET role_id = 0
WHERE member_id = 1;

UPDATE club_member
SET role_id = 0
WHERE student_id = 2;

UPDATE club_member
SET role_id = 0
WHERE student_id = 3;

UPDATE club_member
SET role_id = 0
WHERE student_id = 4;

UPDATE club_member
SET role_id = 0
WHERE student_id = 5;

--club_member_role
UPDATE club_member_role
SET role_name = "No Roles"
WHERE role_id = 0;

UPDATE club_member_role
SET role_name = "Ordinary"
WHERE role_id = 0;

UPDATE club_member_role
SET role_name = "Project Manager"
WHERE role_id = 1;

UPDATE club_member_role
SET role_name = "Project Leader"
WHERE role_id = 1;

UPDATE club_member_role
SET role_name = "Leader"
WHERE role_id = 2;

UPDATE club_member_role
SET role_name = "President"
WHERE role_id = 2;

--committee
UPDATE committee
SET committee_name = "Other"
WHERE committee_id = 41;

UPDATE committee
SET committee_name = "Marketing"
WHERE committee_id = 41;

UPDATE committee
SET committee_name = "Other"
WHERE committee_id = 42;

UPDATE committee
SET committee_name = "Sponsorship"
WHERE committee_id = 43;

--faculty
UPDATE faculty
SET faculty_name = "College of Business"
WHERE faculty_id = "CASE";

UPDATE faculty
SET faculty_name = "College of Administrative Sciences and Economic"
WHERE faculty_id = "CASE";

UPDATE faculty
SET faculty_name = "College of Social Sciences and Art"
WHERE faculty_id = "SOS";

UPDATE faculty
SET faculty_name = "College of Natural Sciences"
WHERE faculty_id = "SCI";

UPDATE faculty
SET faculty_name = "Rahmi M. Ko� College of Engineering and Design"
WHERE faculty_id = "ENG";

--sponsor
UPDATE sponsor
SET sponsor_contact_number = 5418303472
WHERE sponsor_name = "ARCELIK";

UPDATE sponsor
SET sponsor_email = "sponsorship_arcelik@arcelik.com"
WHERE sponsor_name = "ARCELIK";

UPDATE sponsor
SET sponsor_email = "registrar@ku.edu.tr"
WHERE sponsor_name = "KOC";

UPDATE sponsor
SET sponsor_contact_number = 5418503472
WHERE sponsor_name = "KOC";

UPDATE sponsor
SET sponsor_email = "iletisimmerkezi@coca-cola.com"
WHERE sponsor_name = "COCA COLA";

--sponsorship
UPDATE sponsorship
SET donation_amount = 12000
WHERE sponsor_name = "INDEX GROUP" AND committee_id = 1;

UPDATE sponsorship
SET donation_amount = 4000
WHERE sponsor_name = "ARCELIK" AND committee_id = 2;

UPDATE sponsorship
SET donation_amount = 21000
WHERE sponsor_name = "KOC" AND committee_id = 3;

UPDATE sponsorship
SET donation_amount = 16000
WHERE sponsor_name = "REDBULL" AND committee_id = 4;

UPDATE sponsorship
SET donation_amount = 17000
WHERE sponsor_name = "COCA COLA" AND committee_id = 5;

--student
UPDATE student
SET student_email = "abasar16@ku.edu.tr"
WHERE student_id = 2;

UPDATE student
SET student_email = "ftamur15@ku.edu.tr"
WHERE student_id = 1;

UPDATE student
SET student_email = "hrennie17@ku.edu.tr"
WHERE student_id = 3;

UPDATE student
SET student_email = "robson19@ku.edu.tr"
WHERE student_id = 4;

UPDATE student
SET student_email = "kdonnelly18@ku.edu.tr"
WHERE student_id = 5;

--ticket
UPDATE ticket
SET event_id = 4
WHERE ticket_id = 5;

UPDATE ticket
SET event_id = 5
WHERE ticket_id = 4;

UPDATE ticket
SET participant_tc = 79040637844
WHERE ticket_id = 5;

UPDATE ticket
SET participant_tc = 40567924538
WHERE ticket_id = 3;

UPDATE ticket
SET event_id = 5
WHERE ticket_id = 2;

--ticket_owner_information
UPDATE ticket_owner_information
SET participant_email = "bharris@gmail.com"
WHERE participant_tc = 10314543740;

UPDATE ticket_owner_information
SET participant_phone = 5448756525
WHERE participant_tc = 10314543740;

UPDATE ticket_owner_information
SET participant_email = "maguirre@gmail.com"
WHERE participant_tc = 10327656399;

UPDATE ticket_owner_information
SET participant_name = "Shery"
WHERE participant_tc = 10327656399;

UPDATE ticket_owner_information
SET participant_university = "Koc University"
WHERE participant_tc = 11146229557;

--ticket_owner_major
UPDATE ticket_owner_major
SET participant_major = "PHYS"
WHERE participant_tc = 11146229557;

UPDATE ticket_owner_major
SET participant_major = "ARTS"
WHERE participant_tc = 11146229557;

UPDATE ticket_owner_major
SET participant_major = "CHEM"
WHERE participant_tc = 11146229557;

UPDATE ticket_owner_major
SET participant_major = "MECH"
WHERE participant_tc = 11146229557;

UPDATE ticket_owner_major
SET participant_major = "MILITARY"
WHERE participant_tc = 11146229557;

-- DELETE - SQL

-- Table: class

DELETE FROM class
WHERE class_capacity = 100;

DELETE FROM class
WHERE class_capacity = 50;

DELETE FROM class
WHERE class_id = 'Z50';

DELETE FROM class
WHERE faculty_id = 'SNA';

DELETE FROM class
WHERE faculty_id LIKE 'S%';


-- Table: club

DELETE FROM club
WHERE club_id = 1;

DELETE FROM club
WHERE club_name = 'IEEE';

DELETE FROM club
WHERE club_creation_date < date('now');

DELETE FROM club
WHERE club_creation_date < '2019-01-01';

DELETE FROM club
WHERE club_name LIKE 'A%';


-- Table: club_event

DELETE FROM club_event
WHERE club_event_id = 1;

DELETE FROM club_event
WHERE club_event_name = 'INDEX';

DELETE FROM club_event
WHERE club_event_start_date < '2019-01-01';

DELETE FROM club_event
WHERE club_event_end_date < '2019-01-01';

DELETE FROM club_event
WHERE club_id = 1;


-- Table: club_member

DELETE FROM club_member
WHERE member_id = 1;

DELETE FROM club_member
WHERE role_id = 0;

DELETE FROM club_member
WHERE student_id = 1;

DELETE FROM club_member
WHERE committee_id = 0;

DELETE FROM club_member
WHERE club_id = 1;


-- Table: club_member_role

DELETE FROM club_member_role
WHERE role_id = 1;

DELETE FROM club_member_role
WHERE role_id < 1;

DELETE FROM club_member_role
WHERE role_name = 'President';

DELETE FROM club_member_role
WHERE role_name = 'Ordinary';

DELETE FROM club_member_role
WHERE role_name LIKE 'Or%';


-- Table: committee

DELETE FROM committee
WHERE committee_id = 0;

DELETE FROM committee
WHERE committee_name = 'Marketing';

DELETE FROM committee
WHERE committee_name = 'Planning';

DELETE FROM committee
WHERE club_id = 1;

DELETE FROM committee
WHERE committee_id = 10;


-- Table: faculty

DELETE FROM faculty
WHERE faculty_id = 'SNA';

DELETE FROM faculty
WHERE faculty_name = 'SNA';

DELETE FROM faculty
WHERE faculty_name LIKE '%Engineering%';

DELETE FROM faculty
WHERE faculty_id = 'ENG';

DELETE FROM faculty
WHERE faculty_name LIKE '%Nusret%';


-- Table: sponsor

DELETE FROM sponsor
WHERE sponsor_name LIKE '%INDEX%';

DELETE FROM sponsor
WHERE sponsor_contact_number = 5418303471;

DELETE FROM sponsor
WHERE sponsor_email LIKE '%index%';

DELETE FROM sponsor
WHERE sponsor_name = 'ARCELIK';

DELETE FROM sponsor
WHERE sponsor_email = 'arcelik@arcelik.com';


-- Table: sponsorship

DELETE FROM sponsorship
WHERE committee_id = 1;

DELETE FROM sponsorship
WHERE donation_amount < 2000;

DELETE FROM sponsorship
WHERE sponsor_name LIKE '%INDEX%';

DELETE FROM sponsorship
WHERE donation_amount > 3000;

DELETE FROM sponsorship
WHERE committee_id = 10;


-- Table: student:

DELETE FROM student
WHERE student_email LIKE '%tamur%';

DELETE FROM student
WHERE student_name = 'Firat';

DELETE FROM student
WHERE student_surname = 'Tamur';

DELETE FROM student
WHERE student_id < 10;

DELETE FROM student
WHERE student_email = 'ftamur@ku.edu.tr';


-- Table: ticket

DELETE FROM ticket
WHERE ticket_id = 10;

DELETE FROM ticket
WHERE participant_tc = 20;

DELETE FROM ticket
WHERE event_id in (SELECT event_id 
                    FROM club_event 
                    WHERE club_id = 10);

DELETE FROM ticket
WHERE participant_tc = (SELECT participant_tc 
                        FROM ticket_owner_information 
                        WHERE participant_name = 'Micheal');

DELETE FROM ticket
WHERE event_id = (SELECT event_id
                  FROM club_event
                  WHERE club_event_name LIKE '%INDEX%');


-- Table: ticket_owner_information

DELETE FROM ticket_owner_information
WHERE participant_name = 'Micheal';

DELETE FROM ticket_owner_information
WHERE participant_tc = 10;

DELETE FROM ticket_owner_information
WHERE participant_surname LIKE '%Harri%';

DELETE FROM ticket_owner_information
WHERE participant_email = 'olsonbrandy@hotmail.com';

DELETE FROM ticket_owner_information
WHERE participant_birtday < '2002-01-01';


-- Table: ticket_owner_major

DELETE FROM ticket_owner_major
WHERE participant_tc = 36700468667;

DELETE FROM ticket_owner_major
WHERE participant_major LIKE '%BIO%';

DELETE FROM ticket_owner_major
WHERE participant_major = 'ENG';

DELETE FROM ticket_owner_major
WHERE participant_tc < 36700468667;

DELETE FROM ticket_owner_major
WHERE participant_major = 'COMP';



PRAGMA foreign_keys = ON;



