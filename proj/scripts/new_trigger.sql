DELIMITER $$
CREATE TRIGGER `update_room_status` AFTER UPDATE on `room` FOR EACH ROW
BEGIN
	set @room_count = (select COUNT(Room_ID) from `room` where isAvailable = 1 and Hotel_ID = new.Hotel_ID);
	update `hotel` set Rooms = @room_count where Hotel_ID = new.Hotel_ID;
END $$
DELIMITER $$
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `update_numberOf_employees` AFTER UPDATE on `employee` FOR EACH ROW
BEGIN
	set @employee_count = (select count(Employee_ID) from employee where Hotel_ID = new.Hotel_ID);
    update `hotel` set NumberOfEmployees = @employee_count where Hotel_ID = new.Hotel_ID;
END $$
DELIMITER ;
#---------------------------------------------------------

DELIMITER $$
CREATE TRIGGER `check_room_available` BEFORE INSERT ON `booking` FOR EACH ROW 
BEGIN
	-- set @room_to_hotel = (select isAvailable from `room` where Room_ID = new.Hotel_ID);
	set @available = (select isAvailable from `room` where Room_ID = new.Room_ID and Hotel_ID = new.Hotel_ID);
	
	if (@available = 1) then
		update `room` set isAvailable = 0 where Room_ID = new.Room_ID;
	else
		signal sqlstate '23000' set message_text = 'error checking room!';
	end if;
END $$
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `create_paymentdetail` AFTER INSERT ON `booking` FOR EACH ROW 
BEGIN
	set @guest = (
		select GuestDetail_ID from booking where Booking_ID = new.Booking_ID
    );
    set @booking = (
		select Booking_ID from booking where Booking_ID = new.Booking_ID
    );
    
	insert into `paymentdetail` (GuestDetail_ID, Booking_ID) 
    values 
		(@guest, @booking);
END $$
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `check_date_diff` BEFORE UPDATE ON `booking` FOR EACH ROW 
BEGIN
	set @date_diff = (
		select DATEDIFF(DepartureTime, ArrivalTime) AS date_difference from `booking` 
        where Booking_ID = new.Booking_ID
    );
    
	if (@date_diff < 0) then
		signal sqlstate '23000' set message_text = 'incorrect departure time!';
	end if;
END $$
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER room_food_charge AFTER UPDATE on `booking` FOR EACH ROW
BEGIN
	# stors departure and arrival time difference 
	set @date_diff = (
		select DATEDIFF(DepartureTime, ArrivalTime) AS date_difference from `booking` 
        where Booking_ID = new.Booking_ID
    );
    
    # get particulars rooms charge for night
    set @one_night = (
		select `room type`.RoomPriceNight from `booking`
        inner join `room` on `booking`.Room_ID = `room`.Room_ID 
        inner join `room type` on `room`.RoomType_ID = `room type`.RoomType_ID 
        where Booking_ID = new.Booking_ID
    );
    
	 # Update RoomCharge with time * room_type
	set @room_charge = @one_night * @date_diff;
	update `paymentdetail` set RoomCharge = @room_charge where Booking_ID = new.Booking_ID;

	update `room` as r
	inner join `booking` as b on r.Room_ID = b.Room_ID
	set isAvailable = 1 where b.Booking_ID = new.Booking_ID;
    
    #-----------------------------------------------
    set @isBill = (
		select distinct Booking_ID from `bill` where Booking_ID = new.Booking_ID
    );
	set @food_charge = (select format(sum(TotalBill), 2) from `bill` where Booking_ID = new.Booking_ID);
    if (@isBill is not null) then
		update `paymentdetail` set FoodCharge = @food_charge where Booking_ID = new.Booking_ID;
    else
		update `paymentdetail` set FoodCharge = 0 where Booking_ID = new.Booking_ID;
    end if;
    
    
    set @food = (select FoodCharge from paymentdetail where Booking_ID = new.Booking_ID);
    update `paymentdetail` set Total = @room_charge + @food where Booking_ID = new.Booking_ID;
END $$
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `bill_to_foodorder` AFTER INSERT ON `foodorders` FOR EACH ROW
BEGIN
    set @order_id = (
		select FoodOrder_ID from foodorders where FoodOrder_ID = new.FoodOrder_ID
    );
    
    set @price = (
		select Price from foodorders where FoodOrder_ID = new.FoodOrder_ID
    );
        
    insert into `bill`(FoodOrder_ID, TotalBill) 
	values 
		(@order_id, @price);
END $$
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `name_to_upper_employee` BEFORE INSERT on `employee` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END
DELIMITER ;
#---------------------------------------------------------


DELIMITER $$
CREATE TRIGGER `name_to_upper_guest` BEFORE INSERT on `guestdetail` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END $$
DELIMITER ;
#---------------------------------------------------------