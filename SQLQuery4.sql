DECLARE @today VARCHAR(20) = DATENAME(dw, GETDATE());

SELECT 
    cs.dayName AS day,
    cs.startTime AS time,
    sp.sportName AS sport,
    'Room#' + CAST((cs.slotId % 3 + 1) AS VARCHAR) AS room,
    tr.fullName AS coach,
    sp.price AS price
FROM classSchedule cs
JOIN sports sp ON cs.sportId = sp.sportId
JOIN trainers tr ON cs.trainerId = tr.trainerId
WHERE cs.dayName = @today
ORDER BY cs.startTime;