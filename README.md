# 🕵️‍♂️ SQL Murder Mystery Investigation

## 📁 Project Title: `SQL-Murder-Mystery-Solution`

This project investigates a fictional crime that occurred in SQL City on **January 15, 2018**. The goal is to identify the murderer using SQL queries and logic. The database includes details about crimes, people, interviews, gym memberships, and more. This fun and engaging mystery improves your SQL join, filter, and logic skills.

---

## 🎯 Project Objectives

- Analyze a crime database to solve a murder mystery.
- Use SQL queries to find relevant clues.
- Join and filter across multiple tables to identify the criminal.

---

## 🧩 Step-by-Step Investigation

### 🔍 Step 1: Find the crime scene

```sql
SELECT * 
FROM crime_scene_report
WHERE type = 'murder' 
  AND city = 'SQL City' 
  AND date = 20180115;
SELECT * 
FROM interview 
WHERE date = '2018-01-15' AND transcript LIKE '%gym%';

###👥 Step 2: Find witnesses
SELECT * 
FROM get_fit_now_check_in 
WHERE check_in_date = '2018-01-09' AND check_in_time BETWEEN '07:00' AND '08:00' 
AND membership_id LIKE '48W%';
- 📌 Witness 1: Saw the suspect enter the gym. They used the check-in system.
- 📌 Witness 2: Said the killer had a Gold membership and car plate starting with "48W".

###🏋️ Step 3: Track suspect via gym check-in
SELECT * 
FROM get_fit_now_check_in 
WHERE check_in_date = '2018-01-09' AND check_in_time BETWEEN '07:00' AND '08:00' 
AND membership_id LIKE '48W%';
- 📌 Narrowed down to 2 membership IDs: 48W7A, 48W9B

###🪪 Step 4: Match membership ID to person
SELECT * 
FROM get_fit_now_member 
WHERE membership_id IN ('48W7A', '48W9B');
- 📌 Suspect Found: 48W7A is Jeremy Bowers

###📄 Step 5: Verify identity with driver's license
SELECT * 
FROM person 
WHERE id = 67318;
- 📌 Lives on Franklin Ave

###📞 Step 6: Review suspect's interview
SELECT * 
FROM interview 
WHERE person_id = 67318;
- 📌 Jeremy confesses and mentions an accomplice who lives in SQL City and attended the SQL Symphony Concert.

###🎼 Step 7: Get concert event ID
SELECT * 
FROM facebook_event_checkin 
WHERE event_name = 'SQL Symphony Concert';
- 📌 Event ID confirmed.

###🧍 Step 8: Find attendees from SQL City
SELECT p.id, p.name, p.address_street_name
FROM person p
JOIN facebook_event_checkin f 
ON p.id = f.person_id
WHERE f.event_name = 'SQL Symphony Concert'
  AND p.city = 'SQL City';
- 📌 After narrowing down, one name stands out: Miranda Priestly

###✅ Final Answer
- Murderer: Jeremy Bowers
- Accomplice: Miranda Priestly

###💾 Technologies Used
- SQLite: for SQL queries
- DB Browser for SQLite: GUI-based tool to explore and query the database
- Markdown: for reporting the solution

## 🧠 Author  
**Mohammed Saif Wasay**  
*Data Analytics Graduate — Northeastern University*  
*Machine Learning Enthusiast | Passionate about turning data into insights*  
🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/mohammed-saif-wasay-4b3b64199/)
