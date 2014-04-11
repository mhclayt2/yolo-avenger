
    DECLARE @BatchSize INT = 50
    DECLARE @ToBeProc TABLE (ID INT, PRIMARY KEY(ID))
    INSERT INTO @ToBeProc(ID)
    SELECT DISTINCT   ID
    /**************** SELECT TABLE/DATA TO BATCH BY HERE *************************/
    
RAISERROR ('Number to be checked: %d Rows', 0, 1, @@ROWCOUNT) WITH NOWAIT;
    DECLARE @BatchCount INT = (CASE WHEN (SELECT COUNT(9) / @BatchSize FROM @ToBeProc) < 1 THEN 1 ELSE (SELECT COUNT(9) / @BatchSize FROM @ToBeProc) END)
RAISERROR ('Total Batch Count: %d', 0, 1, @BatchCount) WITH NOWAIT;
    DECLARE Chunk CURSOR FOR
    SELECT BatchNumber, MIN(ID) MinID, MAX(ID) MaxID
    FROM (select ID, NTILE(@BatchCount) OVER (ORDER BY ID) BatchNumber
          FROM @ToBeProc) x
    GROUP BY BatchNumber
    DECLARE @BatchNumber INT, @MinID INT, @MaxID INT, @DeletedCount INT
    OPEN Chunk
    FETCH NEXT FROM Chunk INTO @BatchNumber, @MinID, @MaxID
        WHILE (@@FETCH_STATUS <> -1)
        BEGIN
            IF (@@FETCH_STATUS <> -2)
            BEGIN
                RAISERROR ('Running %d of %d: %d - %d', 0, 1, @BatchNumber, @BatchCount, @MinID, @MaxID) WITH NOWAIT;
        
        
         
/******* DO UPDATE OR WHATEVER HERE ***************************/
        
        
      
RAISERROR ('Batch Number: %d', 0, 1, @BatchNumber) WITH NOWAIT;
        END
    FETCH NEXT FROM Chunk INTO @BatchNumber, @MinID, @MaxID
    END
    CLOSE Chunk;
    DEALLOCATE Chunk;
    

