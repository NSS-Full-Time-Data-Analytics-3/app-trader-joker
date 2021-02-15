WITH both_store_apps AS (SELECT ios.name, ROUND(ios.rating) AS ios_rating, 
							ROUND(android.rating) AS android_rating, CAST(ios.price AS money) AS ios_price,
		 					CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 						android.review_count AS android_review, ios.primary_genre AS ios_genre,
							android.genres AS android_genre, ios.content_rating AS ios_age, android.content_rating AS android_age
							FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
							ON ios.name=android.name
							WHERE ios IS NOT NULL 
							AND android IS NOT NULL
							ORDER BY ios_rating DESC),
							
				 top_10 AS (SELECT *,
						CASE WHEN ios_price = '$0.00' THEN '$20,000'
						WHEN ios_price = '$1.99' THEN '$20,000'
						WHEN ios_price = '$2.99' THEN '$30,000'
						WHEN android_price = '$0.00' THEN '$20,000'
						WHEN android_price = '$1.99' THEN '$20,000'
						WHEN android_price ='2.99' THEN '$30,000'
						ELSE 'Undetermined' END AS buy_in_price
						FROM both_store_apps
						WHERE android_rating >= (SELECT ROUND(MAX(android_rating)) FROM both_store_apps)
						AND ios_rating >= (SELECT ROUND(MAX(ios_rating)) FROM both_store_apps)
						AND ios_review > 25000
						ORDER BY android_price ASC
						LIMIT 10 OFFSET 10),
		
	buy_in AS (SELECT *,
					CASE WHEN buy_in_price = '$10,000' THEN '$1,500'
					WHEN buy_in_price = '$20,000' THEN '$1,500'
					WHEN buy_in_price = '$30,000' THEN '$1,500'
					END AS monthly_revenue
					FROM top_10),
ios_lifetime AS (SELECT *,
			CASE WHEN ios_rating = 1 THEN '$18,000'
			WHEN ios_rating = 2 THEN '$54,000'
			WHEN ios_rating = 3 THEN '$90,000'
			WHEN ios_rating = 4 THEN '$162,000'
			WHEN ios_rating = 5 THEN '$198,000'
			ELSE 'Undetermined' END AS ios_lifetime_profit
			FROM buy_in)
SELECT *,
CASE WHEN android_rating = 1 THEN '$18,000'
WHEN android_rating = 2 THEN '$54,000'
WHEN android_rating = 3 THEN '$90,000'
WHEN android_rating = 4 THEN '$162,000'
WHEN android_rating = 5 THEN '$198,000'
ELSE 'undetermined' END AS android_lifetime_profit
FROM ios_lifetime;



--------------------------------------------------------------------------------------------------

SELECT *
FROM app_store_apps;

SELECT * 
FROM play_store_apps;

SELECT AVG(rating)
FROM app_store_apps;

-- Average Rating app_store_apps: 3.5269556759761014

SELECT AVG(rating)
FROM play_store_apps;

-- Average Rating play_store_apps: 4.191757420456972


--------------------------------------------


WITH Average_genres AS (SELECT ios.name, ROUND(ios.rating) AS ios_rating, 
							ROUND(android.rating) AS android_rating, CAST(ios.price AS money) AS ios_price,
		 					CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 						android.review_count AS android_review, ios.primary_genre AS ios_genre,
							android.genres AS android_genre, ios.content_rating AS ios_age, android.content_rating AS android_age
							FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
							ON ios.name=android.name
							WHERE ios IS NOT NULL 
							AND android IS NOT NULL
							ORDER BY ios_rating DESC)
							
							SELECT AVG(ios_rating)
							FROM average_genres
							WHERE ios_genre = 'Games';
							----4.754385964912281
							
							
WITH Average_genres AS (SELECT ios.name, ROUND(ios.rating) AS ios_rating, 
							ROUND(android.rating) AS android_rating, CAST(ios.price AS money) AS ios_price,
		 					CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 						android.review_count AS android_review, ios.primary_genre AS ios_genre,
							android.genres AS android_genre, ios.content_rating AS ios_age, android.content_rating AS android_age
							FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
							ON ios.name=android.name
							WHERE ios IS NOT NULL 
							AND android IS NOT NULL
							ORDER BY ios_rating DESC)
							
							SELECT AVG(ios_rating)
							FROM average_genres
							WHERE ios_genre = 'Games';
							----4.754385964912281
							
							
							
WITH Average_genres AS (SELECT ios.name, ROUND(ios.rating) AS ios_rating, 
							ROUND(android.rating) AS android_rating, CAST(ios.price AS money) AS ios_price,
		 					CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 						android.review_count AS android_review, ios.primary_genre AS ios_genre,
							android.genres AS android_genre, ios.content_rating AS ios_age, android.content_rating AS android_age
							FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
							ON ios.name=android.name
							WHERE ios IS NOT NULL 
							AND android IS NOT NULL
							ORDER BY ios_rating DESC)
							
							SELECT AVG(ios_rating), AVG(android_rating)
							WHERE ios_genre = 'Games'
							FROM average_genres;



