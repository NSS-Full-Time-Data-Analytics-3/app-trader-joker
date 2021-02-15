/* App Trader
Your team has been hired by a new company called App Trader to help them explore and gain insights from apps that are made available through the Apple App
Store and Android Play Store. App Trader is a broker that purchases the rights to apps from developers in order to market the apps and offer in-app purchase.
App developers retain all money from users purchasing the app, and they retain half of the money made from in-app purchases. App Trader will be solely 
responsible for marketing apps they purchase rights to.
Unfortunately, the data for Apple App Store apps and Android Play Store Apps is located in separate tables with no referential integrity.*/

/* 2. Assumptions
Based on research completed prior to launching App Trader as a company, you can assume the following:
a. App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from free up to $1.00, the purchase price is $10,000.*/
--All NULL + =< $1.00 = $10,000.00
--Everything > $1.00 * $10,000.00

/*We chose Apps with more than review 25,00 reviews that sold for under $1.00.

*/

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
						CASE WHEN ios_price = '$0.00' THEN '$10,000'
						WHEN ios_price = '$1.99' THEN '$20,000'
						WHEN ios_price = '$2.99' THEN '$30,000'
						WHEN android_price = '$0.00' THEN '$10,000'
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


SELECT *
FROM app_store_apps

SELECT *
FROM play_store_apps

SELECT AVG(rating)
FROM app_store_apps;

SELECT AVG(rating)
FROM play_store_apps;

SELECT DISTINCT primary_genre
FROM app_store_apps


/* b. Apps earn $5000 per month on average from in-app advertising and in-app purchases regardless of the price of the app.*/


/* c. App Trader will spend an average of $1000 per month to market an app regardless of the price of the app. If App Trader owns rights to the app in both 
stores, it can market the app for both stores for a single cost of $1000 per month.*/
--we want to point app trader to apps in both stores that have high reviews


/* d. For every half point that an app gains in rating, its projected lifespan increases by one year, in other words, an app with a rating of 0 can be 
expected to be in use for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app with a rating of 4.0 can be expected to last 
9 years. Ratings should be rounded to the nearest 0.5 to evaluate an app's likely longevity.*/


/* e. App Trader would prefer to work with apps that are available in both the App Store and the Play Store since they can market both for the same $1000 
per month. */




/* 3. Deliverables */
/* a. Develop some general recommendations as to the price range, genre, content rating, or anything else for apps that the company should target.*/


/* b. Develop a Top 10 List of the apps that App Trader should buy next week for its Black Friday debut.*/


/* c. Prepare a 5-10 minute presentation for the leadership team of App Trader to inform them of your recommendations.*/