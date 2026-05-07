SELECT product_id , new_price AS price 
FROM Products
WHERE (product_id , change_date) IN