-- Alef
SELECT t.first_name AS first_name,
	t.last_name AS last_name,
	c.country_name AS country
FROM tourists t
INNER JOIN countries c ON t.country_id = c.id;

-- Bet
SELECT t.first_name AS first_name,
	t.last_name AS last_name,
	tours.*
FROM tourists t
INNER JOIN tours ON t.tour_id = tours.id;

-- Gimel
SELECT t.first_name AS first_name,
	t.last_name AS last_name,
	tours.*
FROM tourists t
LEFT JOIN tours ON t.tour_id = tours.id;

-- Dalet
SELECT t.first_name AS first_name,
	t.last_name AS last_name,
	tours.*
FROM tourists t
FULL OUTER JOIN tours ON t.tour_id = tours.id;

-- Hei
SELECT t.first_name AS first_name,
	t.last_name AS last_name,
	tours.tour_name AS tour_name
FROM tourists t
LEFT JOIN tours ON t.tour_id = tours.id
WHERE tours.id IS NULL;

DELETE FROM tourists WHERE first_name LIKE 'Leonardo';

-- Vav
SELECT tours.id AS id,
	tours.tour_name AS tour,
	t.first_name AS first_name,
	t.last_name AS last_name
FROM tours
LEFT JOIN tourists t ON tours.id = t.tour_id
WHERE t.tour_id IS NULL;

UPDATE tours
SET start_date = DATE(start_date, '+1 year'),
	end_date = DATE(end_date, '+1 year')
WHERE tour_name LIKE 'Jerusalem Historical Tour';

-- Zain
SELECT COUNT(tours.id) AS total_tours
FROM tours
LEFT JOIN tourists t ON tours.id = t.tour_id
WHERE t.tour_id IS NULL;

-- Het
SELECT t.id AS tourist_id,
	t.first_name AS first_name,
	t.last_name AS last_name,
	tours.id AS id,
	tours.tour_name AS tour_name
FROM tourists t
CROSS JOIN tours;