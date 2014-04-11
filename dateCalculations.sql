datediff(hour,birth_date,GETDATE())/8766 as Age -- calculate age


select dateadd(hour, datediff(hour, 0, @dt), 0) -- truncate datetime to recent
