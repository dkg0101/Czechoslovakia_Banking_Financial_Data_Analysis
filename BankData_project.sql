create database bank_data;
use bank_data;
-- rename table account to accounts;
show columns from accounts;
select * from accounts;
select date from accounts;

update accounts
set frequency = case 
when frequency = 'POPLATEK MESICNE' then 'Monthly Issuance'
when frequency = 'POPLATEK TYDNE'	then 'Weekly Issuance'
when frequency = 'POPLATEK PO OBRATU' then 'Issuance After a Transaction'
else 'Not Defined'
end;

select frequency from accounts;


/*
Create a Custom Column Card_Assigned and assign below : 
Silver -> Monthly issuance
Diamond - weekly issuance
Gold - Issuance after a transaction
*/

alter table accounts
add column Card_Assigned varchar(30) after Account_type ;

update accounts
set Card_Assigned = case 
when frequency = 'Monthly Issuance' then 'Silver'
when frequency = 'Weekly Issuance' then 'Diamond'
when frequency = 'Issuance After a Transaction' then 'Gold'
end;


/* 
CARD Table
Replace type attribute value “junior” as Sliver, “Classic” as Gold,
And “Gold” as Diamond by using replace in Excel or by using update in SQL.
*/

UPDATE Card
SET type = CASE 
    WHEN type = 'junior' THEN 'Silver'
    WHEN type = 'Classic' THEN 'Gold'
    WHEN type = 'Gold' THEN 'Diamond'
END;

/*
Convert issued attribute into yyyy-mm-dd adding 23 in year.

*/
select * from card;

UPDATE card
SET issued = DATE_FORMAT(DATE_ADD(STR_TO_DATE(LEFT(issued, 6), '%y%m%d'), INTERVAL 24 YEAR), '%Y-%m-%d');

show columns from card;
alter table card
modify column issued date;

select issued from card;

/*
CLIENT Table ,
Convert bith_number attribute to yyyy-mm-dd format and also create another column named sex by applying in bith_number 0 for females and 1 for males.
(=if(mod(bith_number,2)=0, “Female”, “Male”) in excel or using case statement in SQL.
For Male its in YYMMDD format and for female it is YYMM+50DD for Women
*/
select  substring('0123456789',2,6) as ent;

-- Change all column names and delete the attributes a12 and a13

alter table district
RENAME COLUMN A1 to District_Code,
RENAME COLUMN A2 to District_Name,
RENAME COLUMN A3 to Region ,
RENAME COLUMN A4 to No_of_inhabitants , 
RENAME COLUMN A5 to No_of_municipalities_with_inhabitants_less_499, 
RENAME COLUMN A6 to No_of_municipalities_with_inhabitants_500_btw_1999 , 
RENAME COLUMN A7 to No_of_municipalities_with_inhabitants_2000_btw_9999 ,
RENAME COLUMN A8 to No_of_municipalities_with_inhabitants_less_10000, 
RENAME COLUMN A9 to No_of_cities, 
RENAME COLUMN A10 to Ratio_of_urban_inhabitants , 
RENAME COLUMN A11 to Average_salary, 
RENAME COLUMN A14 to No_of_entrepreneurs_per_1000_inhabitants, 
RENAME COLUMN A15 to No_committed_crime_2017, 
RENAME COLUMN A16 to No_committed_crime_2018;

alter table district
drop column A12,
drop column A13;

select * from district;

/*
LOAN Table
Convert the Date Attribute into yyyy-mm-dd format adding 23 in year.
*/

select * from loan;
update loan 
set date = str_to_date(date,'%Y%m%d');

-- Convert Status Attribute value “A” as Contract Finished, “B” as Loan Not Paid, “C” as Running Contract, and “D” Client in debt.
update loan 
set status = case
when status = 'A' then 'Contract Finished'
when status = 'B' then 'Loan Not Paid'
when status = 'C' then 'Running Contract'
when status = 'D' then 'Client in debt'
end;

alter table district
modify column District_Code Int primary key;

alter table client
add constraint fk_child_parent foreign key(district_id) references district(District_Code);

select * from client;
select * from district;



-- Disable foreign key checks (temporarily)
-- SET FOREIGN_KEY_CHECKS = 0;

-- Add the foreign key constraint
ALTER TABLE client
ADD CONSTRAINT fk_child_parent FOREIGN KEY (district_id) REFERENCES district(District_Code);

-- Re-enable foreign key checks
-- SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE ACCOUNTS ADD PRIMARY KEY(account_id);
ALTER TABLE CLIENT ADD PRIMARY KEY (client_id);
CREATE INDEX idx_disp_id
ON DISP(DISP_ID);

alter table TRANSACTIONS
add FOREIGN KEY (account_id) references ACCOUNTS(account_id);

select * FROM TRANSACTIONS;
 
ALTER TABLE DISP
ADD CONSTRAINT fk_DISP1
FOREIGN KEY (account_id) references ACCOUNTS(account_id),
ADD CONSTRAINT fk_DISP2
FOREIGN KEY (client_id) references `CLIENT`(client_id);

ALTER TABLE CARD ADD CONSTRAINT FK_CARD FOREIGN KEY (disp_id) references DISP(disp_id);
ALTER  TABLE LOAN ADD CONSTRAINT FK_LOAN FOREIGN KEY (account_id) references ACCOUNTS(account_id);
ALTER TABLE ACCOUNTS ADD CONSTRAINT fk_ACCOUNTS FOREIGN KEY (district_id) REFERENCES district(District_Code);
ALTER TABLE `ORDER` ADD CONSTRAINT fk_ORDER FOREIGN KEY (account_id) references ACCOUNTS(account_id);

-- select count(*) from transactions;

UPDATE transactions
SET date = STR_TO_DATE(date, '%d-%m-%Y')
WHERE STR_TO_DATE(date, '%d-%m-%Y') IS NOT NULL;

ALTER TABLE transactions
MODIFY COLUMN date text;

SELECT YEAR(DATE) AS TXN_YEAR, COUNT(*) AS TOT_TXNS
FROM TRANSACTIONS
GROUP BY TXN_YEAR
ORDER BY TOT_TXNS DESC;


/*
LOAD DATA INFILE 'D:/Downloads/bank_stud_data/tranx.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/

SELECT count(*) FROM transactions;


SELECT YEAR(DATE),count(*) FROM transactions group by year(DATE);

select * from client;
SELECT max(date) from client;

-- TRUNCATE TABLE TRANSACTIONS;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2021;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2020;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2019;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2018;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2017;

UPDATE TRANSACTIONS
SET `DATE` = DATE_ADD(`DATE`,INTERVAL 1 YEAR) WHERE YEAR(`DATE`) =2016;

SELECT YEAR(DATE),count(*) FROM transactions group by year(DATE);

-- select COUNT(*) from transactions WHERE BANK = '' AND YEAR(DATE) = 2020;
