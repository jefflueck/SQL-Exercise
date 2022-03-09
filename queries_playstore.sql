-- Comments in SQL Start with dash-dash --

-[ RECORD 1 ]---+-------------------
id              | 1
app_name        | Facebook
category        | SOCIAL
rating          | 4.1
reviews         | 78158306
size            | Varies with device
min_installs    | 1000000000
price           | 0
content_rating  | Teen
genres          | {Social}
last_updated    | 2018-08-03
current_version | Varies with device
android_version | Varies with device

-- 1
playstore=# SELECT id FROM analytics WHERE id = 1880;
-- Output:
-[ RECORD 1 ]
id | 1880

-- 2
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- 4
SELECT app_name, reviews FROM analytics GROUP BY app_name, reviews  ORDER BY reviews desc LIMIT(5);

-- 5
SELECT app_name, rating FROM analytics WHERE rating >= 4.8 ORDER BY rating desc;

-- 6
-- Mine
SELECT AVG(rating) FROM analytics GROUP BY category, app_name;
-- Solution
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY avg desc;

-- 7
-- Mine
SELECT MAX(price) app_name, price, rating FROM analytics WHERE  rating < 3 GROUP BY app_name, price, rating LIMIT(1);
-- Solution
SELECT app_name, price, rating FROM analytics
  WHERE rating < 3
  ORDER BY price DESC
  LIMIT 1;

-- 8
SELECT app_name, min_installs, rating FROM analytics WHERE min_installs < 50 AND rating > 0 ORDER BY rating desc;

-- 9
SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews > 10000;

-- 10
SELECT app_name, price, reviews FROM analytics WHERE price > .10 AND price < 1.00;

-- 11
-- Mine
SELECT app_name, MAX(last_updated) FROM analytics GROUP BY app_name;
-- Solution
SELECT * FROM analytics
  WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Option 2: without a subquery
SELECT * FROM analytics
  ORDER BY last_updated LIMIT 1;

  -- 12
SELECT * FROM analytics ORDER BY price desc LIMIT(1);

-- 13
-- Mine
SELECT reviews, SUM(reviews) as total FROM analytics GROUP BY reviews ORDER BY total;
-- Solution
SELECT SUM(reviews) AS "All the Reviews" FROM analytics;

-- 14
-- Mine
SELECT category, COUNT(*) > 300 FROM analytics GROUP BY category;
-- Solution
SELECT category FROM analytics
  GROUP BY category
  HAVING COUNT(*) > 300;

-- 15
-- Solution Study and go over with mentor.
SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;
