-- Calculate the total revenue generated from pizza sales.

SELECT
round(sum(orders_details.quantity * pizzas.price),2) AS total_sales
FROM orders_details JOIN pizzas
ON pizzas.pizza_id = orders_details.pizza_id