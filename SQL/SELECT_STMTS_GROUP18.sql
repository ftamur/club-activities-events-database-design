-- Select ticket buyers and group them by major.

SELECT tom.participant_major, Count(*)
FROM ticket_owner_information toi
INNER JOIN ticket_owner_major tom on tom.participant_tc = toi.participant_tc
GROUP BY (tom.participant_major);

-- Select ticket buyers and group them by university.

SELECT toi.participant_university, Count(*)
FROM ticket_owner_information toi
INNER JOIN ticket_owner_major tom on tom.participant_tc = toi.participant_tc
GROUP BY (toi.participant_university);

-- Participants who under 18.

SELECT *
FROM ticket_owner_information
WHERE participant_birtday > '2002-01-01';

-- Event counts grouped by clubs

SELECT cl.club_name, COUNT(*)
FROM club_event ce
INNER JOIN club cl on cl.club_id = ce.club_id
GROUP BY (ce.club_event_name);

-- Clubs ordered by club member counts in desc order.

SELECT cl.club_name, COUNT(*)
FROM club_member cm
INNER JOIN club cl on cl.club_id = cm.club_id
GROUP BY (cl.club_id)
ORDER BY COUNT(*) DESC;

-- Events ordered by participant counts in desc order

SELECT ce.club_event_name, COUNT(*)
FROM ticket
INNER JOIN club_event ce on ce.club_event_id = ticket.event_id
GROUP BY (ticket.event_id)
ORDER BY COUNT(*) DESC;


-- Events ordered by date.

SELECT *
FROM club_event ce
ORDER BY ce.club_event_start_date;


-- Sponsor who donate more than one time.

SELECT sponsor_name, COUNT(*)
FROM sponsorship
GROUP BY (sponsor_name)
HAVING COUNT(*) > 1;

-- Committee counts for each club

SELECT cl.club_name,  COUNT(*)
FROM committee cm
INNER JOIN club cl on cl.club_id = cm.club_id
GROUP BY (cl.club_id);

-- Event counts grouped by class.

SELECT cl.class_id, COUNT(*)
FROM class cl
INNER JOIN club_event ce on ce.class_id = cl.class_id
GROUP BY (ce.club_event_id)
ORDER BY DESC;


