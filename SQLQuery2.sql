SELECT
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS 'Customer',
    cus.city,
    cus.state,
    ord.order_date,
    SUM(ite.quantity) AS 'total_units',
    SUM(ite.list_price * ite.quantity) AS 'revenue',
    pro.product_name,
    cat.category_name,
    bra.brand_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'
FROM sales.customers cus
JOIN sales.orders ord ON cus.customer_id = ord.customer_id
JOIN sales.stores sto ON ord.store_id = sto.store_id
JOIN sales.order_items ite ON ord.order_id = ite.order_id
JOIN production.products pro ON ite.product_id = pro.product_id
JOIN production.categories cat ON pro.category_id = cat.category_id
JOIN production.brands bra ON pro.brand_id = bra.brand_id
JOIN sales.staffs sta ON ord.staff_id = sta.staff_id
GROUP BY
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city,
    cus.state,
    ord.order_date,
    pro.product_name,
    cat.category_name,
    bra.brand_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name);
