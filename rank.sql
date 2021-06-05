



create table employee (
	id int not null,
	name text not null, 
	salary real not null,  
	primary key (id)
	)


drop table employee;

insert into employee(id,name,salary) values (10,'raja',24050.00),(11,'gopal',26000.00),(12,'jayaraj',44000.00)

select name,salary,
		row_number() over( partition by salary order by salary desc)row_number, 
		rank() over( partition by salary order by salary desc)rank, 
		dense_rank() over( partition by salary order by salary desc)dense_rank ,
		ntile(2) over( partition by salary order by salary desc)ntile  from employee;

		
>!-- Partition is meant by column tie value -->

select name,salary,rank() over( partition by salary order by name desc)rank from employee;   
select name,salary,dense_rank() over(partition by salary  order by name desc)rank from employee;
select name,salary,row_number() over( partition by salary order by salary desc)rank from employee;
select name,salary,ntile(3) over( order by salary desc)rank from employee;

-- Get without active supplier product 
with data as (select product_tmpl_id,string_agg(active_supplier::text,',') as asup from product_supplierinfo GROUP BY product_tmpl_id)
select * from data WHERE asup not LIKE '%true%'
