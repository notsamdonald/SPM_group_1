import React from "react";
import Box from "@mui/material/Box";

import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import { TextField } from "@mui/material";
import Select, { SelectChangeEvent } from "@mui/material/Select";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import MenuItem from "@mui/material/MenuItem";
import Autocomplete from "@mui/material/Autocomplete";
import moment from "moment";

const airportList = [
  { code: "1", label: "ORD" },
  { code: "2", label: "DFW" },
  { code: "3", label: "JFK" },
  { code: "4", label: "LAX" },
  { code: "5", label: "SFO" },
  { code: "6", label: "CLT" },
  { code: "7", label: "MIA" },
  { code: "8", label: "AUK" },
  { code: "9", label: "SYD" },
  { code: "10", label: "LHR" },
  { code: "11", label: "CDG" },
  { code: "12", label: "FRA" },
];

const SearchForm = (props) => {
  const [dateValue, setValue] = React.useState(null);
  const [passengerCount, setPassengerCount] = React.useState(1);
  const [departureValue, setDepartureValue] = React.useState(null);
  const [arrivalValue, setArrivalValue] = React.useState(null);

  const handleChange = (event: SelectChangeEvent) => {
    setPassengerCount(event.target.value);
  };

  // useEffect(() => {
  //   props.fetchFlights().catch((error) => {
  //     setIsLoading(false);
  //     // setHttpError(error.message);
  //     setHttpError("DUMMY ERROR");
  //   });
  // }, []);

  const handleSubmit = (event) => {
    event.preventDefault();

    if (departureValue == null) {
      alert("Select Departure Airport");
      return;
    }
    if (arrivalValue == null) {
      alert("Select Arrival Airport");
      return;
    }
    if (departureValue.code === arrivalValue.code) {
      alert("Departure/Arrival Airport cannot be the same");
      return;
    }
    if (dateValue == null) {
      alert("Select Departure Date");
      return;
    }
    if (passengerCount > 7 || passengerCount < 1) {
      alert("Select Passenger Count");
      return;
    }

    props.searchHandler(
      departureValue,
      arrivalValue,
      dateValue.format("YYYY-MM-DD"),
      passengerCount
    );

    // let query = "http://localhost:8080/flight/searchFlights";
  };

  return (
    <div className="wrapper">
      <form onSubmit={handleSubmit}>
        {/* <Box sx={{ m: 0 }} backgroundColor="#6B4E71"> */}
        <Grid
          sx={{ px: 4, pb: 2, borderBottom: 1, borderColor: "#38015c" }}
          container
          spacing={2}
          backgroundColor="smoke"
        >
          <Grid item xs={3}>
            <h3>From</h3>
            <Autocomplete
              id="departure-airport-select"
              onChange={(event, newValue) => {
                setDepartureValue(newValue);
              }}
              sx={{ width: 300 }}
              options={airportList}
              autoHighlight
              getOptionLabel={(option) => option.label}
              renderOption={(props, option) => (
                <Box component="li" {...props}>
                  {option.label} ({option.code})
                </Box>
              )}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Choose an Airport"
                  inputProps={{
                    ...params.inputProps,
                    autoComplete: "new-password", // disable autocomplete and autofill
                  }}
                />
              )}
            />
          </Grid>

          <Grid item xs={3}>
            <h3>To</h3>
            <Autocomplete
              id="arrival-airport-select"
              onChange={(event, newValue) => {
                setArrivalValue(newValue);
              }}
              sx={{ width: 300 }}
              options={airportList}
              autoHighlight
              getOptionLabel={(option) => option.label}
              renderOption={(props, option) => (
                <Box component="li" {...props}>
                  {option.label} ({option.code})
                </Box>
              )}
              renderInput={(params) => (
                <TextField
                  {...params}
                  label="Choose an Airport"
                  inputProps={{
                    ...params.inputProps,
                    autoComplete: "new-password", // disable autocomplete and autofill
                  }}
                />
              )}
            />
          </Grid>

          <Grid item xs={3}>
            <h3>Departure</h3>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DatePicker
                // label="Departure Date"
                minDate={Date()}
                value={dateValue}
                onChange={(newValue) => {
                  setValue(newValue);
                }}
                renderInput={(params) => <TextField {...params} />}
              />
            </LocalizationProvider>
          </Grid>

          <Grid item xs={3}>
            <h3>Passengers</h3>
            <Box sx={{ minWidth: 120 }}>
              <Select
                defaultValue={1}
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={passengerCount}
                label="PassengerCount"
                onChange={handleChange}
              >
                <MenuItem value={1}>1</MenuItem>
                <MenuItem value={2}>2</MenuItem>
                <MenuItem value={3}>3</MenuItem>
                <MenuItem value={4}>4</MenuItem>
                <MenuItem value={5}>5</MenuItem>
                <MenuItem value={6}>6</MenuItem>
                <MenuItem value={7}>7</MenuItem>
              </Select>
            </Box>
          </Grid>
          {/* <Grid item xs={4}>
      <h3>Return</h3>
      <BasicDatePicker></BasicDatePicker>
    </Grid> */}
          <Grid item xs={12}>
            <Button type="submit" variant="contained" color="success">
              Search Flight
            </Button>
          </Grid>
        </Grid>
        {/* </Box> */}
      </form>
      {}
    </div>
  );
};

export default SearchForm;
