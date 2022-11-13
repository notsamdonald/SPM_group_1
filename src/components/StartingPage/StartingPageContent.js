import { useContext, useState } from "react";
import FlightList from "../Flights/FlightList";
import AuthContext from "../../store/auth-context";
import classes from "./StartingPageContent.module.css";
import SearchForm from "../Search/SearchForm";
import MainFilter from "../Filter/MainFilter";

function padTo2Digits(num) {
  return num.toString().padStart(2, "0");
}

function convertMsToHM(milliseconds) {
  let seconds = Math.floor(milliseconds / 1000);
  let minutes = Math.floor(seconds / 60);
  let hours = Math.floor(minutes / 60);

  seconds = seconds % 60;
  // 👇️ if seconds are greater than 30, round minutes up (optional)
  minutes = seconds >= 30 ? minutes + 1 : minutes;

  minutes = minutes % 60;

  // 👇️ If you don't want to roll hours over, e.g. 24 to 00
  // 👇️ comment (or remove) the line below
  // commenting next line gets you `24:00:00` instead of `00:00:00`
  // or `36:15:31` instead of `12:15:31`, etc.
  hours = hours % 24;

  return `${padTo2Digits(hours)} hours, ${padTo2Digits(minutes)} minutes`;
}

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
      const duration = convertMsToHM(
        Math.abs(
          new Date(responseData[key].depart_date_time.replace("T", " ")) -
            new Date(responseData[key].land_date_time.replace("T", " "))
        )
      );

      loadedFlights.push({
        id: key,
        // name: responseData[key].name,
        name: responseData[key].company,
        // description: responseData[key].description,
        departDateTime: responseData[key].depart_date_time.split("T")[1],
        price: responseData[key].aFare * passengerCount,
        from: departureValue.label,
        to: arrivalValue.label,
        passengers: passengerCount,
        duration: duration,

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
          <MainFilter maxPriceFilter={maxPriceFilterHandler}></MainFilter>
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
