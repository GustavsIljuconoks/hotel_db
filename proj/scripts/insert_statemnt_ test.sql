#----------------------------------------------------------------------------------------
insert into `room type` (RoomPriceNight, Capacity, RoomDesc)
values 
	(20, 1, 'Single'), 
	(40, 2, 'Double'), 
	(70, 4, 'Family'), 
	(100, 4, 'VIP')
;
select * from `room type`;

insert into `role`(RollTitle)
values 
	('Apkopējs'),
    ('Istabene'),
    ('Šveicars'),
    ('Tehniskais darbinieks'),
    ('IT daļas priekšnieks'),
    ('Adminstrators'),
    ('Pavārs'),
    ('Šefpavārs'),
    ('Viesnīcas vadītājs'),
    ('Viesnīcas īpašnieks')
;
select * from `role`;

insert into `restaurant` (Name)
values 
	('Džungļu ēstuve');
select * from restaurant;

insert into `foodorders` (Restaurant_ID, Date, Price)
values 
	(1, curdate(), 5.00),
    (1, curdate(), 4.20),
    (1, curdate(), 6.69),
	(1, curdate(), 7.77),
    (1, curdate(), 2.43),
    (1, curdate(), 11.29),
    (1, curdate(), 2.5),
    (1, curdate(), 99.9),
    (1, curdate(), 6.69)
;
select * from foodorders;

insert into `guestdetail` (FirstName, LastName, PersonalCode, Email, Adress, PostalCode, City, Country, PhoneNo)
values
	('Gustavs', 'Šics', '101312-20719', 'gustavs.sics@gmail.com', 'Pretī kino', 'LV-4201', 'Valmiera', 'Latvija', "2313111"),
    ('Aldis', 'Kalns', '220104-312212', 'kalns@outlook.com', 'Pie kebaba', 'LV-4002', 'Liepāja', 'Latvija', '23122122'),
    ('Jānis', 'Blumbergs', '220104-22132', 'janis.blumbergs@gmail.com', 'Mežs', 'LV-4701', 'Ērģeme', 'Latvija', '2574095')
;
select * from guestdetail;

insert into `hotel` (Restaurant_ID, Rooms, Hotel_Name, AdressLine1, PostalCode, City, Country, PhoneNo, StarRating, NumberOfEmployees)
values 
	(1, 0, 'gustava viesnica', 'Zāļu iela 3', 'LV-4201', 'Liepāja', 'Latvija', 2331232, 4, 0),
    (1, 0, 'Goyette, Daugherty and Kub', '7719 Bunker Hill Way', '4832-541', 'Shyroke', 'Ukraine', '8051090696', 1, 0)
;
select * from hotel;

insert into `employee` (Hotel_ID, Role_ID, FirstName, LastName, PhoneNo, Email, Salary)
values 
	(1, 1, 'Kristers', 'Puzis', 2323131, 'kristers@gmail.com', 600),
    (1, 1, 'Aldis', 'Kalns', 2323131, 'dzeks@yahoo.com', 650),
    (1, 2, 'Pēteris', 'Kreisais', 2311111, 'peteris.kreisais@inbox.lv', 800),
	(1, 2, 'Markuss', 'Ābols', 2567834, 'mazaiszirgdzins@inbox.lv', 800),
    (1, 3, 'Artūrs', 'Mazais', 24252211, 'tavamazaaa@inbox.lv', 800),
	(1, 4, 'Jānis', 'Podnieks', 22222222, 'podnieks@outlook.com', 1020),
	(1, 4, 'Santa', 'Marija', 24444211, 'meeerce@gmail.com', 1040),
	(1, 5, 'Līga', 'Trešā', 2997674, 'sveetkuliiiga@gmail.com', 800),
	(1, 5, 'Džeks', 'Līkais', 2114131, 'liikaissiikais@inbox.lv', 800),
	(1, 6, 'Mikus', 'Lasis', 2313111, 'lasaKungs@gmail.com', 950),
	(1, 6, 'Kaspars', 'Čells', 2323131, 'instruments@inbox.lv', 970),
	(1, 7, 'Alberts', 'Šics', 2131111, 'alberts.sics@outlook.com', 1000),
	(1, 8, 'Otto', 'Otrais', 2311133, 'otraisOtto@gmail.com', 1500),
	(1, 9, 'Gustavs', 'Iļjučonoks', 27743711, 'es@gmail.com', 10000),
    (1, 8, 'Otto', 'Otrais', 2311133, 'otraisOtto@gmail.com', 1500),
    (1, 9, 'Gustavs', 'Iļjučonoks', 27743711, 'es@gmail.com', 10000)
