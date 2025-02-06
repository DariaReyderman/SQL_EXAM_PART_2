-- Alef
SELECT genre, COUNT(movie_name) AS total_movies
FROM movies
GROUP BY genre;

-- Bet
SELECT year, SUM(revenue) AS sum
FROM movies
GROUP BY year;

-- Gimel
SELECT genre, printf('%,.2f', AVG(revenue)) AS avg
FROM movies
GROUP BY genre;

-- Dalet
SELECT genre, language, printf('%,.2f', AVG(revenue)) AS avg
FROM movies
GROUP BY genre, language;

-- Hei
SELECT language, COUNT(movie_name) AS total_movies
FROM movies
GROUP BY language
ORDER BY total_movies LIMIT 1;

-- Vav
SELECT country, COUNT(movie_name) AS total_movies
FROM movies
GROUP BY country
ORDER BY total_movies DESC LIMIT 1;

-- Zain
SELECT genre, COUNT(movie_name) AS total_movies
FROM movies
GROUP BY genre
HAVING COUNT(movie_name) > 2;

-- Het
SELECT year, SUM(revenue) AS sum
FROM movies
GROUP BY year
HAVING sum > 1000;

-- Tet
SELECT language, COUNT(movie_name) AS total_movies
FROM movies
GROUP BY language
HAVING total_movies >= 3;