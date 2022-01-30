SELECT customer.full_name, customer.phone_number FROM reservation
    JOIN customer ON reservation.Customer_customerID = customer.customerID
WHERE reservation.Trip_tripID = 1