;
select * from `employee`;

insert into `room` (RoomType_ID, Hotel_ID, RoomNumber, isAvailable)
values
	(1, 1, 111, 1),
    (1, 1, 112, 1),
	(1, 1, 113, 1),
	(1, 1, 114, 1),
	(2, 1, 115, 1),
	(2, 1, 116, 1),
	(2, 1, 117, 1),
	(2, 1, 118, 1),
	(3, 1, 119, 1),
	(3, 1, 120, 1),
	(3, 1, 121, 1),
	(3, 1, 122, 1),
	(4, 1, 123, 1),
	(4, 1, 124, 1),
    
    (1, 2, 211, 1),
	(1, 2, 212, 1),
	(1, 2, 213, 1),
	(1, 2, 214, 1),
	(2, 2, 215, 1),
	(2, 2, 216, 1),
	(2, 2, 217, 1),
	(2, 2, 218, 1),
	(3, 2, 219, 1),
	(3, 2, 220, 1),
	(3, 2, 221, 1),
	(3, 2, 222, 1),
	(4, 2, 223, 1),
	(4, 2, 224, 1)
;
select * from `room`;

insert into `booking` (Hotel_ID, Room_ID, GuestDetail_ID, Employee_ID, BookingDate, AdultsNo, UnderageNo)
values 
	(1, 1, 1, 3, '2023-03-12', 1, 0),
    (1, 2, 1, 4, '2023-03-12', 2, 0),
    (1, 3, 1, 3, '2023-03-12', 2, 0),
    (1, 4, 1, 4, '2023-03-12', 3, 0),
    (1, 14, 3, 2, '2023-03-12', 2, 0),
    (1, 10, 3, 2, '2023-03-12', 2, 0),
    (2, 27, 2, 2, '2023-03-12', 2, 0),
    (2, 19, 2, 2, '2023-03-12', 2, 0),
    (2, 21, 2, 2, '2023-03-12', 2, 0)
;
select * from booking;

INSERT INTO `bill` (FoodOrder_ID, Booking_ID)
VALUES 
        (1, 1),
        (2, 2),
        (3, 2),
        (4, 3),
        (5, 4),
        (6, 5),
        (7, 8)
ON DUPLICATE KEY UPDATE
	FoodOrder_ID = VALUES(FoodOrder_ID),
	Booking_ID = VALUES(Booking_ID);
select * from `bill`;

insert into `booking` (ArrivalTime, DepartureTime)
values 
	('2023-03-12', '2023-04-22'),
	('2023-03-12', '2023-03-31'),
	('2023-03-12', '2023-05-12'),
	('2023-03-12', '2023-03-28'),
	('2023-03-12', '2023-05-02'),
	('2023-03-12', '2023-06-12'),
	('2023-03-12', '2023-07-07'),
	('2023-03-12', '2023-06-16'),
	('2023-03-12', '2023-07-06')
ON DUPLICATE KEY UPDATE
	ArrivalTime = values(ArrivalTime),
	DepartureTime = values(DepartureTime);
select * from booking;
select * from room;


insert into `paymentdetail` (PaymentDate, CreditCardNo, PaymentMode, CheckNo)
values 
	('2023-03-12', 'card', '5166281753267397', 1),
	('2023-03-12', 'card', '372301387394408', 2),
	('2023-03-12', 'card', '5528114592289426', 3),
	('2023-03-12', 'cash', '', 4),
	('2023-03-12', 'card', '337941495727744', 5),
	('2023-03-12', 'card', '337941395160293', 6),
	('2023-03-12', 'cash', '', 7),
	('2023-03-12', 'card', '4041373706801184', 8),
	('2023-03-12', 'cash', '', 9)
ON DUPLICATE KEY UPDATE
	PaymentDate = values(PaymentDate),
	PaymentMode = values(PaymentMode),
    CreditCardNo = values(CreditCardNo),
    CheckNo = values(CheckNo);

select * from paymentdetail;

#-------------------------------------------------------
ALTER TABLE booking ADD Employee_ID INT AFTER GuestDetail_ID;
ALTER TABLE booking ADD CONSTRAINT fk_Booking_Employee1 FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID);
update booking set Employee_ID = 1 where Booking_ID = 4;


ALTER TABLE paymentdetail ADD Total INT DEFAULT NULL AFTER FoodCharge;
ALTER TABLE paymentdetail MODIFY COLUMN Total FLOAT; 
#------------------------------------------------------