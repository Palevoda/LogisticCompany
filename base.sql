use master;
create database LogisticCenter;
use LogisticCenter;

create table PRODUCT
(
	uniq_code int primary key not null, 
	product_length int not null,
	product_width int not null,
	product_height int not null,
	product_volume as product_length*product_width*product_height,
	nominal_number int not null,
	unit_of_measurement nchar(5) not null,
)

create table CENTER
(
	Center nchar(30) primary key not null,
	City nchar(30) not null
)
create table REQUIRE
(
	Require_code int primary key identity(1,1),
	Product_code int not null foreign key references PRODUCT(uniq_code),
	From_Center nchar(30) not null foreign key references CENTER(Center),
	To_Center nchar(30) not null foreign key references CENTER(Center),
	Amount int not null,
	Volume int not null,
	Require_weight int not null,
	Distance int not null
)

create table STORAGE
(
	Product_code int not null,
	Number int default(0),
	Center nchar(30) not null foreign key references CENTER(Center),
)
create table EMPLOYESS
(
	uniq_code int primary key not null, 
	employee_sorname nchar(30) not null,
	employee_name nchar(30) not null,
	employee_second_name nchar(30) not null,
	center int not null,
	post nchar(30) not null,
)

create table TRUCK
(
	Truck_number int not null primary key,
	Truck_capacity int not null,
	Truck_load_capacity int not null,
	Truck_fuel_consumption int not null,
	Truck_base_capacity int not null,	
)
create table AUTOPARK
(
	Truck int unique not null foreign key references TRUCK(Truck_number),
	Truck_location nchar(30) not null,
	Truck_status bit default(0)
)
create table TRIP
(
	Trip_number int identity(1,1),
	Truck_number int foreign key references TRUCK(Truck_number),
	Trip_status nchar(30) not null,
	Order1 int foreign key references REQUIRE(Require_code),
	Order2 int foreign key references REQUIRE(Require_code),
	Order3 int foreign key references REQUIRE(Require_code),
	Order4 int foreign key references REQUIRE(Require_code),
	Order5 int foreign key references REQUIRE(Require_code),
	Order6 int foreign key references REQUIRE(Require_code),
	Order7 int foreign key references REQUIRE(Require_code),
	Order8 int foreign key references REQUIRE(Require_code),
	Order9 int foreign key references REQUIRE(Require_code),
	Order10 int foreign key references REQUIRE(Require_code),
	Order11 int foreign key references REQUIRE(Require_code),
	Order12 int foreign key references REQUIRE(Require_code),
	Order13 int foreign key references REQUIRE(Require_code),
	Order14 int foreign key references REQUIRE(Require_code),
	Order15 int foreign key references REQUIRE(Require_code),
	Order16 int foreign key references REQUIRE(Require_code),
	Order17 int foreign key references REQUIRE(Require_code),
	Order18 int foreign key references REQUIRE(Require_code),
	Order19 int foreign key references REQUIRE(Require_code),
	Order20 int foreign key references REQUIRE(Require_code)
)
