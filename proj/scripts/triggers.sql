# updates room availability
DELIMITER $$
CREATE TRIGGER update_room_status AFTER UPDATE ON `room` FOR EACH ROW
BEGIN
	set @room_count = (select COUNT(Room_ID) from `room` where isAvailable = 1);
	update `hotel` set Rooms = @room_count where Hotel_ID = 1;
END$$
DELIMITER ;
drop TRIGGER check_room_status;

select * from room;
select * from hotel;
update room set isAvailable = 0
where Room_ID = 2;

#----------------------------------------------------------------------------------

# 
DELIMITER $$
CREATE TRIGGER check_room_available BEFORE INSERT ON `booking` FOR EACH ROW
BEGIN
	set @available = (select isAvailable from `room` where Room_ID = new.Room_ID);
	
    if (@available = 1) then
		update `room` set isAvailable = 0 where Room_ID = new.Room_ID;
	else
		signal sqlstate '23000' set message_text = 'error checking room!';
	end if;
END $$
DELIMITER ;
drop trigger checked_room;

select * from hotel;
select * from room;
select * from booking;
insert into booking values (3, 1, 3, 2, null, '2022-12-30', curdate(), null, 4, 0, 'kkas ir');
delete from booking where Booking_ID = 3;

select isAvailable from `room` where Room_ID = 3;
update room set isAvailable = 1 where Room_ID = 3;
describe room;
#----------------------------------------------------------------------------------

#
DELIMITER $$
CREATE TRIGGER change_room_isAvailable AFTER INSERT ON `booking` FOR EACH ROW
BEGIN
	update `room` set isAvailable = 0 where Room_ID = new.Room_ID;
END$$
DELIMITER ;
#----------------------------------------------------------------------------------

# sets upper case employee first n last name
DELIMITER $$
CREATE TRIGGER name_to_upper_employee BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END $$
DELIMITER ;
drop trigger name_to_upper;

select * from employee;
insert into employee
values (14, 1, 1, 'daniels', 'zarins', 2312311, 'daniels@gmail.com', 420);
#----------------------------------------------------------------------------------

# sets upper case guest first n last name
DELIMITER $$
CREATE TRIGGER name_to_upper_guest BEFORE INSERT ON `guestdetail` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END $$
DELIMITER ;
select * from guestdetail;
insert into guestdetail
values (2, 'jazeps', 'kurmis', '101312-20719', 'gustavs.sics@gmail.com', 'Pretī kino', 'LV-4201', 'Valmiera', 'Latvija', "2313111");
#----------------------------------------------------------------------------------

# calculates room charge in guests staying time
DELIMITER $$
CREATE TRIGGER room_charge AFTER UPDATE on `booking` FOR EACH ROW
BEGIN
	# stors departure and arrival time difference 
	set @date_diff = (
		select DATEDIFF(ArrivalTime ,DepartureTime) AS date_difference from booking 
        where Booking_ID = new.Booking_ID
    );
    
    # get particulars rooms charge for night
    set @one_night = (
		select `room type`.RoomPriceNight from booking 
        inner join `room` on `booking`.Room_ID = `room`.Room_ID 
        inner join `room type` on `room`.RoomType_ID = `room type`.RoomType_ID 
        where Booking_ID = new.Booking_ID
    );
    
    set @room_charge = @one_night * @date_diff;
    update paymentdetail set RoomCharge = @room_charge where Booking_ID = new.Booking_ID;
END $$
DELIMITER ;
drop trigger room_charge;
show triggers;

SELECT
  Booking_ID,
  DATEDIFF(DepartureTime, ArrivalTime) AS date_difference,
  `room`.Room_ID,
  `room type`.RoomDesc,
  `room type`.RoomPriceNight
FROM booking
inner join `room` on `booking`.Room_ID = `room`.Room_ID
inner join `room type` on `room`.RoomType_ID = `room type`.RoomType_ID
where Booking_ID = 1;

insert into `booking`
values 
	(2, 1, 2, 2, null, '2022-11-10', curdate(), null, 2, 0, 'nav')
;
update booking set DepartureTime = "2023-01-25" where Booking_ID = 2;

select * from paymentdetail;
insert into `paymentdetail`
values 
	(2, 2, 2, null, null, null, null, null, null)
;
#----------------------------------------------------------------------------------