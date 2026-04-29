SELECT 
    u.fullName AS name,
    u.phone AS phone,
    COUNT(DISTINCT vl.sportId) AS sportsCount
FROM users u
JOIN visitsLog vl ON u.userId = vl.userId
GROUP BY u.userId, u.fullName, u.phone
HAVING COUNT(DISTINCT vl.sportId) > 3
ORDER BY sportsCount DESC;