/*операторы IN, BETWEEN, LIKE, IS NULL и агрегатные функции*/


/*IN-выборка из множества значений (cсокращает команду OR)*/

SELECT 
    `customers`.`cnam`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snam`
FROM
    `shop`.`customers`
WHERE
    `customers`.`city` IN ('Новосибирск' , 'Питер');

SELECT 
    `sales`.`snam`,
    `sales`.`cnam`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` IN ('2024-09-12' , '2024-09-13');


/*BETWEEN-выборка из диапозона значений (cсокращает команду AND)*/

SELECT 
    `sales`.`snam`,
    `sales`.`cnam`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` BETWEEN '2024-09-12' AND '2024-09-17';
    
SELECT 
    `salespeapl`.`snam`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`,
    `salespeapl`.`comm`
FROM
    `shop`.`salespeapl`
WHERE
    `salespeapl`.`comm` BETWEEN 0.10 AND 0.15;
    
    
/*исключение границ диапозона при помощи комбинации BETWEEN и IN*/

SELECT 
    `salespeapl`.`snam`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`,
    `salespeapl`.`comm`
FROM
    `shop`.`salespeapl`
WHERE
    `salespeapl`.`comm` BETWEEN 0.10 AND 0.15
        AND NOT `salespeapl`.`comm` IN (0.10 , 0.15);
	        
	SELECT 
	    `salespeapl`.`snam`,
	    `salespeapl`.`sname`,
	    `salespeapl`.`city`,
	    `salespeapl`.`comm`
	FROM
	    `shop`.`salespeapl`
	WHERE
	    `salespeapl`.`city` BETWEEN 'Л' AND 'О'
	ORDER BY `salespeapl`.`city`;


	/*оператор LIKE*/
/* "%"-любое количество любых символов, "_"-один символ */

SELECT 
    `customers`.`cnam`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snam`
FROM
    `shop`.`customers`
WHERE
    city LIKE 'Нов_%';
    
SELECT 
    `customers`.`cnam`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snam`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%ий';


/*чтобы служебный знак воспринимался как знак в тексте (/%)*/
SELECT 
    `customers`.`cnam`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snam`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%/%%' escape "/";
