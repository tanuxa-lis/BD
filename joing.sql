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
    f.manager = s.empno/*примеры соединений*/
/*поиск тех продавцов, которые не назначены покупателям, но обслуживали их заказы */
SELECT 
    b.cname as "клиент", a.amount as "сумма заказа",  c.sname as '"чужой" продавец', d.sname as '"свой" продавец'
FROM
    sales a,
    customers b,
    salespeaple c,
    salespeaple d
WHERE
    a.cnum = b.cnum AND a.snum <> b.snum and a.snum = c.snum and d.snum = d.snum;


/*поиск образцов 
выводим три колонки, в каждой - покупатель с определенным значением рейтинга*/
SELECT 
    a.cnum, a.cname, b.cnum, c.cnum
FROM
    customers a,
    customers b,
    customers c
WHERE
    a.rating = 100 AND b.rating = 200
        AND c.rating = 300
	 order by a.cnum, b.cnum, c.cnum;
	
	/* соединение таблиц, не входящих в результаты запроса*/
	SELECT 
	    b.cnum, b.cname , b.city
	FROM
	    customers a,
	    customers b
	WHERE
	    a.snum = 101 AND a.city = b.city;
	
	/*пары покупателей обслуживаемые одним и тем же продавцом*/
	SELECT 
	    sname, salespeaple.snum, a.cname, b.cname
	FROM
	    customers a,
	    customers b,
	    salespeaple
	WHERE
	    a.snum = b.snum 
	    and salespeaple.snum = a.snum
	    AND a.cname < b.cname
	ORDER BY snum;
	
	/*оператор join в сочетании с using()*/
	SELECT 
	    city ' общий город', cname'покупатель', sname'продавец'
	FROM
	    customers
	        JOIN
		    salespeaple USING (city)
		    order by 1;
		
		/*запрос эквивалентный предыдущему*/
		SELECT 
		    `customers`.`cname`,
		    customers.city,
		    `salespeaple`.`sname`,
		    salespeaple.city
		FROM
		    customers,
		    salespeaple
		WHERE
		    customers.city = salespeaple.city;
		
		/*левое и правое соединение */
		SELECT 
		    customers.cname, salespeaple.sname
		FROM
		    customers
		        LEFT JOIN
			    salespeaple USING (snum); 
			
			SELECT 
			    customers.cname, salespeaple.sname
			FROM
			    customers
			        right JOIN
				    salespeaple USING (snum); 
				
				SELECT 
				    customers.cname, salespeaple.sname
				FROM
				    customers
						JOIN
						    salespeaple USING (snum); 
						    
						    
						    /*пример соединения  при помощи оператора ON*/
						       SELECT 
						    a.empname as 'менеджер', b.empname as "подчиненный"
						FROM
						    shop.employee a
						        JOIN
							    employee b ON a.empno = b.manager;
							    
							/*при левом соединении справа выводятся null значения для тех значений слева
							   которые не сопоставлены ни одному значению справа.
							   при отсутствии подчиненного у сотрудника, справа выводится Null*/ 
							   SELECT 
							    a.empname as 'менеджер', b.empname as "подчиненный"
							FROM
							    shop.employee a
							        left JOIN
								    employee b ON a.empno = b.manager;
								 
								 /*при правом соединении с лева выводятся null значения для тех значений справава
								 которые не сопоставлены ни одному значению слева.
								 при отсутствии менеджера для сотрудника слева выводится null,
								 в остальных случаях выводится имя менеджера для состудника*/
								   SELECT 
								    a.empname as 'менеджер', b.empname as "подчиненный"
								FROM
								    shop.employee a
								        right JOIN
									    employee b ON a.empno = b.manager;    
									  
									    /*натуральное соединение таблиц sales и salespeaple - 
									    автоматическое соединение по одноименным столбцам*/
									 SELECT 
									    sdate, amount, sname, cname
									FROM
									    sales a
									        NATURAL JOIN
										    salespeaple b
										        NATURAL JOIN
											    customers с
											WHERE
											    b.city = 'новосибирск';
											    
											    
											   SELECT 
											    a.sdate, a.amount, sname, cname
											FROM
											    sales a
											        JOIN
												    salespeaple b ON (b.snum),
												    sales d
												        JOIN
													    customers c ON (c.cnum)
													WHERE
													    a.sdate = d.sdate
													        AND a.amount = d.amount
														        AND a.cnum = d.cnum
															        AND a.snum = d.snum
																        AND d.snum = b.snum
																	        AND a.cnum = c.cnum; 
																		    
																		 /*Использование джоин для объединения результатов выборки из ьрёх таблиц*/   
																		SELECT 
																			*
																			FROM
																			    sales a
																			        natural JOIN
																				    salespeapl b
																				    join customers c using(cnum);
																				
																				/*ПРи правом соединении таблиц customers и sales natural right join salespeaple
																				получаем список всех покукпателей из таблицы castomers и null-значения там, где покупателям не назначен продавец*/      
																				SELECT 
																				    *
																				FROM
																				    sales a
																				        NATURAL RIGHT JOIN
																					    salespeapl b
																					        right join 
																						    customers c USING (cnum);    
																						    
																						/*с таблицей, полученной в результате соединений, можно использовать условия в предложении where*/    
																						 SELECT 
																						    *
																						FROM
																						    sales a
																						        NATURAL RIGHT JOIN
																							    salespeapl b
																							        RIGHT JOIN
																								    customers c USING (cnum)
																								WHERE
																								    c.city = 'Новосибирск';   
																								    ;
