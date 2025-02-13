select customer_id,round(order_delivered_customer_date-order_purchase_timestamp,1) as "delivery time" from orders
where (order_delivered_customer_date-order_purchase_timestamp>=7)
order by customer_id;

--defined the customers whose delivery time is more or equal 7