 select
 p.name
 ,p.price as price
 ,tp.product_qty as qty_sold
 ,p.stock as qty_onhand
 ,(p.price * tp.product_qty) as total_sales


 from
 products p
 left join transaction_products tp
 on tp.id = p.id