SELECT city_name, country_name FROM Destination
    JOIN includes ON includes.Destination_destinationID = Destination.destinationID
    JOIN Trip ON includes.Trip_tripID = Trip.tripID
WHERE Trip.date_of_departure = '2020-07-20'