CREATE TABLE Customer
( Customer_ID int NOT NULL PRIMARY KEY,
  Customer_FNAME varchar (50),
  Customer_LNAME varchar (50),
  Customer_LICENSEID int,
  Customer_ADDRESS varchar(255),
  Customer_USERNAME varchar(50),
  Customer_PASSWORD varchar (25),
  Customer_MOBILE char(11),
  Customer_dob date,
  Customer_IsMinor char(1)
);


CREATE TABLE Location
( Location_ID int NOT NULL,
  Customer_ID int NOT NULL,
  PRIMARY KEY (Location_ID, Customer_ID),
  Location_NAME varchar(255),
  FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);



CREATE TABLE Employee
( Employee_ID int NOT NULL PRIMARY KEY,
  Employee_FNAME varchar(50),
  Employee_LNAME varchar(50),
  Employee_ADDRESS varchar (255),
  Employee_DOB date
);

CREATE TABLE Payment
( Payment_ID int NOT NULL PRIMARY KEY,
  Date_Paid date,
  Payment_Amount Decimal(7,2),
  Payment_Method varchar(20)
);

CREATE TABLE RESERVATION
( Reservation_ID int NOT NULL PRIMARY KEY,
  Customer_ID int NOT NULL,
  Employee_ID int NOT NULL,
  Reservation_Date Date,
  Time_Duration varchar(255),
  Pickup_LOCATION varchar(255),
  Dropoff_LOCATION varchar(255),
  FOREIGN KEY (Customer_ID) REFERENCES  Customer,
  FOREIGN KEY (Employee_ID) REFERENCES  Employee
);

CREATE TABLE Invoice
( Invoice_ID int NOT NULL PRIMARY KEY,
  Payment_ID int NOT NULL,
  Reservation_ID int NOT NULL,
  Invoice_Date date,
  Payment_Amount Decimal (7,2),
  Date_Paid date,
  FOREIGN KEY (Payment_ID) REFERENCES Payment,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservation
);

CREATE TABLE Vehicle
( Vehicle_ID int NOT NULL PRIMARY KEY,
  Vehicle_Model varchar (10),
  Vehicle_Colour varchar (10),
  Vehicle_Capacity int
);

CREATE TABLE Reservation_Detail
( Reservation_ID int NOT NULL,
  Detail_ID int NOT NULL,
  PRIMARY KEY (Reservation_ID, Detail_ID),
  Vehicle_ID int NOT NULL,
  Time_START time,
  Time_END time,
  Reservation_DATE date,
  Time_Duration varchar(255),-- can't used interval
  Pickup_LOCATION varchar(255),
  Dropoff_LOCATION varchar(255),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle
);

INSERT INTO Customer VALUES
(12325009,'Chester','Fuller',24217022,'22 Jalan Jubli','Chester11','chester123','0122458363', '1995-12-03', 'N'),
(12332011,'Sarhan','Cumberbatch',55824583,'27 Jalan Perdana','Sc220','scumber1220','0128145109', '1980-01-12', 'N'),
(12588248,'Rin','Qistiana',97691370,'17 Jalan Dmasiv','Rin0199','metal123','0127561667', '2000-06-16', 'N'),
(12576774,'Imran','Khan',96024489,'99 Jalan Melati','Imran23','db23','0126850947', '2001-11-23', 'N'),
(12844065,'Aqil','Hazami',26072978,'33 Jalan Kasia','aqiljib22','aqil123','0121898920', '2001-10-28', 'N'),
(12662628,'Taufiq','Muhammad',45469468,'12 Jalan Putra','Taufiq99','supra112','0121898920', '1985-07-29', 'N')

INSERT INTO Location VALUES 
(757551,12325009,'Shah Alam'),
(945876,12332011,'Kuala Lumpur'),
(536006 ,12588248,'Seremban'),
(388908 ,12576774,'Puchong'),
(504834 ,12844065,'Sungai Buloh'),
(171722 ,12662628,'Petaling Jaya'),
(812838 ,12662628,'Sungai Buloh')


