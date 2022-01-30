SELECT destination.city_name, country_name
FROM destination 
	JOIN includes ON destination.destinationID = includes.Destination_destinationID
	JOIN trip ON includes.Trip_tripID = trip.tripID
    JOIN employee ON trip.Secretary_Employee_employeeID = employee.employeeID
WHERE employee.full_name = "Nick Galis";