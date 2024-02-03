select c.*,
       o.*,
       p.*,
(o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE) as Orderprofit
from {{ ref('RAW_Customers') }} as c 
left join 
{{ ref('RAW_Orders') }} as o
ON c.customerid = o.customer_id
left join 
{{ ref('Raw_Product') }} as p
ON o.productid = p.product_id
order by Orderprofit desc
