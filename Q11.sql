-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    round(SUM(orders_details.quantity * pizzas.price) / (SELECT 
            ROUND(SUM(orders_details.quantity * pizzas.price),
                        2) AS total_sales
        FROM
            orders_details
                JOIN
            pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100,2) AS revenue_percentage
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC
LIMIT 3;