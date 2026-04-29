SELECT 
    sp.sportName AS sport,
    sp.price AS price,
    COUNT(vl.visitId) AS visits,
    COUNT(DISTINCT vl.userId) AS visitors
FROM sports sp
LEFT JOIN visitsLog vl ON sp.sportId = vl.sportId
    AND vl.visitDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY sp.sportId, sp.sportName, sp.price
ORDER BY visits DESC;