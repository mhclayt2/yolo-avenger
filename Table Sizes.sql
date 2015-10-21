select    
      sum(reserved_page_count) * 8.0 / 1024
from    
      sys.dm_db_partition_stats

GO

select    
      sys.objects.name, sum(reserved_page_count) * 8.0 / 1024
from    
      sys.dm_db_partition_stats, sys.objects
where    
      sys.dm_db_partition_stats.object_id = sys.objects.object_id

group by sys.objects.name
order by sum(reserved_page_count) * 8.0 / 1024 desc




SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    i.Name as IndexName,
    t.CreateDate as TableCreateDate,
    t.ModifyDate as TableModifyDate
    sum(p.rows) AS RowCounts,
    SUM(a.total_pages) * 8/1024 AS TotalSpaceMB, 
    SUM(a.used_pages) * 8/1024 AS UsedSpaceMB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8/1024 AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
    AND i.index_id <=1
GROUP BY 
    t.Name, s.Name, p.Rows, i.Name
ORDER BY totalspaceMb desc,
    t.Name
