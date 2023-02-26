-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_db` DEFAULT CHARACTER SET utf8 ;
USE `hotel_db` ;

-- -----------------------------------------------------
-- Table `hotel_db`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Restaurant` (
  `Restaurant_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Restaurant_ID`),
  UNIQUE INDEX `Restaurant_ID_UNIQUE` (`Restaurant_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Hotel` (
  `Hotel_ID` INT NOT NULL AUTO_INCREMENT,
  `Restaurant_ID` INT NOT NULL,
  `Rooms` INT NULL,
  `Hotel_Name` VARCHAR(45) NOT NULL,
  `AdressLine1` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PhoneNo` VARCHAR(15) NULL,
  `StarRating` INT NULL,
  `NumberOfEmployees` INT NULL,
  PRIMARY KEY (`Hotel_ID`),
  INDEX `fk_Hotel_Restaurant1_idx` (`Restaurant_ID` ASC) VISIBLE,
  UNIQUE INDEX `Hotel_ID_UNIQUE` (`Hotel_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Hotel_Restaurant1`
    FOREIGN KEY (`Restaurant_ID`)
    REFERENCES `hotel_db`.`Restaurant` (`Restaurant_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Room Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Room Type` (
  `RoomType_ID` INT NOT NULL AUTO_INCREMENT,
  `RoomPriceNight` FLOAT NULL,
  `Capacity` INT NULL,
  `RoomDesc` VARCHAR(255) NULL,
  PRIMARY KEY (`RoomType_ID`),
  UNIQUE INDEX `RoomType_ID_UNIQUE` (`RoomType_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Room` (
  `Room_ID` INT NOT NULL AUTO_INCREMENT,
  `RoomType_ID` INT NOT NULL,
  `Hotel_ID` INT NOT NULL,
  `RoomNumber` INT NOT NULL,
  `isAvailable` TINYINT NOT NULL,
  PRIMARY KEY (`Room_ID`),
  INDEX `fk_Room_Room Type_idx` (`RoomType_ID` ASC) VISIBLE,
  INDEX `fk_Room_Hotel1_idx` (`Hotel_ID` ASC) VISIBLE,
  UNIQUE INDEX `Room_ID_UNIQUE` (`Room_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Room Type`
    FOREIGN KEY (`RoomType_ID`)
    REFERENCES `hotel_db`.`Room Type` (`RoomType_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_Hotel1`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `hotel_db`.`Hotel` (`Hotel_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Role` (
  `Role_ID` INT NOT NULL AUTO_INCREMENT,
  `RollTitle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Role_ID`),
  UNIQUE INDEX `Role_ID_UNIQUE` (`Role_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Employee` (
  `Employee_ID` INT NOT NULL AUTO_INCREMENT,
  `Hotel_ID` INT NOT NULL,
  `Role_ID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `PhoneNo` VARCHAR(15) NULL,
  `Email` VARCHAR(45) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`Employee_ID`),
  INDEX `fk_Employee_Role1_idx` (`Role_ID` ASC) VISIBLE,
  INDEX `fk_Employee_Hotel1_idx` (`Hotel_ID` ASC) VISIBLE,
  UNIQUE INDEX `Employee_ID_UNIQUE` (`Employee_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Role1`
    FOREIGN KEY (`Role_ID`)
    REFERENCES `hotel_db`.`Role` (`Role_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Hotel1`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `hotel_db`.`Hotel` (`Hotel_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`GuestDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`GuestDetail` (
  `Guest_ID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `PersonalCode` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Adress` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `PhoneNo` VARCHAR(15) NULL,
  PRIMARY KEY (`Guest_ID`),
  UNIQUE INDEX `Guest_ID_UNIQUE` (`Guest_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`Booking` (
  `Booking_ID` INT NOT NULL AUTO_INCREMENT,
  `Hotel_ID` INT NOT NULL,
  `Room_ID` INT NOT NULL,
  `GuestDetail_ID` INT NOT NULL,
  `Employee_ID` INT NOT NULL,
  `BookingDate` DATETIME NULL,
  `ArrivalTime` DATETIME NULL,
  `DepartureTime` DATETIME NULL,
  `AdultsNo` INT NULL,
  `UnderageNo` INT NULL,
  `SpecialReq` VARCHAR(45) NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `fk_Booking_GuestDetail1_idx` (`GuestDetail_ID` ASC) VISIBLE,
  INDEX `fk_Booking_Hotel1_idx` (`Hotel_ID` ASC) VISIBLE,
  INDEX `fk_Booking_Employee1_idx` (`Employee_ID` ASC) VISIBLE,
  UNIQUE INDEX `Booking_ID_UNIQUE` (`Booking_ID` ASC) VISIBLE,
  INDEX `fk_Booking_Room1_idx` (`Room_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_GuestDetail1`
    FOREIGN KEY (`GuestDetail_ID`)
    REFERENCES `hotel_db`.`GuestDetail` (`Guest_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Hotel1`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `hotel_db`.`Hotel` (`Hotel_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `hotel_db`.`Employee` (`Employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Room1`
    FOREIGN KEY (`Room_ID`)
    REFERENCES `hotel_db`.`Room` (`Room_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`PaymentDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`PaymentDetail` (
  `Invoice_ID` INT NOT NULL AUTO_INCREMENT,
  `GuestDetail_ID` INT NOT NULL,
  `Booking_ID` INT NOT NULL,
  `RoomCharge` FLOAT NULL,
  `FoodCharge` FLOAT NULL,
  `Total` FLOAT NULL,
  `PaymentDate` DATETIME NULL,
  `PaymentMode` VARCHAR(45) NULL,
  `CreditCardNo` VARCHAR(45) NULL,
  `CheckNo` INT NULL,
  PRIMARY KEY (`Invoice_ID`),
  INDEX `fk_PaymenDetail_GuestDetail1_idx` (`GuestDetail_ID` ASC) VISIBLE,
  INDEX `fk_PaymenDetail_Booking1_idx` (`Booking_ID` ASC) VISIBLE,
  UNIQUE INDEX `Invoice_ID_UNIQUE` (`Invoice_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PaymenDetail_GuestDetail1`
    FOREIGN KEY (`GuestDetail_ID`)
    REFERENCES `hotel_db`.`GuestDetail` (`Guest_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PaymenDetail_Booking1`
    FOREIGN KEY (`Booking_ID`)
    REFERENCES `hotel_db`.`Booking` (`Booking_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`FoodOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`FoodOrders` (
  `FoodOrder_ID` INT NOT NULL AUTO_INCREMENT,
  `Restaurant_ID` INT NOT NULL,
  `Date` DATETIME NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`FoodOrder_ID`),
  INDEX `fk_FoodOrders_Restaurant1_idx` (`Restaurant_ID` ASC) VISIBLE,
  UNIQUE INDEX `FoodOrder_ID_UNIQUE` (`FoodOrder_ID` ASC) VISIBLE,
  CONSTRAINT `fk_FoodOrders_Restaurant1`
    FOREIGN KEY (`Restaurant_ID`)
    REFERENCES `hotel_db`.`Restaurant` (`Restaurant_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_db`.`BIll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`BIll` (
  `Bill_ID` INT NOT NULL AUTO_INCREMENT,
  `FoodOrder_ID` INT NOT NULL,
  `Booking_ID` INT NULL,
  `TotalBill` FLOAT NULL,
  PRIMARY KEY (`Bill_ID`),
  INDEX `fk_BIll_FoodOrders1_idx` (`FoodOrder_ID` ASC) VISIBLE,
  INDEX `fk_BIll_Booking1_idx` (`Booking_ID` ASC) VISIBLE,
  UNIQUE INDEX `Bill_ID_UNIQUE` (`Bill_ID` ASC) VISIBLE,
  CONSTRAINT `fk_BIll_FoodOrders1`
    FOREIGN KEY (`FoodOrder_ID`)
    REFERENCES `hotel_db`.`FoodOrders` (`FoodOrder_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIll_Booking1`
    FOREIGN KEY (`Booking_ID`)
    REFERENCES `hotel_db`.`Booking` (`Booking_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `hotel_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `hotel_db`.`guest_didnt_paid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`guest_didnt_paid` (`Invoice_ID` INT, `GuestDetail_ID` INT, `Booking_ID` INT, `RoomCharge` INT, `FoodCharge` INT, `PaymentDate` INT, `PaymentMode` INT, `CreditCardNo` INT, `CheckNo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hotel_db`.`guest_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`guest_room` (`Hotel_ID` INT, `Room_ID` INT, `FirstName` INT, `LastName` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hotel_db`.`payment_from_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_db`.`payment_from_room` (`Booking_ID` INT, `date_difference` INT, `Room_ID` INT, `RoomDesc` INT, `RoomPriceNight` INT);

-- -----------------------------------------------------
-- procedure room_available_at_date
-- -----------------------------------------------------

DELIMITER $$
USE `hotel_db`$$
CREATE PROCEDURE `room_available_at_date`(IN `date` datetime, IN `hotel_ID` int)
BEGIN
	select distinct
		room.Room_ID, 
		room.isAvailable, 
		room.Hotel_ID		
	from room 
	where 
		isAvailable = 1 and 
		room.Hotel_ID = `hotel_ID` and
		`date` not in (select BookingDate from booking);
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure employee_to_room
-- -----------------------------------------------------

DELIMITER $$
USE `hotel_db`$$
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
END;$$

DELIMITER ;

-- -----------------------------------------------------
-- View `hotel_db`.`guest_didnt_paid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_db`.`guest_didnt_paid`;
USE `hotel_db`;
CREATE  OR REPLACE VIEW `guest_didnt_paid` AS
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

-- -----------------------------------------------------
-- View `hotel_db`.`guest_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_db`.`guest_room`;
USE `hotel_db`;
CREATE  OR REPLACE VIEW `guest_room` AS
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

-- -----------------------------------------------------
-- View `hotel_db`.`payment_from_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_db`.`payment_from_room`;
USE `hotel_db`;
CREATE  OR REPLACE VIEW `payment_from_room` AS
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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Trigger `hotel_db`.`update_room_status`
-- -----------------------------------------------------
DELIMITER $$
CREATE TRIGGER `update_room_status` AFTER UPDATE on `room` FOR EACH ROW
BEGIN
	set @room_count = (select COUNT(Room_ID) from `room` where isAvailable = 1 and Hotel_ID = new.Hotel_ID);
	update `hotel` set Rooms = @room_count where Hotel_ID = new.Hotel_ID;
END $$
DELIMITER $$


-- -----------------------------------------------------
-- Trigger `hotel_db`.`update_numberOf_employees`
-- -----------------------------------------------------
DELIMITER $$
CREATE TRIGGER `update_numberOf_employees` AFTER UPDATE on `employee` FOR EACH ROW
BEGIN
	set @employee_count = (select count(Employee_ID) from employee where Hotel_ID = new.Hotel_ID);
    update `hotel` set NumberOfEmployees = @employee_count where Hotel_ID = new.Hotel_ID;
END $$
DELIMITER ;


-- -----------------------------------------------------
-- Trigger `hotel_db`.`check_room_available`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Trigger `hotel_db`.`create_paymentdetail`
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Trigger `hotel_db`.`check_date_diff`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Trigger `hotel_db`.`room_food_charge`
-- -----------------------------------------------------
DELIMITER $$
CREATE TRIGGER `room_food_charge` AFTER UPDATE ON `booking` FOR EACH ROW
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

-- -----------------------------------------------------
-- Trigger `hotel_db`.`bill_to_foodorder`
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Trigger `hotel_db`.`name_to_upper_employee`
-- -----------------------------------------------------
DELIMITER $$
CREATE TRIGGER `name_to_upper_employee` BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END
DELIMITER ;

-- -----------------------------------------------------
-- Trigger `hotel_db`.`name_to_upper_guest`
-- -----------------------------------------------------
DELIMITER $$
CREATE TRIGGER `name_to_upper_guest` BEFORE INSERT ON `guestdetail` FOR EACH ROW
BEGIN
	set new.FirstName = CONCAT(UPPER(SUBSTRING(NEW.FirstName,1,1)), LOWER(SUBSTRING(NEW.FirstName,2)));
    set new.LastName = CONCAT(UPPER(SUBSTRING(NEW.LastName,1,1)), LOWER(SUBSTRING(NEW.LastName,2)));
END $$
DELIMITER ;