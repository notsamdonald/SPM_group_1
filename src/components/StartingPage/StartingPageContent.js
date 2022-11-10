import { useContext, useState } from "react";
import FlightList from "../Flights/FlightList";
import AuthContext from "../../store/auth-context";
import classes from "./StartingPageContent.module.css";
import SearchForm from "../Search/SearchForm";

const StartingPageContent = () => {
  const authCtx = useContext(AuthContext);
  const isLoggedIn = authCtx.isLoggedIn;
  const [flights, setFlights] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [httpError, setHttpError] = useState();

  const fetchFlights = async () => {
    const response = await fetch(
      // "https://react-http-b53cd-default-rtdb.firebaseio.com/meals.json"
      "http://localhost:8080/flight/searchFlights",
      {
        method: "POST",
        body: {
          landAirportId: 10,
          departAirportId: 5,
          departDateTime: "2022-12-01",
          numberOfTravellers: 2,
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
      loadedFlights.push({
        id: key,
        // name: responseData[key].name,
        name: responseData[key].company,
        // description: responseData[key].description,
        departDateTime: responseData[key].depart_date_time,
        price: responseData[key].aFare,
        // price: responseData[key].company,
      });
    }

    setFlights(loadedFlights);
    // setFlights(DUMMY_FLIGHTS);
    setIsLoading(false);
  };

  const searchHandler = () => {
    fetchFlights().catch((error) => {
      setIsLoading(false);
      // setHttpError(error.message);
      setHttpError("DUMMY ERROR");
    });
  };

  const loadingDisplay = () => {
    <section className={classes.FlightsLoading}>
      <p>Loading...</p>
    </section>;
  };

  const errorDisplay = () => {
    return (
      <section className={classes.FlightsError}>
        <p>{httpError}</p>
      </section>
    );
  };

  return (
    <section className={classes.starting}>
      {isLoggedIn && (
        <div>
          <SearchForm searchHandler={searchHandler}></SearchForm>
          {isLoading && loadingDisplay}
          {httpError && errorDisplay}
          {<FlightList flights={flights}></FlightList>}
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
