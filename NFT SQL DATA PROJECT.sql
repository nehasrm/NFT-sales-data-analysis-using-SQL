select count(*) as total_sale
from pricedata
where event_date between 'january 1st, 2018' and 'december 31st, 2021';


select name, eth_price, usd_price, event_date
from pricedata
order by usd_price desc
limit 5;


select
event_date,
usd_price,
avg(usd_price) over (order by event_date rows between 49 preceding and current row) as moving_avg
from pricedata;



select
name,
avg(usd_price) as "average price"
from
pricedata
group by
name
order by
"average price" desc;


select
dayname(event_date) as day_of_week,
count(*) as transaction_count,
avg(eth_price) as average_price_in_eth
from
pricedata
group by
day_of_week
order by
transaction_count asc;



select
concat(
name,
'was sold for $',
round(usd_price, 3),
'to',
seller_address,
'from',
buyer_address,
'on',
date_format(event_date, '%y-%m-%d')
) as summary
from
pricedata;




create view purchases_view as 
select * from pricedata
where buyer_address = 'Ox1919db36ca2fa2e15f9000fd9cdc2edcf863e685';




select
concat(floor(eth_price/100)*100, '_', floor(eth_price/100)*100 + 99) as price_range,
count(*) as count
from
pricedata
group by
floor(eth_price/100)
order by
floor(eth_price/100);



select
name,
max(usd_price) as price,
'highest' as status
from
pricedata
group by
name

union all

select
name,
min(usd_price) as price,
'lowest' as ststus
from 
pricedata
group by
name
order by
name asc,
status asc;



select
year(event_date) as year,
month(event_date) as month,
name,
max(usd_price) as max_price_in_usd
from
pricedata
group by
year,month,name
order by
year asc, month asc;



select
date_format(event_date, '%y-%m') as month_year,
round(sum(usd_price), 2) as total_volume
from
pricedata
group by
date_format(event_date, '%y-%m')
order by
month_year asc;



select
count(*) as transaction_coount
from
pricedata
where
seller_address= 'Ox1919db36ca2fa2e15f9000fd9cdc2edcf863e685'
or buyer_address= 'Ox1919db36ca2fa2e15f9000fd9cdc2edcf863e685';



select
event_date,
avg(usd_price) as estimated_average_value
from
pricedata
where
usd_price >= 0.1
group by
event_date;
