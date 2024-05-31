--1.What is the total number of reservations in the dataset?
SELECT COUNT(*) AS 'Number_of_Rerservations' 
FROM reservation_t

--2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS occurance 
FROM reservation_t 
GROUP BY type_of_meal_plan
ORDER BY occurance DESC

--3.What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS 'AvgPricePerRoom' 
from reservation_t 
WHERE no_of_children > 0

--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
For 2012.
SELECT COUNT(*) AS 'NumberOfReservations' 
from reservation_t 
WHERE arrival_year = 2018

--5. What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(room_type_reserved) AS 'NumberOfReservations'
from reservation_t 
GROUP BY room_type_reserved
ORDER BY NumberOfReservations DESC

--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS NumberOfReservations
FROM reservation_t         
WHERE no_of_weekend_nights > 0

--7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time), MIN(lead_time)
FROM reservation_t

--8. What is the most common market segment type for reservations?
SELECT market_segment_type, 
COUNT(market_segment_type) AS ‘NumberOfReservations’
FROM reservation_t
GROUP BY market_segment_type
ORDER BY NumberOfReservations DESC

--9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS NumberOfReservations
FROM reservation_t         
WHERE booking_status = "not_canceled"

--10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_children) AS 'NumberOfChildren',
SUM(no_of_adults) AS 'NumberOfAdults'
FROM reservation_t

--11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights)
FROM reservation_t      
WHERE no_of_children > 0

--12. How many reservations were made in each month of the year?
SELECT arrival_month,
COUNT(*) AS 'NumberOfReservations'
FROM reservation_t
GROUP BY arrival_month

--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved,
AVG(no_of_week_nights + no_of_weekend_nights) AS 'AVGofNights'
FROM reservation_t
WHERE room_type_reserved IS NOT NULL
GROUP BY room_type_reserved

--14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved,
AVG(avg_price_per_room) AS 'avg_price'
FROM reservation_t
WHERE no_of_children > 0
GROUP BY room_type_reserved

--15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type,
AVG(avg_price_per_room) AS 'AVG_PRICE'
FROM reservation_t
GROUP BY market_segment_type
ORDER BY AVG_PRICE DESC


 
