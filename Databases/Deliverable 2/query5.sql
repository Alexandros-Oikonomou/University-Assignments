SELECT SUM(price) FROM reservation
	JOIN customer ON reservation.Customer_customerID = customer.customerID
WHERE customer.full_name = 'Alexandros Oikonomou'