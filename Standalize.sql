Select *
from layoff_staging2;

Select company,trim(company)
from layoff_staging2;

update layoff_staging2
set company = Trim(company);

Select distinct industry
from layoff_staging2
Order by 1;

update layoff_staging2
Set industry = 'Crypto'
where industry like 'crypto%';

select distinct country
from layoff_staging2
order by 1;

select distinct country,trim(trailing '.' from country)
from layoff_staging2
order by 1;

update layoff_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select date,
str_to_date(date, '%m/%d/%Y')
from layoff_staging2;

update layoff_staging2
set date = str_to_date(date, '%m/%d/%Y');

select *
from layoff_staging2;

alter table layoff_staging2
modify column date date;	

select *
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

Select *
from layoff_staging2
where industry is null
or industry = '';

update layoff_staging2
set industry = null
where industry = '';

select *
from layoff_staging2 t1
join layoff_staging2 t2
	on t1.company = t2.company
where t1.industry is null
and t2.industry is not null;

update layoff_staging2 t1
join layoff_staging2 t2
	on t1.company =t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoff_staging2
where industry is null or industry = '';

select *
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoff_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoff_staging2;

delete
from layoff_staging2
where company like 'bally%';

alter table layoff_staging2
drop column row_num;