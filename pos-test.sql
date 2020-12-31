select * from products;
select * from transaction_products;
select * from transactions;

select
tp.product_id
,p.name
,p.price
,tp.product_qty
,p.stock as current_inventory
,t.event_time
,p.price * tp.product_qty as sales_total

from products p
left join transaction_products tp
on tp.product_id = p.id
left join transactions t
on t.customer_transaction_id = tp.transaction_id
