WITH both_store_apps AS (SELECT ios.name, ROUND(ios.rating) AS ios_rating, 
						ROUND(android.rating) AS android_rating, CAST(ios.price AS money) AS ios_price,
		 				CAST(android.price AS money) AS android_price, CAST(ios.review_count AS integer) AS ios_review,
	 					android.review_count AS android_review, ios.primary_genre AS ios_genre,
						android.genres AS android_genre
						FROM play_store_apps AS android FULL JOIN app_store_apps AS ios
						ON ios.name=android.name
						WHERE ios IS NOT NULL 
						AND android IS NOT NULL
						ORDER BY ios_rating DESC),

	 --top_10 AS (SELECT *
				--FROM both_store_apps
				--WHERE android_rating >= (SELECT ROUND(AVG(android_rating)) FROM both_store_apps)
				--AND ios_rating >= (SELECT ROUND(AVG(ios_rating)) FROM both_store_apps)
				--ORDER BY android_price ASC
				--LIMIT 10 OFFSET 12)
				
				
	top_10 AS (SELECT *
			   
				FROM both_store_apps
				WHERE android_rating >= (SELECT ROUND(AVG(android_rating)) FROM both_store_apps)
			   			(SELECT *,
									    CASE WHEN ios_rating = '0' THEN '1'
	 									WHEN ios_rating = '1' THEN '3'
	 									WHEN ios_rating = '2' THEN '5'
	 									WHEN ios_rating = '3' THEN '7'
	 									WHEN ios_rating = '4' THEN '9'
	 									WHEN ios_rating = '5' THEN '11' END as ios_life_span)		
				AND ios_rating >= (SELECT ROUND(AVG(ios_rating)) FROM both_store_apps)
				ORDER BY android_price ASC
				LIMIT 10 OFFSET 12)
				
	

--SELECT *,
--CASE WHEN ios_price >= '$0.00' THEN '$10,000' END AS buy_in_price
--FROM top_10;

--SELECT *,
--CASE WHEN ios_rating = '0' THEN '1'
	 --WHEN ios_rating = '1' THEN '3'
	 --WHEN ios_rating = '2' THEN '5'
	 --WHEN ios_rating = '3' THEN '7'
	 --WHEN ios_rating = '4' THEN '9'
	 --WHEN ios_rating = '5' THEN '11' END as ios_life_span
--FROM top_10;
	 
SELECT *,	 
CASE WHEN ios_life_span = '1' THEN '18,000'
	 WHEN ios_life_span = '3' THEN '54,000'	
	 WHEN ios_life_span = '5' THEN '90,000'
	 WHEN ios_life_span = '7' THEN '126,000'
	 WHEN ios_life_span = '9' THEN '162,000'
	 WHEN ios_life_span = '11' THEN '198,000' END as ios_revenue_life_span
FROM top_10;

