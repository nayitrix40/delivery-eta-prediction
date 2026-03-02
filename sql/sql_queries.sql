/*
Before creating the queries, We need to create:

- The Database
- The tables with their constraints
*/

Create database Food_Delivery_Platform;

--Then, We position in the Database that was created, in order to create the tables in there.

--IMPORTANT: Create it in the same order below, to avoid conflicts of constraints.

Create table delivery_persons (

delivery_person_id INT Primary Key,
name VARCHAR,
region VARCHAR,
hired_date DATE,
is_active BIT                 -- 1 for True and 0 for False

);

Create table restaurants (

restaurant_id VARCHAR Primary Key,
area VARCHAR,
name VARCHAR,
cuisine_type VARCHAR,
avg_preparation_time_min FLOAT

);

Create table deliveries (

delivery_id VARCHAR,
Constraint pk_deliveryID Primary Key (delivery_id),

delivery_person_id INT,
Constraint fk_delivery_personID Foreign Key (delivery_person_id)
REFERENCES delivery_persons (delivery_person_id),

restaurant_area VARCHAR,
customer_area VARCHAR,
delivery_distance_km FLOAT,
delivery_time_min INT,
order_placed_at TIMESTAMP,
weather_condition VARCHAR,
traffic_condition VARCHAR,
delivery_rating FLOAT

);

Create table orders (

order_id INT Primary Key,
delivery_id VARCHAR,
Constraint fk_delivery_ID Foreign Key (delivery_id)
REFERENCES deliveries (delivery_id),

restaurant_id VARCHAR,
Constraint fk_restaurantID Foreign Key (restaurant_id)
REFERENCES restaurants (restaurant_id),

customer_id VARCHAR,
order_value FLOAT,
items_count INT

);

/*

SQL Server Management-style solution

1. Top 5 customer areas with highest average delivery time in the last 30 days.
2. Average delivery time per traffic condition, by restaurant area and cuisine type.
3. Top 10 delivery people with the fastest average delivery time, considering only those with at least 50 deliveries
and who are still active.
4. The most profitable restaurant area in the last 3 months, defined as the area with the highest total order value.
5. Identify whether any delivery people show an increasing trend in average delivery time.

*/

--Query 1:

Select top 5 customer_area as 'Customer Area',
             AVG(delivery_time_min) as 'Average Delivery Time'
From deliveries
Where order_placed_at >= DATEADD(day, -30, GETDATE())
Group by customer_area
Order by AVG(delivery_time_min) DESC;

--Query 2:

Select r.area as 'Area',
       r.cuisine_type as 'Cuisine Type',
	   d.traffic_condition as 'Traffic Condition',
	   AVG(d.delivery_time_min) as 'Average Delivery Time'
From restaurants as r
INNER JOIN orders as o
    ON r.restaurant_id = o.restaurant_id
INNER JOIN deliveries as d
    ON o.delivery_id = d.delivery_id
Where d.traffic_condition IN ('Low', 'Medium', 'High')
Group by r.area,
         r.cuisine_type,
		 d.traffic_condition
Order by r.area,
         r.cuisine_type,
		 d.traffic_condition;

--Query 3:

Select top 10 dp.name as 'Name',
              AVG(d.delivery_time_min) as 'Average Delivery Time'
From delivery_persons as dp
INNER JOIN deliveries  as d
    ON dp.delivery_person_id = d.delivery_person_id
Where dp.is_active = 1
Group by dp.delivery_person_id,
         dp.name
Having COUNT(*) >= 50
Order by AVG(d.delivery_time_min) ASC;

--Query 4:

Select top 1 r.area as 'Restaurant Area',
             SUM(o.order_value) as 'Total Orders Value'
From orders as o
INNER JOIN restaurants as r
    ON o.restaurant_id = r.restaurant_id
INNER JOIN deliveries as d
    ON o.delivery_id = d.delivery_id
Where d.order_placed_at >= DATEADD(Month, -1, GETDATE())
Group by r.area
Order by [Total Orders Value] DESC;

--Query 5:

-- Assumption: An increasing trend is defined as a higher average delivery time
-- in the most recent month compared to the earliest available month

With monthly_avg as (
   Select dp.delivery_person_id,
          dp.name,
		  DATEFROMPARTS(Year(d.order_placed_at), Month(d.order_placed_at), 1) as 'delivery_month',
          AVG(d.delivery_time_min) as 'avg_delivery_time'
   From delivery_persons as dp
   INNER JOIN deliveries as d
       ON dp.delivery_person_id = d.delivery_person_id

   Group by dp.delivery_person_id,
            dp.name,
			DATEFROMPARTS(Year(d.order_placed_at), Month(d.order_placed_at), 1)
),
ranked_months as (
   Select delivery_person_id,
          name,
		  delivery_month,
		  avg_delivery_time,
		  ROW_NUMBER() OVER (PARTITION BY delivery_person_id Order by [delivery_month] ASC) as first_month_rank,
		  ROW_NUMBER() OVER (PARTITION BY delivery_person_id Order by [delivery_month] DESC) as last_month_rank
   From monthly_avg
)
Select name as 'Name',
       MAX(CASE WHEN first_month_rank = 1 THEN avg_delivery_time END) as 'First Month Average',
	   MAX(CASE WHEN last_month_rank = 1 THEN avg_delivery_time END) as 'Last Month Average'
From ranked_months
Group by delivery_person_id,
         name
Having MAX(CASE WHEN last_month_rank = 1 THEN avg_delivery_time END) >
       MAX(CASE WHEN first_month_rank = 1 THEN avg_delivery_time END);

/*

This took more steps, as I first calculated the monthly average per delivery person,
then compared their first month with the last available month to see if there was an increase in the average time.


*/
