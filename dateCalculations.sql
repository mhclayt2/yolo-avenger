datediff(hour,birth_date,GETDATE())/8766 as Age -- calculate age


select dateadd(hour, datediff(hour, 0, @dt), 0) -- truncate datetime to recent



--- date diff approximation

declare @startDate datetime = dateadd(second, -1269, getdate())

declare @endDate datetime = getdate()



select case when datediff(second, @startDate,@endDate) <360 then cast(datediff(second, @startDate,@endDate) as varchar) +' seconds'
	when datediff(minute, @startDate,@endDate) <120 then cast(datediff(minute, @startDate,@endDate) as varchar)+' minutes'
	when datediff(hour, @startDate,@endDate) <72 then cast(datediff(hour, @startDate,@endDate) as varchar)+' hours'
	when datediff(day, @startDate,@endDate) <60 then 'About '+cast(datediff(day, @startDate,@endDate) as varchar)+' days'
	when datediff(month, @startDate,@endDate) <24 then 'About '+cast(datediff(month, @startDate,@endDate) as varchar)+' months'
	else 'About '+cast(datediff(year, @startDate,@endDate) as varchar)+' years'
	end
