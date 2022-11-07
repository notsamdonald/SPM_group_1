package com.example.portalbackend.controllers;

import com.example.portalbackend.common.Constants;
import com.example.portalbackend.controllers.exceptions.FlightNotFoundException;
import com.example.portalbackend.controllers.response.ResponseMessageField;
import com.example.portalbackend.flight.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/flight")
public class FlightController {
    private Logger log = LoggerFactory.getLogger(FlightController.class);

    @Autowired
    private FlightManager flightManager;

    @PostMapping("/addFlight")
    public FlightNumberField addFlight(@RequestBody Flight newFlight) throws SQLException {
        log.debug("Adding new flight.");
        flightManager.addFlight(newFlight);
        return new FlightNumberField(newFlight.getNumber());
    }

    @GetMapping("/getFlight")
    public Flight getFlight(@RequestParam("number") String flightNumber ) throws FlightNotFoundException {
        log.debug("Getting flight.");
        Flight flight = flightManager.getFlight(flightNumber);
        return flight;
    }

    @PutMapping("/updateFlight/{number}")
    public ResponseMessageField updateFlight(@PathVariable("number") String flightNumber, @RequestBody Flight updatedFlight) throws SQLException {
        log.debug("Updating flight.");
        flightManager.updateFlight(flightNumber,updatedFlight);
        return new ResponseMessageField(Constants.updateFlightSuccessMessage);
    }

    @DeleteMapping("/deleteFlight/{number}")
    public ResponseMessageField deleteFlight(@PathVariable("number") String flightNumber) throws SQLException {
        log.debug("Deleting flight.");
        flightManager.deleteFlight(flightNumber);
        return new ResponseMessageField(Constants.deleteFlightSuccessMessage);
    }

    @GetMapping("/getAllFlights")
    public List<FlightSchedule> getAllFlights() throws SQLException {
        log.debug("Getting all flights.");
        List<FlightSchedule> allFlights = flightManager.getAllFlights();
        return allFlights;
    }

    @GetMapping("/searchFlights")
    public List<FlightSchedule> searchFlights(@RequestBody SearchFlightRequest searchFlightRequest) throws SQLException {
        log.debug("Searching flights.");
        List<FlightSchedule> flights = flightManager.searchFlights(searchFlightRequest);
        return flights;
    }
}
