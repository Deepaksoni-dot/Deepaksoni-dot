/*Dataset: Jomato
About the dataset:
You work for a data analytics company, and your client is a food delivery platform similar to
Jomato. They have provided you with a dataset containing information about various
restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable
insights and generate reports for your client.*/

--first i replaced column having , with - in ms excel as , is delimiter  
--then in input wizard while impoting data source in advaced section i clicked suggest datatypes for columns to have correct datatypes
select * from Jomato
order by OrderId

--Tasks to be performed:
--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
--solution1
   create function stuffing(@param varchar(20))
   returns table 
   as 
   return(
   select RestaurantType,stuff(RestaurantType,6,1,@param) as stuffed_RestaurantType
   from Jomato
   where RestaurantType='Quick Bites');
   select * from stuffing(' Chicken ');

--2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
--solution2
   create function maximum_rate(@param real)
   returns table
   as 
   return(
   select RestaurantName,CuisinesType,Rating from Jomato 
   where Rating=@param
   );
   
   select * from maximum_rate(4.9);

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating,
--‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating 
--solution3
      select *,
	  case
	  when Rating>=4 then 'Excellent'
	  when Rating>=3.5 then 'Good'
	  when Rating>=3 then 'Averae'
	  else 'Bad'
	  end as Rating_status
	  from Jomato

--4. Find the Ceil, floor and absolute values of the rating column and display the current
--date and separately display the year, month_name and day.
--solution4
     select Rating,CEILING(Rating) as ceiling_fun,floor(Rating) as floor_fun,abs(Rating) as abs_rating from Jomato;
	 select GETDATE(), DATENAME(yy,GETDATE()),DATENAME(mm,GETDATE()),DATENAME(w,GETDATE());
	
--5. Display the restaurant type and total average cost using rollup.
--solution5
     select RestaurantType,sum(AverageCost) as total_averagecost from Jomato
	 group by rollup(RestaurantType);