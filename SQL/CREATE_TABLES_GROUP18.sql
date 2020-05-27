-- Comp306 - DBMS Term Project
-- Banu Yobas

-- Firat Tamur
-- Alp Adnan Basar 

PRAGMA foreign_keys = off;

-- Table: class
DROP TABLE IF EXISTS class;
CREATE TABLE class (
    class_id VARCHAR (5) NOT NULL,
    class_capacity INT (3) NOT NULL,
    faculty_id VARCHAR (4) NOT NULL, 
    PRIMARY KEY (class_id, faculty_id)
    );


-- Table: club
DROP TABLE IF EXISTS club;
CREATE TABLE club (
    club_id INTEGER PRIMARY KEY AUTOINCREMENT,
    club_name VARCHAR (20) NOT NULL, 
    club_creation_date DATE NOT NULL
    );

DROP TABLE IF EXISTS club_event;
CREATE TABLE club_event (
    club_event_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    club_event_name VARCHAR (15) NOT NULL, 
    club_event_start_date DATE NOT NULL, 
    club_event_end_date DATE NOT NULL, 
    club_id INTEGER, 
    class_id INTEGER, 
    project_leader_id INTEGER, 
    faculty_id VARCHAR (4),
    FOREIGN KEY (club_id) 
    REFERENCES Club (club_id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (project_leader_id) 
    REFERENCES Club_Member (member_id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (class_id, faculty_id) 
    REFERENCES class (class_id, faculty_id) ON DELETE CASCADE ON UPDATE CASCADE);

-- Table: club_member
DROP TABLE IF EXISTS club_member;
CREATE TABLE club_member (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    role_id INTEGER, 
    student_id INTEGER, 
    committee_id INTEGER, 
    club_id INTEGER 
    REFERENCES club (club_id), 
    FOREIGN KEY (role_id) 
    REFERENCES club_member_role (role_id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (committee_id) 
    REFERENCES committee (committee_id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (student_id) 
    REFERENCES student (student_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

-- Table: club_member_role
DROP TABLE IF EXISTS club_member_role;
CREATE TABLE club_member_role (
    role_id INT (1) PRIMARY KEY NOT NULL, 
    role_name VARCHAR (30) NOT NULL
    );

-- Table: committee
DROP TABLE IF EXISTS committee;
CREATE TABLE committee (
    committee_id INTEGER PRIMARY KEY AUTOINCREMENT,  
    committee_name TEXT NOT NULL, 
    club_id INTEGER, 
    FOREIGN KEY (club_id) 
    REFERENCES club (club_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

-- Table: faculty
DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
    faculty_id VARCHAR (4) PRIMARY KEY, 
    faculty_name VARCHAR (30)
    );


-- Table: participant_information
DROP TABLE IF EXISTS ticket_owner_information;
CREATE TABLE ticket_owner_information (
    participant_tc INTEGER PRIMARY KEY,
    participant_name TEXT NOT NULL,
    participant_surname TEXT NOT NULL,
    participant_email TEXT NOT NULL,
    participant_birtday DATE NOT NULL,
    participant_university TEXT NOT NULL,
    participant_phone INTEGER NOT NULL
    );

-- Table: participant_major
DROP TABLE IF EXISTS ticket_owner_major;
CREATE TABLE ticket_owner_major (
    participant_tc INTEGER,  
    participant_major VARCHAR (20),
    PRIMARY KEY(participant_id, participant_major),
    FOREIGN KEY (participant_tc)
    REFERENCES ticket_owner_information (participant_tc) ON UPDATE CASCADE ON DELETE CASCADE
    );

-- Table: sponsor
DROP TABLE IF EXISTS sponsor;
CREATE TABLE sponsor (
    sponsor_name VARCHAR (30) PRIMARY KEY, 
    sponsor_contact_number INT (10), 
    sponsor_email VARCHAR (30)
    );

-- Table: sponsorship
DROP TABLE IF EXISTS sponsorship;
CREATE TABLE sponsorship (
    committee_id INTEGER 
    FOREIGN KEY (committee_id) 
    REFERENCES committee (committee_id) ON UPDATE CASCADE ON DELETE CASCADE,
    donation_amount INTEGER, 
    sponsor_name VARCHAR (30) 
    FOREIGN KEY (sponsor_name)  
    REFERENCES sponsor (sponsor_name) ON UPDATE CASCADE ON DELETE CASCADE, 
    PRIMARY KEY (committee_id, sponsor_name)
    );

-- Table: student
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    student_email VARCHAR (30) NOT NULL, 
    student_name VARCHAR (20) NOT NULL, 
    student_surname TEXT (20) NOT NULL, 
    student_id INT (5) PRIMARY KEY NOT NULL
    );

-- Table: ticket
DROP TABLE IF EXISTS ticket;
CREATE TABLE ticket (
    ticket_id INT (5) PRIMARY KEY, 
    participant_tc INT (11), 
    event_id INTEGER 
    REFERENCES club_event (club_event_id)
    );


PRAGMA foreign_keys = on;

