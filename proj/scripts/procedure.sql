DELIMITER $$
CREATE PROCEDURE `room_available_at_date`(IN `date` datetime, IN `hotel_ID` int)
BEGIN
	select
		room.Room_ID, 
		room.isAvailable, 
		room.Hotel_ID		
	from room 
	where 
		isAvailable = 1 and 
		room.Hotel_ID = `hotel_ID` and
		`date` not in (select BookingDate from booking)
	;
END $$
DELIMITER ;
#---------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE `employee_to_room`(IN `Hotel_ID` int)
BEGIN
	select 
		hotel.Hotel_ID,
		booking.Room_ID, 
		employee.Employee_ID,
		employee.FirstName,
		employee.LastName
	from booking
	inner join `employee` on `booking`.Employee_ID = `employee`.Employee_ID
	inner join `room` on `booking`.Room_ID = `room`.Room_ID
	inner join `hotel` on `booking`.Hotel_ID = `hotel`.Hotel_ID
	where 
		room.isAvailable = 0 and 
        DepartureTime is null and 
        hotel.Hotel_ID = `Hotel_ID`;
END $$
DELIMITER ;