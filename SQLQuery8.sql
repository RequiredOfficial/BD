SELECT 
    u.fullName AS name,
    u.phone AS phone,
    MAX(p.endDate) AS lastPassEnd,
    COUNT(vl.visitId) AS visitsLastWeek
FROM users u
LEFT JOIN visitsLog vl ON u.userId = vl.userId 
    AND vl.visitDate >= DATEADD(WEEK, -1, GETDATE())
LEFT JOIN passes p ON u.userId = p.userId
GROUP BY u.userId, u.fullName, u.phone
HAVING COUNT(vl.visitId) = 0  
ORDER BY u.fullName;