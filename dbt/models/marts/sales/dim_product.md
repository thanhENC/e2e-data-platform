{% docs product_color_category %}

This is the `product_color_category` column in the `dim_product` table. It is the color category of the product and is higher level than the `color` column.

The valid product color categories are:
- `dark`: grey, black
- `light`: yellow, white, silver
- `medium`: red, green, blue, multi, silver/black
- `unknown`: for products with no color defined in `color` column & products with color not in the above list.

{% enddocs %}
