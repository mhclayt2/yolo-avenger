declare @precision int = -4
declare @upperlimit int = 1500000
declare @lowerlimit int = -10000



select case when XXXX < @lowerlimit then @lowerlimit
	when XXXX > @upperlimit then @upperlimit 
	else ROUND(XXXX, @precision,1) end as XXXX_bin
	,cust.cnt Customer_Cnt
	,count(9) XXXX_Cnt
from 


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


								
group by  case when XXXX < @lowerlimit then @lowerlimit
	when XXXX > @upperlimit then @upperlimit 
	else ROUND(XXXX, @precision,1) end
order by  case when XXXX < @lowerlimit then @lowerlimit
	when XXXX > @upperlimit then @upperlimit 
	else ROUND(XXXX, @precision,1) end
