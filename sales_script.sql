-- data analysis project using sales data

SELECT * 
FROM salesdata.`sales_data_sample 2`;

select distinct YEAR_ID
FROM salesdata.`sales_data_sample 2`;

-- grouping sales by the producsts

select PRODUCTLINE, sum(round(sales)) as revenue
from salesdata.`sales_data_sample 2`
group by 1
order by 2 desc;

select YEAR_ID, sum(round(sales)) as revenue
from salesdata.`sales_data_sample 2`
group by 1
order by 2 desc;

select DEALSIZE, sum(round(sales)) as revenue
from salesdata.`sales_data_sample 2`
group by 1
order by 2 desc;

-- figuring out the most prfitable month in each year

select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency, YEAR_ID
from salesdata.`sales_data_sample 2`
where YEAR_ID = 2004 
group by 1, 4
order by 2 desc;

select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency, YEAR_ID
from salesdata.`sales_data_sample 2`
where YEAR_ID = 2005 
group by 1, 4
order by 2 desc;

select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency, YEAR_ID
from salesdata.`sales_data_sample 2`
where YEAR_ID = 2003
group by 1, 4
order by 2 desc, 3;

-- November is selling the best, which product is selling the best in novemeber

select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from `sales_data_sample 2`
where YEAR_ID = 2004 and MONTH_ID = 11 
group by  MONTH_ID, PRODUCTLINE
order by 3 desc


