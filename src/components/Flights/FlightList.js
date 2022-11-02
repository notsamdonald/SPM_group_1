import { useEffect, useState } from "react";

import Card from "../UI/Card";

import Flight from "./Flight";
import classes from "./FlightList.module.css";

const DUMMY_FLIGHTS = [
  {
    id: "1",
    name: "US Airways",
    time: "8:30 PM - 11:00 PM",
    price: 22.99,
  },
  {
    id: "2",
    name: "Emirates",
    time: "4:30 PM - 9:00 PM",
    price: 16.5,
  },
  {
    id: "3",
    name: "British Airways",
    time: "6:30 AM - 11:00 AM",
    price: 12.99,
  },
  {
    id: "4",
    name: "Air India",
    time: "12:30 PM - 2:00 PM",
    price: 18.99,
  },
];

const FlightList = () => {
  const [flights, setFlights] = useState(DUMMY_FLIGHTS);
  const [isLoading, setIsLoading] = useState(true);
  const [httpError, setHttpError] = useState();

  useEffect(() => {
    const fetchFlights = async () => {
      // const response = await fetch(
      //   "https://react-http-b53cd-default-rtdb.firebaseio.com/meals.json"
      // );

      // if (!response.ok) {
      //   throw new Error("Something went wrong!");
      // }
      // const responseData = await response.json();
      // const loadedMeals = [];
      // for (const key in responseData) {
      //   loadedMeals.push({
      //     id: key,
      //     name: responseData[key].name,
      //     description: responseData[key].description,
      //     price: responseData[key].price,
      //   });
      // }

      // setFlights(loadedMeals);
      setFlights(DUMMY_FLIGHTS);
      setIsLoading(false);
    };
    fetchFlights().catch((error) => {
      setIsLoading(false);
      // setHttpError(error.message);
      setHttpError("DUMMY ERROR");
    });
  }, []);

  if (isLoading) {
    return (
      <section className={classes.FlightsLoading}>
        <p>Loading...</p>
      </section>
    );
  }

  if (httpError) {
    return (
      <section className={classes.FlightsError}>
        <p>{httpError}</p>
      </section>
    );
  }

  const flightsList = flights.map((flight) => (
    <Flight
      key={flight.id}
      id={flight.id}
      name={flight.name}
      time={flight.time}
      price={flight.price}
    />
  ));

  return (
    <section className={classes.flights}>
      <Card>
        <ul>{flightsList}</ul>
      </Card>
    </section>
  );
};

export default FlightList;