INSERT INTO Employee VALUES
(01273805,'Iona','French','24 Jalan Perak','1995-06-01'),
(01538410,'Jacqueline','Zimmerman','17 Jalan Suteri','1992-09-12'),
(01971067 ,'Joseph','Grey','67 Jalan Puteri','1990-03-25'),
(01095651 ,'Owen ','Hansen','55 Jalan Mawar','1989-07-17'),
(01361775 ,'Haris ','Davis','90 Jalan Biruni','1987-12-28'),
(01642049 ,'Victor ','Mathis','88 Jalan Raja','1985-05-20')

INSERT INTO Payment VALUES 
(516384,'2023-01-01',50.00,'Credit Card'),
(077318 ,'2022-12-03',25.00,'Credit Card'),
(530870 ,'2022-09-14',45.00,'Debit Card'),
(095847 ,'2022-01-11',15.00,'Debit Card'),
(690140  ,'2022-04-24',35.00,'Credit Card'),
(455219  ,'2022-07-28',55.00,'Debit Card'),
(127371 ,'2023-01-10', 55.00,'Debit Card')

INSERT INTO Reservation VALUES 
(602849,12325009,01273805,'2023-01-01','2 Hours','McDonald Puchong','McDonald Puchong'),
(826606,12332011,01538410,'2022-12-03','1 Hour','Aeon Shah Alam','Aeon Shah Alam'),
(470019,12588248,01971067,'2022-09-14','4 Hours','Dpulze Cyberjaya','Dpulze Cyberjaya'),
(532860,12576774,01095651,'2022-01-11','2 Hours','TM Cyberjaya','TM Cyberjaya'),
(922326,12844065,01361775,'2022-04-24','5 Hours','Giant Shah Alam','Giant Shah Alam'),
(839095,12662628,01642049,'2022-07-28','3 Hours','StarBucks Petaling Jaya','StarBucks Petaling Jaya'),
(192391,12662628,01642049,'2023-01-10','3 Hours', 'Starbucks SUngai Buloh','Starbucks SUngai Buloh')

INSERT INTO Vehicle VALUES 
(117300,'SUV','Blue',6),
(201626,'Sedan','Red',5),
(360965,'Hatchback','Yellow',4),
(103874,'MPV','Black',7),
(223229,'Sedan','Grey',5),
(236986,'Sedan','Blue',5)


INSERT INTO Reservation_Detail VALUES 
(602849,123125,117300,'9:00:00','11:00:00','2023-01-01','2 Hours','McDonald Puchong','McDonald Puchong'),
(826606,845829,201626,'6:00:00','7:00:00','2022-12-03','1 Hour','Aeon Shah Alam','Aeon Shah Alam'),
(470019,129399,360965,'14:00:00','6:00:00','2022-09-14','4 Hours','Dpulze Cyberjaya','Dpulze Cyberjaya'),
(532860,821374,103874,'14:00:00','16:00:00','2022-01-11','2 Hours','TM Cyberjaya','TM Cyberjaya'),
(922326,145823,223229,'16:00:00','21:00:00','2022-04-24','5 Hours','Giant Shah Alam','Giant Shah Alam'),
(839095,912394,236986,'19:30:00','22:30:00','2022-07-28','3 Hours','StarBucks Petaling Jaya','StarBucks Petaling Jaya'),
(192391,812384,236986,'16:30:00','19:30:00','2023-01-10','3 Hours', 'Starbucks SUngai Buloh', 'Starbucks SUngai Buloh')

INSERT INTO Invoice VALUES 
(10685462,516384,602849,'2023-01-01',50.00,'2023-01-01'),
(66777179,077318,826606,'2022-12-03',25.00,'2022-12-03'),
(52779940,530870,470019,'2022-09-14',45.00,'2022-09-14'),
(36658909,095847,532860,'2022-01-11',15.00,'2022-01-11'),
(34423636,690140,922326,'2022-04-24',35.00,'2022-04-24'),
(75370253,455219,839095,'2022-07-28',55.00,'2022-07-28'),
(12315125,127371,192391, '2023-01-10', 55.00,'2023-01-10')

