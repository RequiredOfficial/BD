SELECT 
    u.fullName AS client,
    sp.sportName AS sport,
    vl.visitDate AS date,
    cs.dayName AS day,
    cs.startTime AS time,
    tr.fullName AS coach,
    sp.price AS price
FROM users u
JOIN visitsLog vl ON u.userId = vl.userId
JOIN sports sp ON vl.sportId = sp.sportId
LEFT JOIN classSchedule cs ON sp.sportId = cs.sportId
    AND DATENAME(dw, vl.visitDate) = cs.dayName 
LEFT JOIN trainers tr ON cs.trainerId = tr.trainerId
WHERE vl.visitDate >= '2024-03-01'
ORDER BY vl.visitDate DESC, u.fullName;