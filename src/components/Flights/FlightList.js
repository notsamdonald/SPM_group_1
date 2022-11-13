// import { useEffect, useState } from "react";

import Card from "../UI/Card";

import Flight from "./Flight";
import classes from "./FlightList.module.css";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import Button from "../UI/Button";
import { DataGrid } from "@mui/x-data-grid";

const columns = [
  { field: "name", headerName: "Airline", flex: 1 },
  {
    field: "from",
    headerName: "Departure",
    headerAlign: "center",
    align: "center",
    flex: 1,
  },
  {
    field: "to",
    headerName: "Arrival",
    headerAlign: "center",
    align: "center",
    flex: 1,
  },
  {
    field: "departDateTime",
    headerName: "Departure Date",
    headerAlign: "center",
    align: "center",
    flex: 1,
  },
  {
    field: "passengers",
    headerName: "Passengers",
    headerAlign: "center",
    align: "center",
    flex: 1,
  },
  {
    field: "price",
    headerName: "Total Price ($)",
    headerAlign: "center",
    align: "center",
    flex: 1,
  },
  {
    field: "action",
    headerName: "",
    sortable: false,
    renderCell: (params) => {
      return <Button>Select Flight</Button>;
    },
    width: 150,
  },
];

const DUMMY_FLIGHTS = [
  {
    departDateTime: "2022-12-01",
    from: "SFO",
    id: "0",
    name: "Brother Airlines",
    passengers: 1,
    price: 123,
    to: "LHR",
  },
  {
    departDateTime: "2022-12-01",
    from: "SFO",
    id: "1",
    name: "Some Airlines",
    passengers: 1,
    price: 111,
    to: "LHR",
  },
  {
    departDateTime: "2022-12-01",
    from: "SFO",
    id: "2",
    name: "Delta Plus",
    passengers: 1,
    price: 232,
    to: "LHR",
  },
  // {
  //   id: "1",
  //   name: "US Airways",
  //   time: "8:30 PM - 11:00 PM",
  //   price: 22.99,
  // },
  // {
  //   id: "2",
  //   name: "Emirates",
  //   time: "4:30 PM - 9:00 PM",
  //   price: 16.5,
  // },
  // {
  //   id: "3",
  //   name: "British Airways",
  //   time: "6:30 AM - 11:00 AM",
  //   price: 12.99,
  // },
  // {
  //   id: "4",
  //   name: "Air India",
  //   time: "12:30 PM - 2:00 PM",
  //   price: 18.99,
  // },
];

const FlightList = (props) => {
  // const [flights, setFlights] = useState([]);
  // const [isLoading, setIsLoading] = useState(true);
  // const [httpError, setHttpError] = useState();

  // useEffect(() => {
  //   const fetchFlights = async () => {
  //     const response = await fetch(
  //       // "https://react-http-b53cd-default-rtdb.firebaseio.com/meals.json"
  //       "http://localhost:8080/flight/getAllFlights"
  //       // {
  //       //   mode: "no-cors",
  //       // }
  //     );

  //     console.log(response);
  //     if (!response.ok) {
  //       throw new Error("Something went wrong!");
  //     }
  //     const responseData = await response.json();
  //     // const responseData = response;
  //     // console.log(responseData);
  //     const loadedFlights = [];
  //     for (const key in responseData) {
  //       loadedFlights.push({
  //         id: key,
  //         // name: responseData[key].name,
  //         name: responseData[key].company,
  //         // description: responseData[key].description,
  //         departDateTime: responseData[key].depart_date_time,
  //         price: responseData[key].aFare,
  //         // price: responseData[key].company,
  //       });
  //     }

  //     setFlights(loadedFlights);
  //     // setFlights(DUMMY_FLIGHTS);
  //     setIsLoading(false);
  //   };
  //   fetchFlights().catch((error) => {
  //     setIsLoading(false);
  //     // setHttpError(error.message);
  //     setHttpError("DUMMY ERROR");
  //   });
  // }, []);

  // if (isLoading) {
  //   return (
  //     <section className={classes.FlightsLoading}>
  //       <p>Loading...</p>
  //     </section>
  //   );
  // }

  // if (httpError) {
  //   return (
  //     <section className={classes.FlightsError}>
  //       <p>{httpError}</p>
  //     </section>
  //   );
  // }

  const flightsList = props.flights.map((flight) => (
    <Flight
      key={flight.id}
      id={flight.id}
      name={flight.name}
      departDateTime={flight.departDateTime}
      price={flight.price}
    />
  ));

  return (
    <section sx={{ minHeight: 950 }} className={classes.flights}>
      {/* <Card>
        <ul>{flightsList}</ul>
      </Card> */}

      <DataGrid
        // sx={{ minHeight: 500 }}
        rows={props.flights}
        columns={columns}
        autoHeight
      />
    </section>
  );
};

export default FlightList;
