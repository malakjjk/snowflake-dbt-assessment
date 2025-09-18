with orders as (
    select * from {{ source('tpch', 'orders') }}
),
customers as (
    select * from {{ source('tpch', 'customer') }}
)

select
    o.o_orderkey,
    o.o_custkey,
    c.c_name as customer_name,
    o.o_orderstatus,
    o.o_totalprice,
    o.o_orderdate,
    extract(year from o.o_orderdate) as order_year
from orders o
join customers c on o.o_custkey = c.c_custkey