-- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name,
sum(orders_details.quantity * pizzas.price) AS revenue
FROM pizza_types JOIN pizzas
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY revenue DESC LIMIT 3;