/*Hãy copy data từ bảng customer(sales) vào table customerNoindex và bảng customerIndex nghĩa là bạn tạo index
trên cột customerid*/
select * into customerNoIndex 
from sales.customers 
select * into customerIndex 
from sales.customers 

 select * from customerIndex
 where state = 'NY'
 select * from customerNoindex
 where state = 'NY'
create clustered index IDX_customerID on customerIndex(customer_id)

/*Tạo truy vấn hiển thị thông tin của khách hàng có đặt hàng 
thông tin hiển thị: customer_id, first_name, city,order_id, orderdate trên cả 
2 table Sales.Customer_Index và Sales.Customer_NoIndex
So sánh hiệu xuất truy vấn*/
go
select c.customer_id, c.first_name, c.city, order_date, order_id
from customerIndex c, sales.orders
where city='San Diego'

select c.customer_id, c.first_name, c.city, order_date, order_id
from customerNoindex c, sales.orders
where city='San Diego'

use BikeStore
select * from production.products for xml auto, elements, root ('ListProducts')
select * from production.products for json auto