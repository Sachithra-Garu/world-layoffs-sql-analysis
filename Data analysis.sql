select *
from layoff_staging2;

Select max(total_laid_off),min(total_laid_off),max(percentage_laid_off)
from layoff_staging2;

select *
from layoff_staging2
where percentage_laid_off= 1
order by funds_raised_millions desc;

select company,SUM(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;

select max(date),min(date)
from layoff_staging2;

select industry,SUM(total_laid_off)
from layoff_staging2
group by industry
order by 2 desc;

select country,SUM(total_laid_off)
from layoff_staging2
group by country
order by 2 desc;

select date,SUM(total_laid_off)
from layoff_staging2
group by date
order by 1 desc;

select year(date),SUM(total_laid_off)
from layoff_staging2
where date is not null
group by year(date)
order by 1 desc;

select stage,SUM(total_laid_off)
from layoff_staging2
group by stage
order by 2 desc;

select substring(date,1,7) as `Month`,SUM(total_laid_off) as Total_laid_off
from layoff_staging2
where substring(date,1,7) is not null
group by `Month`
Order by 1;

with Rolling_Total as
(
select substring(date,1,7) as `Month`,SUM(total_laid_off) as Total_laid_off
from layoff_staging2
where substring(date,1,7) is not null
group by `Month`
Order by 1
)
select `Month`,Total_laid_off
,sum(Total_laid_off) Over(order by `Month`) as rolling_total
from Rolling_Total;

select company,SUM(total_laid_off)
from layoff_staging2
group by company
order by 2 desc;

select company,year(`date`),sum(total_laid_off)
from layoff_staging2
group by company,year(`date`)
order by 3 desc;

With Company_year(company, years, total_laid_off) as
(
select company,year(`date`),sum(total_laid_off)
from layoff_staging2
group by company,year(`date`)
),Company_Year_Rank as
(select * , dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
Where years is not null
)
select *
from Company_Year_Rank
Where ranking <= 5