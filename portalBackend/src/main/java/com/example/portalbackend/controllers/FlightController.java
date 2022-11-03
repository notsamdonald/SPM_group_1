package com.example.portalbackend.controllers;

import com.example.portalbackend.controllers.response.ResponseMessageField;
import com.example.portalbackend.flight.Flight;
import com.example.portalbackend.flight.FlightIdField;
import com.example.portalbackend.flight.FlightManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/flight")
public class FlightController {
    private Logger log = LoggerFactory.getLogger(FlightController.class);

    @Autowired
    private FlightManager flightManager;

    @PostMapping("/addFlight")
    public FlightIdField addFlight(@RequestBody Flight newFlight) {
        log.debug("Adding new flight.");
        int flightId = flightManager.addFlight(newFlight);
        return new FlightIdField(flightId);
    }

    @GetMapping("/getFlight")
    public Flight getFlight(@RequestParam("number") String flightNumber ) {
        log.debug("Getting flight.");
        Flight flight = flightManager.getFlight(flightNumber);
        return flight;
    }

    @PutMapping("/updateFlight/{number}")
    public ResponseMessageField updateFlight(@PathVariable("number") String flightNumber, @RequestBody Flight updatedFlight) {
        log.debug("Updating flight.");
        ResponseMessageField resp = flightManager.updateFlight(flightNumber,updatedFlight);
        return resp;
    }

    @DeleteMapping("/deleteFlight/{number}")
    public ResponseMessageField deleteFlight(@PathVariable("number") String flightNumber) {
        log.debug("Deleting flight.");
        ResponseMessageField resp = flightManager.deleteFlight(flightNumber);
        return resp;
    }
}
