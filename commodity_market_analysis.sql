

SELECT column_name

FROM information_schema.columns
WHERE table_name='commodity_prices';

select * from commodity_prices;

SELECT * 
FROM commodity_prices
LIMIT 5;

select avg(coal_rb_4800_fob_london_close_usd) as avg_price_coal,
avg(Price_WTI),
avg(Price_Dubai_Brent_Oil),
avg(Price_ExxonMobil),
avg(Price_Natural_Gas),
avg(Price_Dutch_TTF),
avg(Price_All_Share),
avg(Price_Shenhua),
avg(Price_Mining)
from commodity_prices;



select 
percentile_cont(0.5) within group(order by coal_rb_4800_fob_london_close_usd) as coal_4800,
percentile_cont(0.5) within group(order by Price_WTI) as price_wti,
percentile_cont(0.5) within group(order by Price_Dubai_Brent_Oil) as dubai_brent_oil,
percentile_cont(0.5) within group(order by Price_ExxonMobil) as exxonmobil,
percentile_cont(0.5) within group(order by Price_Natural_Gas) as Natural_Gas,
percentile_cont(0.5) within group(order by Price_Dutch_TTF) as dutch_ttf,
percentile_cont(0.5) within group(order by Price_All_Share) as all_share,
percentile_cont(0.5) within group(order by Price_Shenhua) as shenhua,
percentile_cont(0.5) within group(order by Price_Mining) as mining
from commodity_prices;

select coal_rb_4800_fob_london_close_usd,count(*) as frequency_coal
from commodity_prices
where coal_rb_4800_fob_london_close_usd is not null
group by coal_rb_4800_fob_london_close_usd
order by frequency_coal desc
limit 1;

select Price_WTI,count(*) as frequency_wti
from commodity_prices
where Price_WTI is not null
group by Price_WTI
order by frequency_wti desc
limit 1;

select Price_Dubai_Brent_Oil,count(*) as freq_dubai_brent
from commodity_prices
where Price_Dubai_Brent_Oil is not null
group by Price_Dubai_Brent_Oil
order by freq_dubai_brent desc
limit 1;

select Price_ExxonMobil,count(*) as freq_Exxonmobil
from commodity_prices
where Price_ExxonMobil is 
group by Price_ExxonMobil
order by freq_Exxonmobil desc
limit 1;

select variance(coal_rb_4800_fob_london_close_usd) as var_coal,
variance(Price_WTI) as var_wti,
variance(Price_Dubai_Brent_Oil) as var_dubai_brent,
variance(Price_ExxonMobil) as var_exxon,
variance(Price_Natural_Gas) as var_natural_gas,
variance(Price_Dutch_TTF) as var_dutch_ttf,
variance(Price_All_Share) as var_share,
variance(Price_Shenhua) as var_shenhua,
variance(Price_Mining) as var_mining
from commodity_prices;

select stddev(coal_rb_4800_fob_london_close_usd) as sd_coal,
stddev(Price_WTI) as sd_wti,
stddev(Price_Dubai_Brent_Oil) as v_dubai_brent,
stddev(Price_ExxonMobil) as sd_exxon,
stddev(Price_Natural_Gas) as sd_natural_gas,
stddev(Price_Dutch_TTF) as sd_dutch_ttf,
stddev(Price_All_Share) as sd_share,
stddev(Price_Shenhua) as sd_shenhua,
stddev(Price_Mining) as sd_mining
from commodity_prices;


