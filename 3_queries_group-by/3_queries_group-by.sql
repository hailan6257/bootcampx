-- SELECT day, count(day) as total_assignments
-- FROM assignments
-- GROUP BY day
-- ORDER BY day;

-- SELECT day, count(day) as total_assignments
-- FROM assignments
-- GROUP BY day
-- HAVING count(day) >= 10
-- ORDER BY day;

-- SELECT cohorts.name as cohort_name, count(students.*) AS student_count 
-- FROM cohorts
-- JOIN students ON cohorts.id = cohort_id
-- GROUP BY cohort_name 
-- HAVING count(students.*) >= 18
-- ORDER BY student_count;

-- SELECT cohorts.name as cohort, count(assignment_submissions.*) AS total_submissions 
-- FROM students
-- JOIN assignment_submissions ON students.id = student_id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohort
-- ORDER BY total_submissions DESC;

-- SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON students.id = student_id
-- WHERE end_date IS NULL
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;

SELECT students.name as student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) <= AVG(assignments.duration)
ORDER BY average_assignment_duration;