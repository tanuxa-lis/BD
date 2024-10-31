ELECT `salespeapl`.`snam`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`,
    `salespeapl`.`comm`
FROM `shop`.`salespeapl`;

/*Отбор без повторяющихся значений*/
SELECT distinct
    `salespeapl`.`city`
FROM `shop`.`salespeapl`;

SELECT distinct
    `sales`.`sdate`
FROM `shop`.`sales`;

/*ОТбор по условию (предложение where)*/
SELECT 
    `salespeapl`.`snam`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`,
    `salespeapl`.`comm`
FROM
    `shop`.`salespeapl`
WHERE
    `salespeapl`.`city` = 'Новосибирск'
        OR `salespeapl`.`city` = 'Лондон';
	        
	SELECT 
	    `customers`.`cname`,
	    `customers`.`city`
	FROM 
		`shop`.`customers`
		WHERE
			`customers`.`rating` >=200;

			/*не равно 200*/    
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE
		`customers`.`rating` <>200;
		/*или*/
SELECT 
    `customers`.`cname`, `customers`.`city`
FROM
    `shop`.`customers`
WHERE
    NOT `customers`.`rating` = 200;


/*применение условий отбора для NULL-значений*/

SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`
FROM 
	`shop`.`customers`
	WHERE
		`customers`.`rating` <>200 or `customers`.`rating` = 200;
		    
		/*NULL-значения (неизвестный результат сравнения) не выводятся в результат отбора*/


/*Составные условия с логическими операторами OR, AND, NOT*/

SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`
FROM
    `shop`.`customers`
WHERE
    `customers`.`city` = 'Питер'
        AND NOT customers.rating > 200;
	        
	/*убрали сначала одних потом других*/        
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`
FROM
    `shop`.`customers`
WHERE
    NOT `customers`.`city` = 'Питер'
        AND NOT customers.rating > 200;
	/*нашли человека, который соответсвует этим условиям и убрали только его*/         
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`
FROM
    `shop`.`customers`
WHERE
    NOT (`customers`.`city` = 'Питер'
	        AND customers.rating > 200);


	/*отбор по датам*/        
SELECT 
    `sales`.`snam`,
    `sales`.`cnam`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    (`sales`.`sdate` > '2024-08-31'
	        AND `sales`.`sdate` < '2024-10-01')
	        AND (NOT (`sales`.`sdate` >= '2024-09-12'
				        AND `sales`.`sdate` <= '2024-09-15'))
			        AND NOT cnam = 201;


				/*отбор по датам*/        
SELECT 
    `sales`.`snam`,
    `sales`.`cnam`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    (`sales`.`sdate` > '2024-08-31'
	        AND `sales`.`sdate` < '2024-10-01')
	        AND (NOT (`sales`.`sdate` >= '2024-09-12'
				        AND `sales`.`sdate` <= '2024-09-15'))
			        AND NOT cnam = 201
				        OR (cnam = 203)
					        AND (`sales`.`sdate` > '2024-09-30'
							        AND `sales`.`sdate` < '2024-11-01');
