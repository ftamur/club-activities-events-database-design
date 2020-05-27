-- View: sponsor_donations

DROP VIEW IF EXISTS sponsor_donations;
CREATE VIEW sponsor_donations AS
    SELECT sponsor_name,
           SUM(donation_amount) 
      FROM sponsorship
     GROUP BY sponsor_name;


-- View: committee_members
DROP VIEW IF EXISTS committee_members;
CREATE VIEW committee_members AS
    SELECT cl.club_name,
           com.committee_name,
           s.student_name,
           s.student_surname
      FROM club_member cm
           INNER JOIN
           club cl ON cl.club_id = cm.club_id
           INNER JOIN
           student s ON s.student_id = cm.student_id
           INNER JOIN
           committee com ON com.committee_id = cm.committee_id;


-- View: committee_total_donation
DROP VIEW IF EXISTS committee_total_donation;
CREATE VIEW committee_total_donation AS
    SELECT cl.club_name,
           com.committee_name,
           sum(sp.donation_amount) 
      FROM committee com
           INNER JOIN
           club cl ON cl.club_id = com.club_id
           INNER JOIN
           sponsorship sp ON sp.committee_id = com.committee_id
     GROUP BY com.committee_id;


-- View: events_location
DROP VIEW IF EXISTS events_location;
CREATE VIEW events_location AS
    SELECT ce.club_event_name,
           fac.faculty_id,
           cl.class_id,
           cl.class_capacity
      FROM club_event ce
           INNER JOIN
           class cl ON cl.class_id = ce.class_id AND 
                       cl.faculty_id = ce.faculty_id
           INNER JOIN
           faculty fac ON fac.faculty_id = cl.faculty_id;


-- View: participant_contact_info
DROP VIEW IF EXISTS participant_contact_info;
CREATE VIEW participant_contact_info AS
    SELECT participant_email,
           participant_phone
      FROM ticket_owner_information;


-- View: president
DROP VIEW IF EXISTS president;
CREATE VIEW president AS
    SELECT cl.club_name,
           s.student_name,
           s.student_surname
      FROM club_member cm
           INNER JOIN
           student s ON s.student_id = cm.student_id
           INNER JOIN
           club cl ON cl.club_id = cm.club_id
     WHERE cm.role_id = (
                            SELECT role_id
                              FROM club_member_role
                             WHERE role_name = 'President'
                        );


-- View: project_leaders
DROP VIEW IF EXISTS project_leaders;
CREATE VIEW project_leaders AS
    SELECT cl.club_name,
           s.student_name,
           s.student_surname
      FROM club_member cm
           INNER JOIN
           student s ON s.student_id = cm.student_id
           INNER JOIN
           club cl ON cl.club_id = cm.club_id
     WHERE cm.role_id = (
                            SELECT role_id
                              FROM club_member_role
                             WHERE role_name = 'Project Leader'
                        );


                        