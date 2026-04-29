SELECT TOP 1
    t.fullName AS name,
    t.phone AS phone,
    COUNT(DISTINCT cs.sportId) AS sportsCount,
    STRING_AGG(sp.sportName, ', ') WITHIN GROUP (ORDER BY sp.sportName) AS sportList
FROM trainers t
JOIN classSchedule cs ON t.trainerId = cs.trainerId
JOIN sports sp ON cs.sportId = sp.sportId
GROUP BY t.trainerId, t.fullName, t.phone
ORDER BY sportsCount DESC;