SELECT *FROM crime_scene_report
WHERE type = 'murder' AND city = 'SQL City' AND date = 20180115

SELECT * FROM person
WHERE address_street_name= "Northwestern Dr"
ORDER BY address_number DESC

SELECT * FROM person
WHERE name like 'Annabel%'
AND address_street_name = "Franklin Ave"


SELECT *
FROM interview
where (person_id = 14887 OR person_id = 16371)

SELECT * FROM get_fit_now_member
WHERE id LIKE '48Z%'
AND membership_status = 'gold';