use Electronics_Retailer

--Overview table Exchange_Rates
select * from Exchange_Rates

--Create Date table for more analysis
create table [Date]
(	[Date] date Primary Key,
	[Year] int,
	[Month] smallint,
	[Month_Name] varchar(10),
	[Quarter] varchar(10))
--Insert Date column in Date table we extract from Exchange_Rates table
insert into [Date]([Date]) 
select distinct([Date]) from Exchange_Rates
order by [Date] asc
--modify other columns in Date table by Built-in function 
UPDATE [Date]
SET [Year] = YEAR([Date]);
UPDATE [Date]
SET [Month] = month([Date]);
UPDATE [Date]
SET [Month_Name] = format([Date], 'MMM');
UPDATE [Date]
SET [Quarter] = 'Q-' + cast(DATEPART(QUARTER, [Date]) as varchar(10))

--Overview table Date
select * from [Date]