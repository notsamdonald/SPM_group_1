import classes from "./FlightItem.module.css";
import Button from "../UI/Button";

const Flight = (props) => {
  const price = `$${props.price.toFixed(2)}`;

  const selectFlightHandler = () => {};

  return (
    <li className={classes.flight}>
      <div className={classes.flightDetails}>
        <h3>{props.name}</h3>
        <div className={classes.time}>{props.time}</div>
        <div className={classes.price}>{price}</div>
      </div>
      <div>
        <Button onClick={selectFlightHandler}>Select Flight</Button>
      </div>
    </li>
  );
};

export default Flight;
