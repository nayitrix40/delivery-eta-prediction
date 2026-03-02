## Additional business question

The following question I think that could be important:

6. Which customer areas are most impacted by high traffic compared to low traffic, based on average delivery time?

## Why this matters?

This analysis helps identify customer areas where traffic has the greatest effect on delivery performance.
The business can use this insight to adjust estimated delivery times, improve courier allocations,
and communicate delays more accurately to customers in the most affected areas

## Query:

```sql
Select customer_area as 'Customer Area',
       AVG(CASE WHEN traffic_condition = 'Low' THEN delivery_time_min END) as 'AVG Low Traffic Time',
       AVG(CASE WHEN traffic_condition = 'High' THEN delivery_time_min END) as 'AVG High Traffic Time',
       AVG(CASE WHEN traffic_condition = 'High' THEN delivery_time_min END) -
       AVG(CASE WHEN traffic_condition = 'Low' THEN delivery_time_min END) as 'Traffic Impact Gap'
From deliveries
Group by customer_area
Having AVG(CASE WHEN traffic_condition = 'Low' THEN delivery_time_min END) IS NOT NULL
AND AVG(CASE WHEN traffic_condition = 'High' THEN delivery_time_min END) IS NOT NULL
Order by [Traffic Impact Gap] DESC;
