with orders as (
    select * from {{ source('tpch', 'orders') }}
),
customers as (
    select * from {{ source('tpch', 'customer') }}
),
lineitems as (
    select * from {{ source('tpch', 'lineitem') }}
)
select 
    c.c_custkey,
    c.c_name,
    sum(l.l_extendedprice * (1 - l.l_discount)) as total_revenue
from orders o
join customers c on o.o_custkey = c.c_custkey
join lineitems l on o.o_orderkey = l.l_orderkey
group by c.c_custkey, c.c_name