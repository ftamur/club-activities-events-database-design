-- INSERT TRIGGERS

CREATE TRIGGER check_email
        BEFORE INSERT
            ON student
      FOR EACH ROW
          WHEN NEW.student_email NOT LIKE '%@ku.edu.tr%'
BEGIN
    SELECT RAISE(ABORT, "Invalid email");
END;

CREATE TRIGGER check_date
        BEFORE INSERT
            ON club
      FOR EACH ROW
          WHEN date('now') >= NEW.club_creation_date
BEGIN
    SELECT RAISE(ABORT, "Invalid Date");
END;

CREATE TRIGGER create_committees
         AFTER INSERT
            ON club
      FOR EACH ROW
BEGIN
    INSERT INTO committee (
                              committee_name,
                              club_id
                          )
                          VALUES (
                              "Planning",
                              NEW.club_id
                          );
    INSERT INTO committee (
                              committee_name,
                              club_id
                          )
                          VALUES (
                              "Marketing",
                              NEW.club_id
                          );
    INSERT INTO committee (
                              committee_name,
                              club_id
                          )
                          VALUES (
                              "Sponsorship",
                              NEW.club_id
                          );
END;


-- UPDATE TRIGGERS

CREATE TRIGGER check_dates_update
        BEFORE UPDATE
            ON club_event
      FOR EACH ROW
          WHEN NEW.club_event_start_date > NEW.club_event_end_date
BEGIN
    SELECT RAISE(ABORT, "Invalid Dates");
END;


CREATE TRIGGER participant_tc_on_major
         AFTER UPDATE OF participant_tc
            ON ticket_owner_information
      FOR EACH ROW
BEGIN
    UPDATE ticket_owner_major
       SET participant_tc = NEW.participant_tc
     WHERE participant_tc = OLD.participant_tc;
END;




-- DELETE TRIGGERS


CREATE TRIGGER at_least_one_major
        BEFORE DELETE
            ON ticket_owner_major
      FOR EACH ROW
          WHEN 1 == (
                        SELECT COUNT(participant_tc) 
                          FROM ticket_owner_major
                         WHERE participant_tc = OLD.participant_tc
                    )
BEGIN
    SELECT RAISE(ABORT, "At least one major should stay.");
END;


CREATE TRIGGER remove_classes
         AFTER DELETE
            ON faculty
      FOR EACH ROW
BEGIN
    DELETE FROM class
          WHERE faculty_id = OLD.faculty_id;
END;






