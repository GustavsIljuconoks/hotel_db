CREATE VIEW `employee_to_room` AS
    SELECT 
        `hotel`.`Hotel_ID` AS `Hotel_ID`,
        `booking`.`Room_ID` AS `Room_ID`,
        `employee`.`Employee_ID` AS `Employee_ID`,
        `employee`.`FirstName` AS `FirstName`,
        `employee`.`LastName` AS `LastName`
    FROM
        (((`booking`
        JOIN `employee` ON ((`booking`.`Employee_ID` = `employee`.`Employee_ID`)))
        JOIN `room` ON ((`booking`.`Room_ID` = `room`.`Room_ID`)))
        JOIN `hotel` ON ((`booking`.`Hotel_ID` = `hotel`.`Hotel_ID`)))
    WHERE
        ((`room`.`isAvailable` = 0)
            AND (`booking`.`DepartureTime` IS NULL));
#---------------------------------------------------------

CREATE VIEW `guest_didnt_paid` AS
    SELECT 
        `paymentdetail`.Invoice_ID,
        `paymentdetail`.GuestDetail_ID,
        `paymentdetail`.Booking_ID ,
        `paymentdetail`.RoomCharge ,
        `paymentdetail`.FoodCharge ,
        `paymentdetail`.PaymentDate,
        `paymentdetail`.PaymentMode,
        `paymentdetail`.CreditCardNo,
        `paymentdetail`.CheckNo
    FROM
        `paymentdetail`
    WHERE
        (`paymentdetail`.CheckNo IS NULL);
#---------------------------------------------------------

CREATE VIEW `guest_room` AS
    SELECT 
        `room`.Hotel_ID,
        `room`.Room_ID,
        `guest`.FirstName,
        `guest`.LastName
    FROM
        ((`booking`
        JOIN `room` ON ((`booking`.`Room_ID` = `room`.`Room_ID`)))
        JOIN `guestdetail` `guest` ON ((`booking`.`GuestDetail_ID` = `guest`.`Guest_ID`)))
    WHERE
        (`room`.`isAvailable` = 0);
#---------------------------------------------------------

CREATE VIEW `payment_from_room` AS
    SELECT 
        `booking`.Booking_ID,
        (TO_DAYS(`booking`.DepartureTime) - TO_DAYS(`booking`.ArrivalTime)) AS `date_difference`,
        `room`.Room_ID,
        `room type`.RoomDesc,
        `room type`.RoomPriceNight
    FROM
        ((`booking`
        JOIN `room` ON ((`booking`.Room_ID = `room`.Room_ID)))
        JOIN `room type` ON ((`room`.RoomType_ID = `room type`.RoomType_ID)))
    WHERE
        `booking`.Booking_ID IN (
            SELECT Booking_ID FROM `booking`
            );