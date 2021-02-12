--
SELECT CAST(price AS money), rating, name, review_count, content_rating
FROM play_store_apps;
--
SELECT CAST(price AS money), rating, name, CAST(review_count AS integer), content_rating
	FROM app_store_apps
	ORDER BY review_count DESC;
--

--2 a)
--2 b)
--2 c)
--2 d)
--2 e)
--3 a)
--3 b)
--3 c)