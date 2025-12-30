{% docs int_local_bike__orders %}

This model provides a sales base view, combining data with order items and add measures:

- **delivery_delay_days**: days number between required_date_at and shipped_date_at
- **delivery_status**: <0 "ahead", =0 "on_time" >0 "late"
- **discount_amount**: brut_total_amount * pourcentage_discount
- **net_amount**: brut_total_amount - discount_amount

{% enddocs %}