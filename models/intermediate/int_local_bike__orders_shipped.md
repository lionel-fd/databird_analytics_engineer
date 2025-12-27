{% docs int_local_bike__orders_shipped %}

This model provides an aggregated view of orders, combining data with order items and add measures:

- **total_distinct_products**: sum of different products for each order
- **total_quantity_items**: sum of quantity of products for each order
- **brut_total_amount**: sum of all amounts before discount for each order
- **total_discount_amount**: sum of discount amounts 
- **total_net_amount**: sum of all amounts including discount

{% enddocs %}