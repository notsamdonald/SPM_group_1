package com.example.portalbackend.controllers;

import com.example.portalbackend.common.Constants;
import com.example.portalbackend.controllers.exceptions.FlightNotFoundException;
import com.example.portalbackend.controllers.response.ResponseMessageField;
import com.example.portalbackend.flight.Flight;
import com.example.portalbackend.flight.FlightManager;
import com.example.portalbackend.flight.FlightNumberField;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

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
}
