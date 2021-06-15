#FULL USER NAMES
SELECT
CONCAT(First_Name, ' ', ' ', Last_Name) Full_name
FROM
USER;

#Finds the largest order placed and cuisine ---
SELECT total_price, menu_name
FROM BILL
ORDER BY total_price DESC;

#--- AVG ORDER PRICE ----
SELECT AVG(total_price)
FROM BILL;

#--- Total order price ----
SELECT SUM(TOTAL_PRICE)
FROM BILL;

#---- Total price without nay discount ----
SELECT SUM(Price*Quantity)
From Bill;

#---- Total Discount offered ---
Select sum(total_price) - sum(price*quantity)
from bill;


#---- Total cards used for payments ---
SELECT count(Exp_year)
From payment_details;

#--- Card expiry by 2022 ---
SELECT count(exp_year)
FROM payment_details
WHERE Exp_year = 22;

#--- Total delivered ---
SELECT (Order_Status)
FROM orders
WHERE Order_status = 'Delivered';
SELECT count(Order_Status)
FROM orders
WHERE Order_status = 'Delivered';

#---- Total payment confirmed ---
SELECT (Order_Status)
FROM orders
WHERE Order_status = 'Payment_Confirmed';
SELECT count(Order_Status)
FROM orders
WHERE Order_status = 'Payment_Confirmed';

#---- Total added to cart ---
SELECT (Order_Status)
FROM orders
WHERE Order_status = 'Added_to_cart';
SELECT count(Order_Status)
FROM orders
WHERE Order_status = 'Added_to_cart';

#---- Users from Mumbai ---
SELECT User_id
FROM USER
WHERE city = 'Mumbai';
SELECT COUNT(User_id)
FROM USER
WHERE city = 'Mumbai';

#---- Users from Mangalore ---
SELECT User_id
FROM USER
WHERE city = 'Mangalore';
SELECT COUNT(User_id)
FROM USER
WHERE city = 'Mangalore';

#--- Users from Bangalore ---
SELECT User_id
FROM USER
WHERE city = 'Bangalore';
SELECT COUNT(User_id)
FROM USER
WHERE city = 'Bangalore';

#---- Users from Kangalore ---
SELECT User_id
FROM USER
WHERE city = 'Kangalore';
SELECT COUNT(User_id)
FROM USER
WHERE city = 'Kangalore';

#--- Total delivery boy ---
SELECT * FROM STAFF
WHERE position = 'DELIVERY_BOY';
SELECT count(position)
FROM STAFF
WHERE position = 'DELIVERY_BOY';

#--- Total delivery girl ----
SELECT * FROM STAFF
WHERE position = 'DELIVERY_GIRL';
SELECT count(position)
FROM STAFF
WHERE position = 'DELIVERY_GIRL';

#--- total chef ----
SELECT * FROM STAFF
WHERE position = 'Chef';
SELECT count(position)
FROM STAFF
WHERE position = 'Chef';

#---- Total manager ---
SELECT * FROM STAFF
WHERE position = 'manager';
SELECT count(position)
FROM STAFF
WHERE position = 'manager';

#--- Total restaurants --
SELECT COUNT(restaurant_name)
FROM restaurant;

#--- Total cuisine ---
SELECT COUNT(cuisine)
FROM restaurant;
SELECT count(distinct(cuisine))
FROM restaurant;

SELECT distinct(cuisine)
FROM restaurant;

#--- Total alcholic with price---
SELECT Menu_name, Price
FROM Drinks_menu
WHERE Type = 'Alcoholic'
ORDER by Price DESC;

#--- Total non - alcoholic with price ---
SELECT Menu_name, Price
FROM Drinks_menu
WHERE Type = 'Non-Alcoholic'
ORDER by Price DESC;

#--- Find out how many males and females are there ---
SELECT Sex, Position
FROM STAFF
WHERE Sex = 'Female';
SELECT count(Sex)
FROM STAFF
WHERE Sex = 'Female';

SELECT Sex, Position
FROM STAFF
WHERE Sex = 'Male';
SELECT count(Sex)
FROM STAFF
WHERE Sex = 'Male';

#--- Find out how many males and females with birthdates in june ---
SELECT Sex
FROM STAFF
WHERE Bdate LIKE '__-06%';

#--- Veg ---
SELECT menu_name
FROM food_menu
WHERE type = 'Veg';

#--- Non Veg ---
SELECT menu_name
FROM food_menu
WHERE type = 'Non-Veg';

#--- Main course --
SELECT Category
FROM food_menu
WHERE Category = 'Main Course';
SELECT Count(Category)
FROM food_menu
WHERE Category = 'Main Course';

#--- Dessert ---
SELECT Category, price, menu_name
FROM food_menu
WHERE Category = 'Dessert';
SELECT Count(Category)
FROM food_menu
WHERE Category = 'Dessert';

#---- Sandwhich --
SELECT Category
FROM food_menu
WHERE Category = 'Sandwich';
SELECT Count(Category), price, Menu_name
FROM food_menu
WHERE Category = 'Sandwich';

#---- Starters --
SELECT Category, price, menu_name
FROM food_menu
WHERE Category = 'Starters';
SELECT Count(Category), price
FROM food_menu
WHERE Category = 'Starters';

#--- FIND ALL food with resturants providing them asec ----
Select Menu_name
FROM Food_Menu
Order By menu_name;

Select Menu_name
FROM Food_Menu
Order By menu_name DESC;

# STAFF WITH MAX SALARY
SELECT
Staff_Id,
First_name,
Last_name,
Position,
MAX(Salary)
FROM staff;

# ONLINE PAYMENT ORDERS
SELECT
orders.User_id,
orders.Order_id,
payment.Payment_id,
payment.Payment_type
FROM orders
RIGHT JOIN payment ON orders.Order_id = payment.Order_id
WHERE payment.Payment_type = 'ONLINE_PAYMENT'
ORDER BY User_id;

#FULL MENU
SELECT
f.Restaurant_id,
f.Menu_name AS Food_items,
f.Type,
f.Price,
d.Menu_name AS Beverages,
d.Type,
d.Price
FROM food_menu f
JOIN drinks_menu d ON f.Restaurant_id = d.Restaurant_id;