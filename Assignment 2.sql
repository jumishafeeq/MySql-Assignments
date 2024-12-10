create database Sales;

use Sales;

create table Orders(
Order_Id int primary key,
Customer_Name varchar(30) not null,
Product_Category varchar(30),
Ordered_Item varchar(30) not null,
Contact_No varchar(15) unique
);

desc Orders;

alter table Orders add column Order_Quantity int not null;

rename table Orders to Sales_Orders;

desc Sales_Orders;

insert into Sales_Orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, Order_Quantity)
values
(1, 'Alice', 'Electronics', 'Smartphone', '8624503157',15),
(2, 'Rose', 'Electronics', 'Laptop', '9631007891',10),
(3, 'Charlie', 'Furniture', 'Dining Table', '8634567892',5),
(4, 'Diana', 'Furniture', 'Sofa Set', '9300567893',3),
(5, 'Boby', 'Accessories', 'Watch', '8294567894',10),
(6, 'Roma', 'Accessories', 'Handbag', '8964567895',15),
(7, 'George', 'Electronics', 'Headphones', '8884567896',30),
(8, 'Hannah', 'Furniture', 'Office Desk', '9884057897',5),
(9, 'Marry', 'Accessories', 'Sunglasses', '8994567800',25),
(10, 'Jack', 'Electronics', 'Smart TV', '8104567899',5);

select * from Sales_Orders;

select Customer_Name, Ordered_Item from Sales_Orders;

update Sales_Orders set Ordered_Item = 'Chair' where Order_Id = 8;

select * from Sales_Orders;

drop table Sales_Orders;