--CTE
WITH customer_info AS (
SELECT Customer_ID, Customer_FNAME, Customer_LNAME, Customer_MOBILE
FROM Customer
), employee_info AS (
SELECT Employee_ID, Employee_FNAME, Employee_LNAME
FROM Employee
)
SELECT Reservation_ID, ci.Customer_FNAME, ci.Customer_LNAME, ci.Customer_MOBILE, ei.Employee_FNAME, ei.Employee_LNAME, Reservation_Date, Time_Duration, Pickup_LOCATION, Dropoff_LOCATION
FROM Reservation
JOIN customer_info ci ON Reservation.Customer_ID = ci.Customer_ID
JOIN employee_info ei ON Reservation.Employee_ID = ei.Employee_ID
ORDER BY Reservation_Date DESC;






--ROWNUMBER()
SELECT * FROM (
SELECT ROWNUMBER() OVER (ORDER BY Customer.Customer_ID) as RowNumber, Customer.Customer_ID, Customer.Customer_FNAME, Customer.Customer_LNAME, Reservation.Reservation_ID
FROM Customer
INNER JOIN Reservation ON Customer.Customer_ID = Reservation.Customer_ID) as temp 
WHERE temp.RowNumber BETWEEN 1 and 3




--Display top n records 

SELECT c.Customer_FNAME, c.Customer_LNAME, SUM(p.Payment_Amount) as Total_Payment
FROM Customer c
JOIN Reservation r ON c.Customer_ID = r.Customer_ID
JOIN Invoice i ON r.Reservation_ID = i.Reservation_ID
JOIN Payment p ON i.Payment_ID = p.Payment_ID
GROUP BY c.Customer_ID, c.Customer_FNAME, c.Customer_LNAME
ORDER BY Total_Payment DESC
FETCH FIRST 3 ROWS ONLY;



 --Aggregate functions



SELECT Customer.Customer_ID, Customer.Customer_FNAME, Customer.Customer_LNAME,
COUNT(DISTINCT Reservation.Reservation_ID) as "Number of Reservations",
SUM(Payment.Payment_Amount) as "Total Payment Amount",
AVG(Payment.Payment_Amount) as "Average Payment Amount",
MIN(Payment.Payment_Amount) as "Minimum Payment Amount",
MAX(Payment.Payment_Amount) as "Maximum Payment Amount"
FROM Customer
JOIN Reservation ON Customer.Customer_ID = Reservation.Customer_ID
JOIN Invoice ON Reservation.Reservation_ID = Invoice.Reservation_ID
JOIN Payment ON Invoice.Payment_ID = Payment.Payment_ID
GROUP BY Customer.Customer_ID, Customer.Customer_FNAME, Customer.Customer_LNAME
ORDER BY "Number of Reservations" DESC



--nested query:

--nested query checking whether the customer_id is present in the subquery of reservation table where reservation_id
--is present in the subquery of reservation_detail table where vehicle_id is present in the subquery 
--of vehicle table where vehicle capacity is greater than 6.

SELECT Customer_FNAME, Customer_LNAME
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID FROM Reservation 
    WHERE Reservation_ID IN (
        SELECT Reservation_ID FROM Reservation_Detail
        WHERE Vehicle_ID IN (
            SELECT Vehicle_ID FROM Vehicle 
            WHERE Vehicle_Capacity > 6
        )
    )
);



--- trigger

CREATE TRIGGER trg_customer12223
AFTER INSERT ON Customer
REFERENCING NEW AS new_row
FOR EACH ROW MODE DB2SQL
BEGIN
    IF new_row.CUSTOMER_DOB < '2000-10-10' THEN
        UPDATE Customer SET CUSTOMER_ISMINOR ='N' where CUSTOMER_ID = new_row.CUSTOMER_ID;
    ELSE 
        UPDATE Customer SET CUSTOMER_ISMINOR ='Y' where CUSTOMER_ID = new_row.CUSTOMER_ID;
    END IF;
END




--test
INSERT INTO Customer (Customer_ID, Customer_FNAME, Customer_LNAME, Customer_LICENSEID, Customer_ADDRESS, Customer_USERNAME, Customer_PASSWORD, Customer_MOBILE, Customer_dob)
VALUES (12325209,'Chestere','Fullerw',24217021,'221 Jalan Jubli','Chester111','chester1223','0122451363', '2001-12-03');

