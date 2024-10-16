select * from HollywoodsMostProfitableStories$

--Hello and in today's SQL project, we are tackling Hollywoods most profitable stories from 2007-2011
--First, I will like to check each row and column and know what I am dealing with from this dataset. it's a very necessary step to take before jumping in blindly

SELECT DISTINCT FILM FROM HollywoodsMostProfitableStories$
--74 DISTINCT FILMS ARE IN THIS DATASET

SELECT DISTINCT GENRE FROM HollywoodsMostProfitableStories$
--6 DISTINCT GENRES ARE FOUND IN THIS DATASET

SELECT DISTINCT [LEAD STUDIO] FROM HollywoodsMostProfitableStories$ WHERE [LEAD STUDIO] IS NOT NULL
--THERE ARE 13 DISTINCT LEAD STUDIO INVOLVED IN THIS DATASET

SELECT DISTINCT YEAR FROM HollywoodsMostProfitableStories$
--2007-2011

--DOESN'T SEEM LIKE WE NEED TO TRANSFORM AND STANDARDIZE ANYTHING HERE YET SO WE SHALL ANSWER A FEW BUSINESS QUESTIONS
--QUESTIONS
--1. Find total Films
--2. Total films by genre
--3. Total films by lead studio
--4. Find the number of films per year
--5. Total and Average gross per genre
--6. Highest rotten tomatoes percentage by film
--7. Second highest rotten tomatoes percentage by film only
--8. Bottom 5 films by rotten tomatoes percentage
--9. Find the top 10 films with the highest audience scores.

--ANSWERS
--1
SELECT COUNT(DISTINCT FILM) AS COUNT FROM HollywoodsMostProfitableStories$

--2.
SELECT GENRE, COUNT(DISTINCT FILM) AS TOTAL_FILMS FROM HollywoodsMostProfitableStories$
GROUP BY GENRE
ORDER BY TOTAL_FILMS DESC

--3.
SELECT [LEAD STUDIO], COUNT(DISTINCT FILM) AS TOTAL_FILMS FROM HollywoodsMostProfitableStories$ WHERE [LEAD STUDIO] IS NOT NULL GROUP BY [LEAD STUDIO] ORDER BY TOTAL_FILMS DESC

--4.
SELECT YEAR, COUNT(DISTINCT FILM) AS TOTAL_FILMS FROM HollywoodsMostProfitableStories$ WHERE YEAR IS NOT NULL
GROUP BY YEAR
ORDER BY TOTAL_FILMS DESC

--5A
SELECT SUM([WORLDWIDE GROSS]) AS TOTAL_GROSS FROM HollywoodsMostProfitableStories$

--5B
SELECT AVG([WORLDWIDE GROSS]) AS AVERAGE_GROSS FROM HollywoodsMostProfitableStories$

--6
SELECT TOP 1 FILM, MAX([ROTTEN TOMATOES %]) AS TOP_1 FROM HollywoodsMostProfitableStories$
WHERE FILM IS NOT NULL
GROUP BY FILM
ORDER BY TOP_1 DESC

--7.
SELECT TOP 1 FILM, MAX([ROTTEN TOMATOES %]) AS SECOND_HIGHEST FROM HollywoodsMostProfitableStories$ WHERE [ROTTEN TOMATOES %] < (SELECT MAX([ROTTEN TOMATOES %]) FROM HollywoodsMostProfitableStories$)
GROUP BY FILM
ORDER BY SECOND_HIGHEST DESC

--8
SELECT TOP 5 FILM, MAX([ROTTEN TOMATOES %]) AS BOTTOM_5 FROM HollywoodsMostProfitableStories$ 
GROUP BY FILM
ORDER BY BOTTOM_5 ASC

--9
SELECT TOP 10 FILM, MAX([Audience  score %])  AS POPULAR FROM HollywoodsMostProfitableStories$
GROUP BY FILM
ORDER BY POPULAR DESC

SELECT * FROM HollywoodsMostProfitableStories$

--THANK YOU






