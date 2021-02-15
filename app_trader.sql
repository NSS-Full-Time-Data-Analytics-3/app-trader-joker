/* App Trader
Your team has been hired by a new company called App Trader to help them explore and gain insights from apps that are made available through the Apple App
Store and Android Play Store. App Trader is a broker that purchases the rights to apps from developers in order to market the apps and offer in-app purchase.
App developers retain all money from users purchasing the app, and they retain half of the money made from in-app purchases. App Trader will be solely 
responsible for marketing apps they purchase rights to.
Unfortunately, the data for Apple App Store apps and Android Play Store Apps is located in separate tables with no referential integrity.*/

/* 2. Assumptions
Based on research completed prior to launching App Trader as a company, you can assume the following:
a. App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from free up to $1.00, the purchase price is $10,000.*/
--Take all null prices and $1.00 and mark up to $10,000.00
--Everything that is not Null and everything that is not $1.00 and multiple by $10,000.00

SELECT *
FROM app_store_apps

SELECT *
FROM play_store_apps

SELECT DISTINCT primary_genre
FROM app_store_apps


/* b. Apps earn $5000 per month on average from in-app advertising and in-app purchases regardless of the price of the app.*/


/* c. App Trader will spend an average of $1000 per month to market an app regardless of the price of the app. If App Trader owns rights to the app in both 
stores, it can market the app for both stores for a single cost of $1000 per month.*/


/* d. For every half point that an app gains in rating, its projected lifespan increases by one year, in other words, an app with a rating of 0 can be 
expected to be in use for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app with a rating of 4.0 can be expected to last 
9 years. Ratings should be rounded to the nearest 0.5 to evaluate an app's likely longevity.*/


/* e. App Trader would prefer to work with apps that are available in both the App Store and the Play Store since they can market both for the same $1000 
per month. */




/* 3. Deliverables */
/* a. Develop some general recommendations as to the price range, genre, content rating, or anything else for apps that the company should target.*/


/* b. Develop a Top 10 List of the apps that App Trader should buy next week for its Black Friday debut.*/


/* c. Prepare a 5-10 minute presentation for the leadership team of App Trader to inform them of your recommendations.*/