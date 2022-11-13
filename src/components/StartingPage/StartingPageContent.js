import { useContext, useState } from "react";
import FlightList from "../Flights/FlightList";
import AuthContext from "../../store/auth-context";
import classes from "./StartingPageContent.module.css";
import SearchForm from "../Search/SearchForm";
import MainFilter from "../Filter/MainFilter";

const StartingPageContent = () => {
  const authCtx = useContext(AuthContext);
  const isLoggedIn = authCtx.isLoggedIn;
  const [flights, setFlights] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [httpError, setHttpError] = useState();
  const [isError, setIsError] = useState(false);

  const fetchFlights = async (
    departureValue,
    arrivalValue,
    dateValue,
    passengerCount
  ) => {
    setIsLoading(true);
    const response = await fetch(
      // "https://react-http-b53cd-default-rtdb.firebaseio.com/meals.json"
      "http://localhost:8080/flight/searchFlights",
      {
        method: "POST",
        body: JSON.stringify({
          // landAirportId: 10,
          landAirportId: arrivalValue.code,
          departAirportId: departureValue.code,

          // departAirportId: 5,
          departDateTime: dateValue,
          // departDateTime: "2022-12-01",
          numberOfTravellers: passengerCount,
          // numberOfTravellers: 2,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      }
    );

    console.log(response);
    if (!response.ok) {
      throw new Error("Something went wrong!");
    }
    const responseData = await response.json();

    // const responseData = response;
    const loadedFlights = [];
    for (const key in responseData) {
      // console.log("START");
      // console.log(responseData[key]);
      // console.log(responseData[key].depart_airport_ID);
      // console.log(responseData[key].land_airport_ID);
      // console.log(responseData[key].depart_date_time);
      // console.log(responseData[key].land_date_time);
      // console.log("END");
      loadedFlights.push({
        id: key,
        // name: responseData[key].name,
        name: responseData[key].company,
        // description: responseData[key].description,
        departDateTime: responseData[key].depart_date_time,
        price: responseData[key].aFare * passengerCount,
        from: departureValue.label,
        to: arrivalValue.label,
        passengers: passengerCount,
        // price: responseData[key].company,
      });
    }

    setFlights(loadedFlights);
    console.log(loadedFlights);
    // setFlights(DUMMY_FLIGHTS);
    setIsLoading(false);
  };

  const searchHandler = (
    departureValue,
    arrivalValue,
    dateValue,
    passengerCount
  ) => {
    fetchFlights(departureValue, arrivalValue, dateValue, passengerCount).catch(
      (error) => {
        // console.log("errorrrr:");
        setIsLoading(false);
        // setHttpError(error.message);
        setHttpError("Error fetching flights from server");
        setIsError(true);
      }
    );
  };

  const maxPriceFilterHandler = (maxPrice) => {
    console.log(maxPrice);
    const filteredFlights = flights.filter(
      (flight) => flight.price <= maxPrice
    );
    setFlights(filteredFlights);
    console.log(flights);
  };

  const airlineFilterHandler = (airline) => {
    console.log(airline);
    const filteredFlights = flights.filter((flight) => flight.name === airline);
    setFlights(filteredFlights);
    console.log(flights);
  };

  const sortFlights = (isAscending) => {
    if (isAscending) {
      setFlights(flights.sort((a, b) => b.price - a.price));
    } else {
      setFlights(flights.sort((a, b) => a.price - b.price));
    }
  };

  // const loadingDisplay = () => {};

  // const errorDisplay = () => {};

  return (
    <section className={classes.starting}>
      {isLoggedIn && (
        <div>
          <SearchForm searchHandler={searchHandler}></SearchForm>
          {isLoading && (
            <section className={classes.FlightsLoading}>
              <p>Loading...</p>
            </section>
          )}
          {httpError && (
            <section className={classes.FlightsError}>
              <p>{httpError}</p>
            </section>
          )}
          <MainFilter
            maxPriceFilter={maxPriceFilterHandler}
            airlineFilter={airlineFilterHandler}
          ></MainFilter>
          {flights.length !== 0 && (
            <div className={classes.FlightFilter}>
              <FlightList flights={flights}></FlightList>
            </div>
          )}
          {flights.length === 0 && (
            <div>
              <h2>No Flights</h2>
            </div>
          )}
        </div>
      )}
      {!isLoggedIn && (
        <div>
          <h2>Welcome to flight booking app!</h2>
          <p>Login to book a flight</p>
        </div>
      )}
    </section>
  );
};

export default StartingPageContent;
