import React, { Fragment, useRef, useState } from "react";
import classes from "./MainFilter.module.css";
// import Card from "../UI/Card";
import Input from "../UI/Input";
// import Button from "../UI/Button";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import { TextField } from "@mui/material";
import Autocomplete from "@mui/material/Autocomplete";

const airlineList = [
  { label: "Frontier Airlines" },
  { label: "British Airways" },
  { label: "Air France" },
  { label: "United Airlines" },
  { label: "Air New Zealand" },
  { label: "Virgin America" },
  { label: "Southwest Airlines" },
  { label: "American Airlines" },
  { label: "Delta Airlines" },
  { label: "Alaska Airlines" },
];

const AirlineFilter = (props) => {
  // const AirlineInputRef = useRef();
  const [showFilter, setShowFilter] = useState(false);
  const [selectedAirline, setSelectedAirline] = useState();

  //   let airlineCurrent = "";

  //   const airlineChange = (val) => {
  //     airlineCurrent = val;
  //     console.log(airlineCurrent);
  //     // AirlineInputRef.current = val;
  //   };
  const collapseButtonHandler = () => {
    setShowFilter(!showFilter);
  };

  console.log(showFilter);

  const submitFilterHandler = (event) => {
    event.preventDefault();
    // props.airlineFilter(airlineCurrent.label);
    props.airlineFilter(selectedAirline);
  };

  return (
    <Fragment>
      <button className={classes.collapsible} onClick={collapseButtonHandler}>
        Airline Filter
      </button>
      {showFilter && (
        <div>
          <Autocomplete
            id="departure-airline-select"
            onChange={(event, newValue) => {
              //   airlineChange(newValue);
              setSelectedAirline(newValue.label);
            }}
            sx={{ width: 300 }}
            options={airlineList}
            autoHighlight
            getOptionLabel={(option) => option.label}
            renderOption={(props, option) => (
              <Box component="li" {...props}>
                {option.label}
              </Box>
            )}
            renderInput={(params) => (
              <TextField
                {...params}
                label="Choose an Airline"
                inputProps={{
                  ...params.inputProps,
                  autoComplete: "new-password", // disable autocomplete and autofill
                }}
              />
            )}
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

export default AirlineFilter;
