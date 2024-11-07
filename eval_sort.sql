/*Использование выражений в предложении Select*/
SELECT 
    `salespeapl`.`snam`, 
    `salespeapl`.`comm` * 100 AS 'Комм в %'
FROM
    shop.salespeapl;
    
/*Добавление текста в результаты запроса*/
SELECT 
    `salespeapl`.`snam`, 
    `salespeapl`.`comm` * 100 AS 'Комм в %', '%'
FROM
    shop.salespeapl;
 
 /*форматирование отчта средствами sql*/
SELECT 
'' as 'на дату ', sdate as 'дата', ' обслужено ', 
count(*)as 'количество', ' заказов'
from
   shop.sales
group by sdate;

/*выражение interval для вычислкения смещённых дат*/
SELECT 
    sdate
FROM
    sales
WHERE
     sdate+interval 30 day;
     
/*сортировка значений*/
SELECT 
    *
FROM
    sales
ORDER BY sdate;

/*сортировка значений по нескольким столбцам*/
SELECT 
    *
FROM
    sales
ORDER BY sdate , amount DESC;

/*сортировка определённых столбцов*/
SELECT 
    *
FROM
    sales
ORDER BY 3 DESC, 4;

/*Сортировка по агрегатным группам*/
SELECT 
    snam, sdate, MAX(amount)
FROM
    sales
GROUP BY snam , sdate
ORDER BY snam , sdate;

/*Сортировка по значению, подсчитанному агрегатной функцией*/
SELECT 
    snam, sdate, MAX(amount)
FROM
    sales
GROUP BY snam , sdate
ORDER BY snam , 3 desc;

/*null-значения и сортировка*/
SELECT 
    *
FROM
    shop.customers
ORDER BY rating;
