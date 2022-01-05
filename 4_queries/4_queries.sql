-- SELECT count(assistance_requests.*) as total_assistances, teachers.name
-- FROM assistance_requests
-- JOIN teachers ON teachers.id = teacher_id
-- WHERE name = 'Waylon Boehm'
-- GROUP BY teachers.name;

-- SELECT count(assistance_requests.*) as total_assistances, students.name
-- FROM assistance_requests
-- JOIN students ON students.id = student_id
-- WHERE name = 'Elliot Dickinson'
-- GROUP BY students.name;

-- SELECT students.name as student, teachers.name as teacher, assignments.name as assignment,
-- (completed_at - started_at) as duration
-- FROM assistance_requests
-- JOIN students ON students.id = student_id
-- JOIN teachers ON teachers.id = teacher_id
-- JOIN assignments ON assignments.id = assignment_id
-- ORDER BY duration;


-- SELECT AVG(completed_at - started_at) as average_assistance_request_duration
-- FROM assistance_requests;

-- SELECT cohorts.name AS name, AVG(completed_at - started_at) as average_assistance_time 
-- FROM assistance_requests
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time;



-- SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
-- FROM assistance_requests 
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time DESC
-- LIMIT 1;

-- SELECT AVG(started_at - created_at) as average_wait_time
-- FROM assistance_requests;

-- SELECT cohorts.name AS name, SUM(completed_at - started_at) as total_duration 
-- FROM assistance_requests
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER BY total_duration;



-- SELECT AVG(total_duration) AS average_total_duration
-- FROM(
-- SELECT cohorts.name AS name, SUM(completed_at - started_at) as total_duration 
-- FROM assistance_requests
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER BY total_duration
-- )as total_durations;

-- SELECT assignments.id AS id, day, chapter, name, COUNT(assistance_requests.*) AS total_requests
-- FROM assignments
-- JOIN assistance_requests ON assignments.id = assignment_id
-- GROUP BY assignments.id
-- ORDER BY total_requests DESC;

-- SELECT day, COUNT(assignments.*) AS number_of_assignments, SUM(duration) as duration 
-- FROM assignments
-- GROUP BY day
-- ORDER BY day;

-- SELECT DISTINCT teachers.name, cohorts.name
-- FROM teachers
-- JOIN assistance_requests ON teachers.id = teacher_id
-- JOIN students ON students.id = student_id
-- JOIN cohorts ON cohorts.id = students.cohort_id
-- WHERE cohorts.name = 'JUL02'
-- ORDER BY teachers.name;

SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.*) AS total_assistances 
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;