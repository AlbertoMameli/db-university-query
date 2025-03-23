-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE YEAR (`date_of_birth`) = 1990;


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT *
FROM `courses`
WHERE `cfu`> 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE timestampdiff(YEAR, date_of_birth, CURDATE()) >= 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `hour` >= '14:00'
AND `date` = '2020-06-20'


-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT * 
FROM `departments`;
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT * 
FROM `teachers`
WHERE `phone` is NUll;
-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
--posso farlo direttamente senza inserirlo con codice
INSERT INTO `students` (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (61, 'Alberto', 'Mameli', '1995-07-12', 'MMLLTYYHBGGGTY', '2025-03-23', 620050, 'alberi.ese@example.com');


 
-- 10. Cambiare il numero dell’ ufficio del professor Pietro Rizzo in 126
SELECT *
FROM `teachers`
WHERE `name`= Pietro
result id = 56
UPDATE `teachers`
SET `office-number`= 126
WHERE `id` = 56;
-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9 
DELETE FROM `students`
WHERE `id` = ******;


--1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(id), YEAR(`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`);
--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`), `exam_id`
FROM `exam_student`
GROUP BY(`exam_id`);
--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`id`), `department_id`
FROM `degrees`
GROUP BY (`department_id`);
