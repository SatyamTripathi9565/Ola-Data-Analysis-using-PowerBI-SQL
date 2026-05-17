create database Ola;

use Ola;
select count(*) from bookings

# 1.Retrieve all successful bookings:
Create View Successful_Bookings as
Select * from bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;

# 2.Find the average ride distance for each vehicle type:
Create View average_ride_distance_for_each_vehicle_type as
Select Vehicle_Type , AVG(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from average_ride_distance_for_each_vehicle_type;

# 3.Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customers as
Select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers; 

# 4.List the top 5 customers who booked the highest number of rides:
Create View top5_customers as
select Customer_ID , count(Booking_ID) as total_rides
from bookings
where Customer_ID is not null and Customer_ID <> ''
group by Customer_ID
Order By total_rides Desc limit 5;

select * from top5_customers;

# 5.Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancel_By_Drivers_P_C_Issue as
Select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Rides_cancel_By_Drivers_P_C_Issue ;

# 6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_and_Min_driver_rating_for_PS as
Select max(Driver_Ratings) as max_ratings, 
min(Driver_ratings) as min_ratings from bookings
where Vehicle_Type = 'Prime Sedan';

select * from Max_and_Min_driver_rating_for_PS;

# 7.Retrieve all rides where payment was made using UPI:
Create View UPI_Payment as
select * from bookings
where Payment_Method = 'UPI'

select * from UPI_Payment ;

# 8.Find the average customer rating per vehicle type:
create view avg_cust_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_cust_rating
from bookings
group by Vehicle_type;

select * from avg_cust_rating;

# 9.Calculate the total booking value of rides completed successfully:
Create View Total_Earing_By_Successful_Rides as
select sum(Booking_Value) as Total_Booking_Value
from bookings
where Booking_Status = 'success'

Select * from Total_Earing_By_Successful_Rides;

# 10.List all incomplete rides along with the reason:
Create View Incomple_ride_and_reason as
Select Booking_ID, Incomplete_Rides_Reason
from bookings
Where Incomplete_Rides = 'Yes';

select * from Incomple_ride_and_reason;