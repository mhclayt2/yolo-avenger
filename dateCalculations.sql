datediff(hour,birth_date,GETDATE())/8766 as Age
select dateadd(hour, datediff(hour, 0, @dt), 0)
