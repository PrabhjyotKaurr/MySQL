# ON UPDATING IT STORES THE UPDATEC VALUE IN USER_AUDIT TABLE.
CREATE TABLE User_audit (
User_id INT AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
changedat DATETIME DEFAULT NULL,
action VARCHAR(50) DEFAULT NULL
);
CREATE TRIGGER USER_UPDATE
BEFORE UPDATE ON user
FOR EACH ROW
INSERT INTO user_audit
SET action = 'update',
User_id = OLD.User_id,
First_name = OLD.First_name,
Last_name = OLD.Last_name,
changedat = NOW();

UPDATE user
SET
First_name = 'Eric'
WHERE
First_name = 'Leroy';
SELECT * FROM USER_AUDIT_;



#TRIIGER TO CHANGE STAFF POSITION
CREATE TABLE Staff_promotion(
Staff_id INT AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
Position VARCHAR(50) NOT NULL,
changedat DATETIME DEFAULT NULL,
action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER STAFF_UPDATE
BEFORE UPDATE ON staff
FOR EACH ROW
INSERT INTO staff_promotion
SET action = 'update',
Staff_id = OLD.Staff_id,
First_name = OLD.First_name,
Last_name = OLD.Last_name,
Position = Old.Position,
changedat = NOW();

UPDATE staff
SET
Position = 'MANAGER'
Where
Staff_id = '107';

SELECT * FROM STAFF_PROMOTION;



#Trigger for saving order details before deleting it
CREATE TABLE Orders_Archives (
Order_id int(255) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Staff_id int(255) NOT NULL,
User_id int(255) NOT NULL,
Menu_id int(255) NOT NULL,
Quantity int(255) NOT NULL,
Restaurant_id int(255) NOT NULL,
Order_status enum('ADDED_TO_CART','CONFIRMED','PAYMENT_CONFIRMED','DELIVERED') DEFAULT NULL,
deletedAt TIMESTAMP DEFAULT NOW()
);
DELIMITER $$
CREATE TRIGGER BEFORE_DELETING_ORDERS
BEFORE DELETE
ON orders FOR EACH ROW
BEGIN
INSERT INTO orders_archives(Order_id, Staff_id, User_id, Menu_id, Quantity , Restaurant_id, Order_status)
VALUES(OLD.Order_id, OLD.Staff_id, OLD.User_id, OLD.Menu_id, OLD.Quantity ,OLD.Restaurant_id, Order_status);
END$$

DELIMITER ;
DELETE FROM orders
WHERE Order_id = 138;

SELECT * FROM ORDERS; #to view trigger