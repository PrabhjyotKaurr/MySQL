# PUBLIC PAYMENT DETAILS
CREATE VIEW PUBLIC_PAYMENT_DETAILS AS
SELECT
p.user_id,
p.payment_id,
p.card_holder_name,
s.order_id,
s.payment_type,
s.payment_status
FROM
payment_details p
JOIN
payment s ON s.payment_id = p.payment_id;




# VEG MENU
CREATE VIEW VEG_MENU AS
SELECT
menu_name
FROM
food_menu
WHERE
type = 'veg';



# NON VEG MENU
CREATE VIEW NON_VEG_MENU AS
SELECT
menu_name
FROM
food_menu
WHERE
type = 'Non-veg';



# FOOD QUALITY FEEDBACK
CREATE VIEW FOOD_QUALITY AS
SELECT
food_quality, service
FROM
feedback;



#EXPENSIVE ITEMS FROM MENU
CREATE VIEW EXPENSIVE_ITEMS AS
SELECT
menu_name, price, order_id, user_id
FROM
bill
WHERE
Price > (SELECT
AVG(Price)
FROM
Bill);



# EXPENSIVE (HIGHEST PAYING) ORDERS
CREATE VIEW EXPENSIVE_ORDERS AS
SELECT
menu_name, total_price, order_id, user_id
FROM
bill
WHERE
Total_Price > (SELECT
AVG(Total_Price)
FROM
Bill)
ORDER BY Total_Price DESC;




# FREQUENTLY ORDERED ITEMS
CREATE VIEW MOST_ORDERED_ITEMS AS
SELECT
Menu_name, COUNT(*)
FROM
bill
GROUP BY menu_name
ORDER BY COUNT(*) DESC
LIMIT 5;




# STAFF FEEDBACK
CREATE VIEW staff_feedbacks AS
SELECT
s.first_name, s.last_name, s.staff_id, f.service
FROM
staff s
JOIN
feedback f ON s.Staff_id = f.staff_id;