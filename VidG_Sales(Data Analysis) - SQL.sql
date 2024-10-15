select * from vdsales;

-- Number of games released per genre 
SELECT genre, COUNT(*) AS number_of_games
FROM vdsales
GROUP BY genre
ORDER BY number_of_games DESC;

-- Games released by Nintendo in the 2000s
SELECT name, year, platform
FROM vdsales
WHERE publisher = 'Nintendo' AND year BETWEEN 2000 AND 2009
ORDER BY year DESC;

-- Top 5 publisher by global sales (in millions)
SELECT publisher, ROUND(SUM(global_sales)) AS total_global_sales
FROM vdsales
GROUP BY publisher
ORDER BY total_global_sales DESC
LIMIT 5;

-- Games released on multiple platforms
SELECT name AS Game_Name, COUNT(DISTINCT platform) AS platform_count
FROM vdsales
GROUP BY name
HAVING platform_count > 1;

-- Total sales per year for each region (in millions)
SELECT year, 
       ROUND(SUM(na_sales), 2) AS total_na_sales, 
       ROUND(SUM(eu_sales), 2) AS total_eu_sales, 
       ROUND(SUM(jp_sales), 2) AS total_jp_sales, 
       ROUND(SUM(other_sales), 2) AS total_other_sales
FROM vdsales
GROUP BY year
ORDER BY year;

-- Top 10 games by global sales (in millions)
SELECT name, global_sales
FROM vdsales
ORDER BY global_sales DESC
LIMIT 10;

-- Total global sales per platform (in millions)
SELECT platform, ROUND(SUM(global_sales), 2) AS total_sales
FROM vdsales
GROUP BY platform
ORDER BY total_sales DESC;

-- Average sales per region (in millions) for sports genre
SELECT ROUND(AVG(na_sales), 2) AS avg_na_sales, ROUND(AVG(eu_sales), 2) AS avg_eu_sales, ROUND(AVG(jp_sales), 2)AS avg_jp_sales
FROM vdsales
WHERE genre = 'Sports';

-- Games with over 10 million sales (in millions) in North America
SELECT name, platform, na_sales
FROM vdsales
WHERE na_sales > 10
ORDER BY na_sales DESC;

-- Top 10 games by sales (in millions) in Japan
SELECT name, jp_sales
FROM vdsales
ORDER BY jp_sales DESC
LIMIT 10;




