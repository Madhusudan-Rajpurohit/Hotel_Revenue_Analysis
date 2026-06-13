CREATE DATABASE hotel_bookings;

USE hotel_bookings;

-- Category 1: Revenue Management Analysis

-- 1. What is our Average Daily Rate (ADR) and total revenue across different room types?

SELECT reserved_room_type AS room_type, 
       ROUND(COUNT(*), 2) AS total_bookings, 
       ROUND(SUM(revenue), 2) AS total_revenue_eur,
	   AVG(adr) AS average_daily_rate
FROM bookings
WHERE is_canceled = 0 # Used 0 for only confired booking 
GROUP BY reserved_room_type
ORDER BY total_revenue_eur DESC;

-- 2. What is our monthly revenue trend year-over-year?

SELECT 
    arrival_date_year AS checkin_year,
    arrival_date_month AS checkin_month,
    COUNT(*) AS total_completed_stays,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM bookings
WHERE is_canceled = 0
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year ASC, 
FIELD(arrival_date_month, 'January','February','March','April','May','June','July','August','September','October','November','December');
  

-- Category 2: Operational Efficiency & Logistics

-- 3. What is the average length of stay (Weekend vs. Weekday) across our different hotel types?

SELECT 
    hotel,
    ROUND(AVG(stays_in_weekend_nights), 2) AS avg_weekend_nights,
    ROUND(AVG(stays_in_week_nights), 2) AS avg_weekday_nights,
    ROUND(AVG(total_nights), 2) AS avg_total_stay_duration,
    COUNT(*) AS total_bookings_handled
FROM bookings
WHERE is_canceled = 0
GROUP BY hotel;
  
-- 4. How often are rooms upgraded or changed upon guest arrival?

SELECT 
    room_changed,
    COUNT(*) AS total_bookings,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM bookings) * 100 ), 2) AS percentage_of_total
FROM bookings
GROUP BY room_changed;
  

-- Category 3: Guest Risk & Booking Behavior
-- 5. What are the cancellation rates across our different distribution channels? 

SELECT 
    distribution_channel,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_canceled_bookings,
    ROUND((SUM(is_canceled) / COUNT(*) * 100 ), 2) AS cancellation_rate_percentage
FROM bookings
GROUP BY distribution_channel
ORDER BY cancellation_rate_percentage DESC;  
  
-- 6. Does asking for car parking spaces affect a guest's likelihood of canceling?

SELECT 
    CASE 
        WHEN required_car_parking_spaces > 0 THEN 'Requested Parking'
        ELSE 'No Parking Requested'
    END AS parking_preference,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND((SUM(is_canceled) / COUNT(*) * 100 ), 2) AS cancellation_rate_percentage
FROM bookings
GROUP BY parking_preference;
  
-- 7. Who are our Top 10 guest countries based on generated revenue?

SELECT 
    country,
    COUNT(*) AS total_successful_bookings,
    ROUND(SUM(revenue), 2) AS total_revenue_yield_eur,
    ROUND(AVG(adr), 2) AS average_daily_rate
FROM bookings
WHERE is_canceled = 0
GROUP BY country
ORDER BY total_revenue_yield_eur DESC
LIMIT 10;
  
-- 8. The Customer Loyalty Impact (Repeat Guests vs. Casual Churn)

SELECT 
    CASE WHEN is_repeated_guest = 1 THEN 'Repeat Guest' ELSE 'First-Time Guest' END AS loyalty_tier,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND((SUM(is_canceled) * 100.0 / COUNT(*)), 2) AS cancellation_rate_percentage
FROM bookings
GROUP BY is_repeated_guest;

-- 9. Revenue Loss Analysis (Quantifying Lost Opportunity)

SELECT 
    hotel,
    COUNT(*) AS total_canceled_bookings,
    ROUND(SUM(adr * total_nights), 2) AS potential_lost_revenue_eur
FROM bookings
WHERE is_canceled = 1
GROUP BY hotel;  
  
-- 10. The Deposit Type Trap

SELECT 
    deposit_type,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND((SUM(is_canceled) * 100.0 / COUNT(*)), 2) AS cancellation_rate_percentage
FROM bookings
GROUP BY deposit_type
ORDER BY cancellation_rate_percentage DESC;
  
  
  
  
  
  
  
  
  
  

  
  
  