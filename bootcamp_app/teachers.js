const { Pool } = require('pg');

const pool = new Pool({
  user: 'hailanwang',
  password: '',
  host: 'localhost',
  port: '5431',
  database: 'bootcampx'
});
const text = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort 
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`;
const values = [`%${process.argv[2]}%`];

pool.query(text, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher} `);
    });
  }).catch(err => console.error('query error', err.stack));