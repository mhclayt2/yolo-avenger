USE [Clayton]
GO

/****** Object:  UserDefinedFunction [dbo].[f_split]    Script Date: 02/21/2014 08:55:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[f_split]
GO

USE [Clayton]
GO

/****** Object:  UserDefinedFunction [dbo].[f_split]    Script Date: 02/21/2014 08:55:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE function [dbo].[f_split]
(
  @a varchar(max), 
  @delimiter varchar(20)
)
RETURNS @t TABLE(substr varchar(200))
as
begin
set @a = @a + @delimiter
;with a as
(
  select cast(1 as bigint) f1, charindex(@delimiter, @a) f2
  where len(@a) > 0
  union all
  select f2 + (len(@delimiter)) + 1, charindex(@delimiter, @a, f2+1)
  from a
  where f2 > 0
)
insert @t
select substring(@a, f1, f2 - f1) from a
where f1 < f2
return
end



GO


