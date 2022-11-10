import { Fragment, useRef, useState } from "react";
import classes from "./MainFilter.module.css";
// import Card from "../UI/Card";
import Input from "../UI/Input";
// import Button from "../UI/Button";
import Button from "@mui/material/Button";

const MaxPriceFilter = (props) => {
  const maxPriceInputRef = useRef();
  const [showFilter, setShowFilter] = useState(false);

  const collapseButtonHandler = () => {
    setShowFilter(!showFilter);
  };

  console.log(showFilter);

  const submitFilterHandler = () => {
    props.maxPriceFilter(maxPriceInputRef.current.value);
  };

  return (
    <Fragment>
      <button className={classes.collapsible} onClick={collapseButtonHandler}>
        Max Price Filter
      </button>
      {showFilter && (
        <div>
          <Input
            ref={maxPriceInputRef}
            label="Maximum price"
            input={{
              id: "maxPrice",
              type: "number",
            }}
          />
          <Button
            type="submit"
            variant="contained"
            color="success"
            onClick={submitFilterHandler}
          >
            Filter
          </Button>
        </div>
      )}

      {/* <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat.
        </p> */}
    </Fragment>
  );
};

export default MaxPriceFilter;
