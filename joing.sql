/*соединение таблиц*/

/*Соединение таблиц покупателей и продавцов при помощи их первичных ключей*/
SELECT 
    cname as 'фамилия покупателя', sname as 'фамилия продавца'
FROM
    `shop`.`customers`,
    `shop`.`salespeapl`
where 
	`customers`.`snam`= `salespeapl`.`snam`;
	    
	/* "естественное" Соединение трёх таблиц*/
SELECT 
    `customers`.`cnam`,
    `salespeapl`.`snam`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`,
    `shop`.`customers`,
    `shop`.`salespeapl`
WHERE
    `customers`.`snam` = `salespeapl`.`snam`
        AND customers.cnam = sales.cnam;


	/* "неестественное" соединение (без использования ключевых полей)*/    
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`
FROM
    `shop`.`customers`,
    `shop`.`salespeapl`
WHERE
    `customers`.`city` = `salespeapl`.`city`;
    
    
/* составные условия при соединении*/    
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`
FROM
    `shop`.`customers`,
    `shop`.`salespeapl`
WHERE
    `customers`.`city` = `salespeapl`.`city`
        AND customers.city = 'Новосибирск';
	        
	   
	SELECT 
	    `customers`.`cname`,
	    `customers`.`city`,
	    `salespeapl`.`sname`,
	    `salespeapl`.`city`
	FROM
	    `shop`.`customers`,
	    `shop`.`salespeapl`
	WHERE
	    `customers`.`city` = `salespeapl`.`city`
	        AND customers.city IN ('Новосибирск' , 'Питер');

		/*использование неравенств при соединениях*/        
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `salespeapl`.`sname`,
    `salespeapl`.`city`
FROM
    `shop`.`customers`,
    `shop`.`salespeapl`
WHERE
    `customers`.`city` < `salespeapl`.`city`
        AND rating = 100;

	/*использование псевдонимов (alias) для таблиц
может использоваться для соединение таблицы с самой сабой*/        
SELECT 
    `first`.cname, `second`.cname, `first`.rating
FROM
    customers `first`,
    customers `second`
WHERE
    `first`.rating = `second`.rating and `first`.cname<`second`.cname;
    
          
SELECT 
    b.cname as 'покупатель', a.sname as 'продавец', b.rating as 'райтинг покупателя'
FROM
    salespeapl a,
    customers b
WHERE
    a.snam = b.snam;
    
    
/*самосоединение для таблицы с циклической зависимостью*/
SELECT 
    f.empno, f.empname, s.empname
FROM
    employe f,
    employe s
WHERE
    f.manager = s.empno;
