DECLARE @sportName VARCHAR(50) = 'Yoga';

SELECT 
    u.fullName AS client,
    vl.visitDate AS date,
    cs.startTime AS time,
    tr.fullName AS coach
FROM users u
JOIN visitsLog vl ON u.userId = vl.userId
JOIN sports sp ON vl.sportId = sp.sportId
LEFT JOIN classSchedule cs ON sp.sportId = cs.sportId 
    AND DATENAME(dw, vl.visitDate) = cs.dayName
LEFT JOIN trainers tr ON cs.trainerId = tr.trainerId
WHERE sp.sportName = @sportName
ORDER BY vl.visitDate DESC;