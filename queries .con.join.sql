-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT DISTINCT `students`.`name`, `students`.`surname`,`students`.`registration_number`, `degrees`.`name`
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id`=`students`.`degree_id` 
INNER JOIN `courses`
ON `courses`.`degree_id`= `courses`.`id`
WHERE `degrees`.`name`= 'Corso di Laurea in Economia'


 --Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id`= `departments`.`id`
WHERE `degrees`.`level`= "magistrale"
AND `departments`.`name`= "Dipartimento di Neuroscienze"
 --Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
 SELECT `teachers`.`name`, `teachers`.`surname`,`teachers`.`id`, `courses`.`name`
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id`= `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `teachers`.`id`= `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44


 --Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name`, `students`.`surname`, `students`.`registration_number`, `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id`= `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id` 
ORDER BY `students`.`name`, `students`.`surname`

 --Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
 SELECT `teachers`.`name`, `teachers`.`surname`, `degrees`.`name`, `degrees`.`level`, `courses`.`name`, `courses`.`cfu`, `courses`.`period`
FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
ORDER BY `teachers`.`surname`
--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `departments`.`name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` =`courses`.`degree_id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
ORDER BY `surname`

--BONUS: Selezionare per ogni studente quanti 
--tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `courses`.`name` AS `course_name`, `courses`.`id` AS `course_id`, COUNT(`exam_student`.`vote`),
 MAX( `exam_student`.`vote`) --restituisce il valore massimo di una colonna 
FROM `students`
INNER JOIN `exam_student`
ON `exam_student`.`student_id` = `students`.`id`
INNER JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING MAX(`exam_student`.`vote`) >= 18  --viene usata per filtrare i risultati che otteniamo dopo aver usato GROUP BY (simile a WHERE)
ORDER BY `students`.`id`, `courses`.`name`