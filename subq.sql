/* Подзапросы */
/* Простейшая форма подзапроса- сравнение нужного значения с результатом выполнения подзапроса
Подзапрос должен возвращать единственное значение*/

SELECT 
    *
FROM
    sales
WHERE
    snam = (SELECT 
	            snam
		        FROM
			            salespeapl
				        WHERE
					            sname = 'Татьяна');


					/*Если подзапрос может вернуть несколько значений, то возможно использование ин во внешнем запросе */            
SELECT 
    *
FROM
    sales
WHERE
    snam IN (SELECT 
	            snam
		        FROM
			            salespeapl
				        WHERE
					            sname = 'Татьяна');
					            
					SELECT 
					    *
					FROM
					    sales
					WHERE
					    snam IN (SELECT 
						            snam
							        FROM
								            salespeapl
									        WHERE
										            city = 'Новосибирск');


										/* список продаж покупателю с номером 202*/
SELECT 
    amount, sdate, salespeapl.sname
FROM
    sales natural join salespeapl
WHERE
    snam IN (SELECT 
	            snam
		        FROM
			            sales
				        WHERE
					            cnam = '202');
					  
					/*Использование агрегатных функций в подзапросах*/
SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
	            AVG(amount)
		        FROM
			            sales
				        WHERE
					            sdate = '2024-09-12');

					/*ПРимер использования выражений в подзапросах*/            
SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
	           500 + AVG(amount)
		        FROM
			            sales
				        WHERE
					            sdate = '2024-09-12' and sdate < '2024-09-12' + interval 15 day);
					            
					 /*подзапросы в предложении HAVING*/      
 SELECT 
    rating, COUNT(DISTINCT cnam)
FROM
    customers
GROUP BY rating
HAVING rating > (SELECT 
	        AVG(rating)
		    FROM
		        customers
			    WHERE
			        city = 'Новосибирск');
			 
