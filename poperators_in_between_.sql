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

  /*агрегатные функции
    -COUNT()- счётчик
    -SUM()
    -AVG()- среднее значение
    -MAX()
    -MIN()*/
   
/*подсчёт суммы чисел по определённому столбцу*/

SELECT 
    SUM(amount)
FROM
    sales;
 
 /*подсчёт количества строк с условием*/
SELECT 
    COUNT(*)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';
	        
	 /*вычисление среднего значения с условием*/        
SELECT 
    AVG(amount)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';
	 
	 /*при использовании distinct внутри функции count() подсчитываются только уникальные значения в столбце*/
 SELECT
    COUNT(distinct city)
FROM
    customers;
 
 /*функции мах и мин работают со строковыми значениями, ориентируясь на строковый порядок*/
SELECT
    max(cname)
FROM
    customers;


/*группировка максимальных значений продаж по каждому продавцу */
SELECT 
    snam, MAX(amount)
FROM
    sales
GROUP BY snam;

/*группировка по нескольким столбцам */
SELECT 
    snam, sdate, max(amount)
FROM
    sales
GROUP BY snam, sdate;

/*отбор значений после группировки
 осуществляется с помощью специального выражения having
 where отбирает строки до группировки и не может сордержать агрегатные функции*/
SELECT 
    snam, sdate, MAX(amount)
FROM
    sales
GROUP BY snam , sdate
HAVING MAX(amount) > 500;

/*having не работает до группировки*/

/*Если в группировке не используеьтся поле, по которому нужно сделать отбор, 
то используется только выражение where*/
SELECT 
    snam, sdate, MAX(amount)
FROM
    sales
where 
	sdate> '2024-09-15'
	GROUP BY snam , sdate;

	/*использование in с having*/

SELECT 
    snam, sdate, MAX(amount)
FROM
    sales
WHERE
    sdate > '2024-09-15'
GROUP BY snam
HAVING snam IN (101 , 106);
