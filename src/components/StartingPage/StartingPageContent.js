import { useContext } from "react";
import FlightList from "../Flights/FlightList";
import AuthContext from "../../store/auth-context";
import classes from "./StartingPageContent.module.css";
import SearchForm from "../Search/SearchForm";

const StartingPageContent = () => {
  const authCtx = useContext(AuthContext);
  const isLoggedIn = authCtx.isLoggedIn;
  return (
    <section className={classes.starting}>
      {isLoggedIn && (
        <div>
          <SearchForm></SearchForm> <FlightList />
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
