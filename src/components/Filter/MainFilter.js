import { Fragment } from "react";
// import Card from "../UI/Card";

import classes from "./MainFilter.module.css";
import MaxPriceFilter from "./MaxpriceFilter";

const MainFilter = (props) => {
  return (
    <Fragment>
      <p>Filter:</p>
      <MaxPriceFilter maxPriceFilter={props.maxPriceFilter}></MaxPriceFilter>
      <button className={classes.collapsible}>Filter 2</button>
      <div className={classes.content}>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat.
        </p>
      </div>
      <button className={classes.collapsible}>Filter 3</button>
      <div className={classes.content}>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat.
        </p>
      </div>
    </Fragment>
  );
};

export default MainFilter;
