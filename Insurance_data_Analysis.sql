SELECT *
FROM product_based_company.insurance_data;

select region,avg(claim) as avg_claim
from product_based_company.insurance_data
group by region;

select min(bmi) as min_bmi,max(bmi)as max_bmi
from product_based_company.insurance_data;

select PatientID,age,bmi
from product_based_company.insurance_data
where bmi between 40 and 50;

select region,count(smoker='Yes') as 'Number of Smokers'
from product_based_company.insurance_data
where smoker ='Yes'
group by region;

select count(PatientID),avg(claim) as avg_claim
from product_based_company.insurance_data
where diabetic='Yes' and smoker='Yes';

select avg(bmi)
from product_based_company.insurance_data
where smoker='Yes';

select *
from product_based_company.insurance_data
where smoker='Yes' and bmi>(select avg(bmi)
from product_based_company.insurance_data
where smoker='Yes');

select
 case when age < 18 then 'Under 18'
 when age between 18 and 30 then '18-30'
 when age between 31 and 50 then '31-50'
 else 'Over 50'
 end as age_group,round(avg(claim),2) as avg_claim
from product_based_company.insurance_data
group by age_group;

select PatientID,sum(claim) as total_claim, avg(claim) over() as avg_claim
from product_based_company.insurance_data
group by PatientID;

select PatientID,sum(claim) as claim,sum(claim) over () as total_claim
from product_based_company.insurance_data
group by PatientID
order by sum(claim)desc limit 3;

select *
from product_based_company.insurance_data t1
where claim >(select avg(claim) from product_based_company.insurance_data t2
where t2.region=t1.region);

select *,rank() over (order by claim desc)
from product_based_company.insurance_data;

select *,rank() over (order by claim desc)
from product_based_company.insurance_data;

select *, rank() over(partition by region order by claim desc)
from product_based_company.insurance_data;
	









