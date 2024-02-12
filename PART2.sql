-- WHERE and ORDER BY
    SELECT * FROM people WHERE age > 50 ORDER BY age DESC
-- SUM
    -- UNABLE TO COMPLETE, APPEARS TO BE DOWN
-- MIN/MAX
    SELECT min(age) AS age_min, max(age) AS age_max FROM people;
-- FIND ALL STUDENTS
    SELECT * FROM students WHERE IsActive = 1
-- GROUP BY
    SELECT age, COUNT(*) AS people_count FROM people GROUP BY age;
-- HAVING
    SELECT age, count(id) AS total_people FROM people GROUP BY age HAVING count(id) > 9;