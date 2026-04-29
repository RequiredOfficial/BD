SELECT 
    u.fullName AS name,
    u.phone AS phone,
    p.passType AS type,
    p.startDate AS start,
    p.endDate AS [end],
    DATEDIFF(DAY, p.endDate, GETDATE()) AS expiredDays
FROM users u
JOIN passes p ON u.userId = p.userId
WHERE p.endDate < GETDATE() 
ORDER BY p.endDate DESC;