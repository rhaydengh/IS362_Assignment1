SELECT 'planes', COUNT(*) FROM planes  
  WHERE speed IS NOT null
UNION
SELECT 'Minimum Speed', MIN(speed) FROM planes
UNION
SELECT 'Maximum Speed', MAX(speed) FROM planes
UNION
SELECT 'JAN_2013 Distance', SUM(distance) FROM flights  
  WHERE year = 2013 AND month = 1
UNION
SELECT 'JAN_2013 NoTailNum Distance', SUM(distance) FROM flights  
WHERE year = 2013 AND month = 1 AND tailnum IS null;  

SELECT SUM(flights.distance), planes.manufacturer FROM flights  
  INNER JOIN planes ON planes.tailnum=flights.tailnum  
  WHERE flights.year = 2013 AND flights.month = 7 AND flights.day = 5  
  GROUP BY planes.manufacturer;  

SELECT SUM(flights.distance), planes.manufacturer FROM flights  
  LEFT JOIN planes ON planes.tailnum=flights.tailnum  
  WHERE flights.year = 2013 AND flights.month = 7 AND flights.day = 5  
  GROUP BY planes.manufacturer;  

#what was the total flight distance when windspeed was greater than 20mph, sorted by manufacturer

SELECT SUM(flights.distance), planes.manufacturer, weather.windspeed FROM flights  
  LEFT JOIN planes ON planes.tailnum=flights.tailnum  
  WHERE flights.arr_delay >= 10 AND weather.windspeed >= 20  
  GROUP BY planes.manufacturer;
