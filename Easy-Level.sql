-- 1.There are three issues that include the words "index" and "Oracle". Find the call_date for each of them
SELECT call_date, call_ref
FROM Issue
WHERE (detail LIKE '%index%') AND (detail LIKE '%oracle%');

-- 2.Samantha Hall made three calls on 2017-08-14. Show the date and time for each
SELECT
	i.call_date,
	c.first_name,
	c.last_name
FROM Issue i JOIN Caller c ON (c.caller_id = i.caller_id)
WHERE
	c.first_name = 'Samantha'
	AND c.last_name = 'Hall'
	AND i.call_date LIKE '%2017-08-14%';

-- 3.There are 500 calls in the system (roughly). Write a query that shows the number that have each status.
SELECT status, Count(*) Volume
FROM Issue
GROUP BY status;

-- 4. Calls are not normally assigned to a manager but it does happen. How many calls have been assigned to staff who are at Manager Level?
SELECT COUNT(*) mlcc
FROM Issue i 
JOIN Staff s ON (i.Assigned_to = s.Staff_code)
JOIN Level l ON (s.Level_code = l.Level_code)
WHERE l.Manager = 'Y';

-- 5.Show the manager for each shift. Your output should include the shift date and type; also the first and last name of the manager.
SELECT
	sh.Shift_date,
	sh.Shift_type,
	s.first_name,
	s.last_name
FROM Shift sh
JOIN Staff s ON (sh.Manager = s.Staff_Code)
ORDER BY sh.Shift_date;