INSERT INTO Customer (Customer_ID, Customer_FNAME, Customer_LNAME, Customer_LICENSEID, Customer_ADDRESS, Customer_USERNAME, Customer_PASSWORD, Customer_MOBILE, Customer_dob)
VALUES (1274455201,'Veryunderage','Fudllerwq',24217520,'21221 Jalan Jubli','Chesster111','chester1223','0132451363', '2001-12-03');

INSERT INTO Customer (Customer_ID, Customer_FNAME, Customer_LNAME, Customer_LICENSEID, Customer_ADDRESS, Customer_USERNAME, Customer_PASSWORD, Customer_MOBILE, Customer_dob)
VALUES (1275112391,'WOWUUND','Fudllerwq',24217520,'21221 Jalan Jubli','Chesster111','chester1223','0132451363', '1999-12-03');


--group by & having query

SELECT l.Location_Name, COUNT(c.Customer_ID) as Number_of_Customers, SUM(p.Payment_Amount) as Total_Payment
FROM Customer c
JOIN Location l ON c.Customer_ID = l.Customer_ID
JOIN Reservation r ON c.Customer_ID = r.Customer_ID
JOIN Invoice i ON r.Reservation_ID = i.Reservation_ID
JOIN Payment p ON i.Payment_ID = p.Payment_ID
GROUP BY l.Location_Name
HAVING COUNT(c.Customer_ID) >= 1
AND SUM(p.Payment_Amount) > 1;


--VIEW Query

CREATE VIEW Customer_Reservation_View AS
SELECT c.Customer_ID, c.Customer_FNAME, c.Customer_LNAME,
r.Reservation_ID, r.Reservation_Date, r.Time_Duration,
r.Pickup_LOCATION, r.Dropoff_LOCATION
FROM Customer c
JOIN Reservation r ON c.Customer_ID = r.Customer_ID;


--stored procedure

CREATE PROCEDURE insert_customers10200
(
  IN p_Customer_ID INTEGER,
  IN p_Customer_FNAME VARCHAR(50),
  IN p_Customer_LNAME VARCHAR(50),
  IN p_Customer_LICENSEID INTEGER,
  IN p_Customer_ADDRESS VARCHAR(255),
  IN p_Customer_USERNAME VARCHAR(50),
  IN p_Customer_PASSWORD VARCHAR (25),
  IN p_Customer_MOBILE CHAR(11),
  IN p_Customer_dob DATE,
  IN p_Customer_IsMinor CHAR(1)
)
BEGIN
  INSERT INTO Customer (Customer_ID, Customer_FNAME, Customer_LNAME, Customer_LICENSEID,
  Customer_ADDRESS, Customer_USERNAME, Customer_PASSWORD, Customer_MOBILE, Customer_dob, Customer_IsMinor)
  VALUES (p_Customer_ID, p_Customer_FNAME, p_Customer_LNAME, p_Customer_LICENSEID,
 p_Customer_ADDRESS, p_Customer_USERNAME, p_Customer_PASSWORD, p_Customer_MOBILE, p_Customer_dob, p_Customer_IsMinor);
END


CALL insert_customer(112312421,'Erfan','Rahmani',123147022,'Taman Melati Utama','Erfanr','Erfan123','0183120123', '2003-03-29', 'Y');


CALL insert_customer(11212421,'shubo','faisal',123147022,'12 Ampang','erafaniscool','iloveerfan','821381239', '2001-12-08', 'Y');

--Concat and union


SELECT R.Reservation_ID, C.Customer_FNAME || ' ' || C.Customer_LNAME AS "Customer Name", E.Employee_FNAME || ' ' || E.Employee_LNAME AS "Employee Name", P.Payment_Amount, P.Payment_Method
FROM Customer C
JOIN Reservation R ON C.Customer_ID = R.Customer_ID
JOIN Employee E ON R.Employee_ID = E.Employee_ID
JOIN Invoice I ON R.Reservation_ID = I.Reservation_ID
JOIN Payment P ON I.Payment_ID = P.Payment_ID;

--





