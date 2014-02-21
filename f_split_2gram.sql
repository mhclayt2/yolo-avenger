USE [Clayton]
GO

/****** Object:  UserDefinedFunction [dbo].[f_split_2gram]    Script Date: 02/21/2014 09:04:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_split_2gram]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[f_split_2gram]
GO

USE [Clayton]
GO

/****** Object:  UserDefinedFunction [dbo].[f_split_2gram]    Script Date: 02/21/2014 09:04:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE function [dbo].[f_split_2gram]
(
  @a varchar(max),
   @delimiter varchar(20)
)
RETURNS @t TABLE(substr varchar(200))
as
begin
set @a = @a + @delimiter



-- declare @a varchar(max)= '"F" TRUCK REPAIR'
--  declare @delimiter varchar(20)= ' '
--set @a = @a + @delimiter
;with  nGram as
(
  select cast(1 as bigint) f1, charindex(@delimiter, @a, charindex(@delimiter, @a)+1) f2
  where len(@a) > 0
  union all
  select f2 + (len(@delimiter))-(CHARINDEX(@delimiter, reverse(substring(@a, f1, f2 - f1)))-1) f1, charindex(@delimiter, @a, f2+1) f2
  from nGram
  where f2 > 0 
)
insert @t
select *
from 
(
select distinct --f1, f2,len(@delimiter) d, CHARINDEX(@delimiter, reverse(substring(@a, f1, f2 - 1)))-1 e, charindex(@delimiter, @a, f2+1) f, substring(@a, f1, f2 - f1)c, 
substring(@a, f1, f2 - f1) t
from nGram
where f1 < f2
union 
select distinct --f1, f2,len(@delimiter) d, CHARINDEX(@delimiter, reverse(substring(@a, f1, f2 - 1)))-1 e,charindex(@delimiter, @a, f2+1) f ,  substring(@a, f1, f2 - f1) c,
--t, 
--substring(@a, f1, f2 - f1),
b.substr as t
from nGram
cross apply (select substr from dbo.f_split(substring(@a, f1, f2 - f1),@delimiter) )b 
where f1 < f2
) c
return
end



GO


