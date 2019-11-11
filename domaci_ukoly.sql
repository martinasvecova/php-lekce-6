/* 1 */
SELECT t.id, t.name
FROM teacher t
WHERE id NOT IN (SELECT teacher_id FROM class_subject);

/* 2 */
SELECT p.id, p.name, ps.grade, COUNT(*) AS grade_count
FROM pupil p
JOIN pupil_subject ps ON p.id = ps.pupil_id
WHERE grade = 5
GROUP BY p.id;

/* 3 */
SELECT c.year, c.name, AVG (ps.grade)
FROM class c
JOIN pupil p ON p.class_id = c.id
JOIN pupil_subject ps ON p.id = ps.pupil_id
GROUP BY c.id
ORDER BY c.year, c.name;

/* 4 */
SELECT c.year, AVG(ps.grade)
FROM class c
JOIN pupil p ON p.class_id = c.id
JOIN pupil_subject ps ON p.id = ps.pupil_id
GROUP BY c.year
ORDER BY c.year, c.name;

/* 5 */
SELECT t.id, t.name, s.name, c.year, c.name
FROM class_subject cs
JOIN subject s ON cs.subject_id = s.id
JOIN class c ON cs.class_id = c.id
JOIN teacher t ON cs.teacher_id = t.id
WHERE t.id = c.homeroom_teacher_id;

/* 6 */
SELECT s.name, c.year, AVG(ps.grade)
FROM subject s
JOIN class_subject cs ON s.id = cs.subject_id
JOIN pupil_subject ps ON s.id = ps.subject_id
JOIN class c ON c.id = cs.class_id
GROUP BY c.year, s.name;

/* 7 */
SELECT t.id, t.name, s.name, AVG(ps.grade)
FROM teacher t
JOIN class_subject cs ON t.id = cs.teacher_id
JOIN pupil_subject ps ON cs.subject_id = ps.subject_id
JOIN subject s ON s.id = cs.subject_id
GROUP BY t.id
ORDER BY AVG(ps.grade)
LIMIT 5;

SELECT t.id, t.name, s.name, AVG(ps.grade)
FROM teacher t
JOIN class_subject cs ON t.id = cs.teacher_id
JOIN pupil_subject ps ON cs.subject_id = ps.subject_id
JOIN subject s ON s.id = cs.subject_id
GROUP BY t.id
ORDER BY AVG(ps.grade) DESC
LIMIT 5;