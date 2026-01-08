use world;
## Question 1 : Count how many cities are there in each country?

select country_Name as country, count(city_ID) as 
total_cities
from country
join city on country_code = city.CountryCode
group by country_Name;

## Question 2 : Display all continents having more than 30 countries.

select continent, count(*) as
total_countries
from country
group by Continent
having count(*) > 30;

## Question 3 : List regions whose total population exceeds 200 million.
select * from country;
select Region, sum(Country_Pop) as
total_pop
from country
group by Region
having sum(Country_Pop) >200000000;

## Question 4 : Find the top 5 continents by average GNP per country.

select continent, avg(gnp) as avg_gnp
from country
group by Continent
order by avg_gnp desc
limit 5;

## Question 5 : Find the total number of official languages spoken in each continent.

select country.Continent, count(countrylanguage) as
official_languages
from country
join countrylanguage on country_code = countrylanguage.country_code
where countrylanguage.isofficial = 'T'
group by country.continent;

## Question 6 : Find the maximum and minimum GNP for each continent.
 select continent,
 max(gnp) as max_gnp,
 min(gnp) as min_gnp
 from country
 group by Continent;
 
## Question 7 : Find the country with the highest average city population.

SELECT c.Name AS Country, AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY Avg_City_Population DESC
LIMIT 1;

## Question 8 : List continents where the average city population is greater than 200,000

SELECT c.Continent, AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

## Question 9 : Find the total population and average life expectancy for each continent, ordered by average lifeexpectancy descending.

SELECT Continent,
       SUM(Population) AS Total_Population,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;

## Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those wherethe total population is over 200 million.

SELECT Continent,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy,
       SUM(Population) AS Total_Population
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Avg_Life_Expectancy DESC
LIMIT 3;


 
 


