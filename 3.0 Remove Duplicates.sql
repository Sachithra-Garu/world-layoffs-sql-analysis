Select *
from world_layoff.layoffs;

Create table World_layoff.layoff_staging
Like world_layoff.layoffs;

Select *
from world_layoff.layoff_staging;

insert world_layoff.layoff_staging
select *
from world_layoff.layoffs;

select *,
Row_Number() over (partition by company,industry,location,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from world_layoff.layoff_staging;

with duplicate_cte as
(select *,
Row_Number() over (partition by company,industry,location,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from world_layoff.layoff_staging
)
delete
from duplicate_cte
where row_num > 1;


CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
from layoff_staging2;

Insert into layoff_staging2
select *,
Row_Number() over (partition by company,industry,location,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoff_staging;

Select *
from layoff_staging2
;

Delete
from layoff_staging2
Where row_num > 1







