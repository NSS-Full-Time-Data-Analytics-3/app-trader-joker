
--
WITH both_store_apps AS (SELECT ios.name, ios.rating AS ios_rating, 
						android.rating AS android_rating, CAST(ios.price AS money) AS ios_price,
		 				CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 					android.review_count AS android_review, ios.primary_genre AS ios_genre,
						android.genres AS android_genre
						FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
						ON ios.name=android.name
						WHERE ios IS NOT NULL 
						AND android IS NOT NULL
						ORDER BY ios_rating DESC),

	 top_10 AS (SELECT *
				FROM both_store_apps
				WHERE android_rating >= (SELECT ROUND(AVG(android_rating)) FROM both_store_apps)
				AND ios_rating >= (SELECT ROUND(AVG(ios_rating)) FROM both_store_apps)
				ORDER BY android_price ASC
				LIMIT 10 OFFSET 14)

SELECT *
FROM top_10;