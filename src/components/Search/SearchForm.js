import React from "react";
import BasicDatePicker from "./datePicker";
import AirportSelect from "./airportSelect";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import BasicSelect from "./select";
const handleSubmit = (event) => {
  event.preventDefault();
  alert("You have submitted the form.");
};

class SearchForm extends React.Component {
  render() {
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
              <AirportSelect></AirportSelect>
            </Grid>
            <Grid item xs={3}>
              <h3>To</h3>
              <AirportSelect></AirportSelect>
            </Grid>
            {/* <Grid item xs={4} sx={{ mt: 5 }}>
                <IsReturnFlight></IsReturnFlight>
              </Grid> */}
            <Grid item xs={3}>
              <h3>Departure</h3>
              <BasicDatePicker></BasicDatePicker>
              {/* <BasicSelect></BasicSelect> */}
            </Grid>
            <Grid item xs={3}>
              <h3>Passengers</h3>
              <BasicSelect></BasicSelect>
            </Grid>
            {/* <Grid item xs={4}>
                <h3>Return</h3>
                <BasicDatePicker></BasicDatePicker>
              </Grid> */}
            <Grid item xs={12}>
              <Button variant="contained" color="success">
                Search Flight
              </Button>
            </Grid>
          </Grid>
          {/* </Box> */}
        </form>
      </div>
    );
  }
}

export default SearchForm;
