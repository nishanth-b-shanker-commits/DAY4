SELECT COUNT(*) AS total_records FROM car_prices;

SELECT * FROM car_prices WHERE ROWNUM <= 10;


SELECT 
    COUNT(*) - COUNT(year) AS missing_year,
    COUNT(*) - COUNT(make) AS missing_make,
    COUNT(*) - COUNT(sellingprice) AS missing_price,
    COUNT(*) - COUNT(mmr) AS missing_mmr
FROM car_prices;


SELECT 
    year,
    COUNT(*) AS total_sales,
    ROUND(AVG(sellingprice), 2) AS avg_price
FROM car_prices
GROUP BY year
ORDER BY year DESC;




SELECT 
    make,
    COUNT(*) AS count,
    ROUND(MIN(sellingprice), 2) AS min_price,
    ROUND(MAX(sellingprice), 2) AS max_price,
    ROUND(AVG(sellingprice), 2) AS avg_price,
    ROUND(MEDIAN(sellingprice), 2) AS median_price,
    ROUND(STDDEV(sellingprice), 2) AS price_std_dev
FROM car_prices
GROUP BY make
HAVING COUNT(*) > 10
ORDER BY avg_price DESC;



SELECT 
    condition,
    COUNT(*) AS count,
    ROUND(AVG(sellingprice), 2) AS avg_price,
    ROUND(AVG(odometer), 2) AS avg_odometer
FROM car_prices
GROUP BY condition
ORDER BY condition;



WITH body_categories AS (
    SELECT 'SEDAN' AS body_type FROM DUAL
    UNION ALL SELECT 'SUV' FROM DUAL
    UNION ALL SELECT 'COUPE' FROM DUAL
    UNION ALL SELECT 'CONVERTIBLE' FROM DUAL
    UNION ALL SELECT 'WAGON' FROM DUAL
    UNION ALL SELECT 'HATCHBACK' FROM DUAL
)
SELECT 
    bc.body_type,
    COUNT(cp.vin) AS vehicle_count,
    ROUND(AVG(cp.sellingprice), 2) AS avg_price,
    ROUND(AVG(cp.odometer), 2) AS avg_mileage
FROM body_categories bc
LEFT JOIN car_prices cp ON UPPER(cp.body) = bc.body_type
GROUP BY bc.body_type
ORDER BY vehicle_count DESC;




