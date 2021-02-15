SELECT *
FROM app_store_apps
Limit 100;

SELECT *
FROM play_store_apps
Limit 100;

select DISTINCT name
from play_store_apps
WHERE name ILIKE '%facebook';


SELECT name
FROM app_store_apps;
--7197 rows 

SELECT DISTINCT(name)
FROM app_store_apps
ORDER BY name ASC;
--7195 rows

SELECT name
FROM play_store_apps;
--10840 rows 

SELECT DISTINCT(name)
FROM play_store_apps
ORDER BY name ASC;
--9659 rows

SELECT price, review_count
FROM app_store_apps
ORDER BY price DESC;

SELECT price
FROM play_store_apps
ORDER BY price DESC;




SELECT CAST(price AS money), rating, content_rating, name, CAST(review_count AS numeric)
FROM app_store_apps
ORDER BY review_count DESC;

SELECT CAST(price AS money), rating, content_rating, name, CAST(review_count AS numeric)
FROM play_store_apps
ORDER BY review_count DESC;

--17709

SELECT *
FROM play_store_apps FULL JOIN app_store_apps
USING(name);

--- to match die tables and delete the NULLs 

SELECT *
	FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
	ON ios.name=android.name
	WHERE ios IS NOT NULL;

-- Alias the columns + cast prices in money

			
SELECT ios.name, ios.rating AS ios_rating, 
	android.rating AS android_rating, CAST(ios.price AS money) AS ios_price,
	 CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 android.review_count AS android_review, ios.primary_genre AS ios_genre,
	android.genres AS android_genre
		FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
		ON ios.name=android.name
			WHERE ios IS NOT NULL;
