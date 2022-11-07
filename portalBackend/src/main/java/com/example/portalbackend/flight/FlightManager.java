package com.example.portalbackend.flight;

import com.example.portalbackend.controllers.exceptions.FlightNotFoundException;
import com.example.portalbackend.controllers.response.ResponseMessageField;
import com.example.portalbackend.user.UserManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.util.List;

@Component
public class FlightManager {
    Logger log = LoggerFactory.getLogger(FlightManager.class);

    @Autowired
    private FlightDAO flightDAO;

    public void addFlight(Flight newFlight) throws SQLException {
        if (newFlight.getNumber().isEmpty() || newFlight.getNumber() == null) {
            throw new RuntimeException("\'number\' field should not be null or empty.");
        } else if (newFlight.getCompany().isEmpty()) {
            throw new RuntimeException("\'company\' field should not be null or empty");
        } else if (newFlight.getaCapacity() <= 0) {
            throw new RuntimeException("\'ACapacity\' field should be greater than zero");
        } else if (newFlight.getaOccupancy() <= 0) {
            throw new RuntimeException("\'AOccupancy\' field should greater than zero");
        } else if (newFlight.getaFare() <= 0) {
            throw new RuntimeException("\'AFare\' field should greater than zero");
        }else if (newFlight.getbCapacity() <= 0) {
            throw new RuntimeException("\'BCapacity\' field should be greater than zero");
        } else if (newFlight.getbOccupancy() <= 0) {
            throw new RuntimeException("\'BOccupancy\' field should greater than zero");
        } else if (newFlight.getbFare() <= 0) {
            throw new RuntimeException("\'BFare\' field should greater than zero");
        } else if (newFlight.getcCapacity() <= 0) {
            throw new RuntimeException("\'CCapacity\' field should be greater than zero");
        } else if (newFlight.getcOccupancy() <= 0) {
            throw new RuntimeException("\'COccupancy\' field should greater than zero");
        } else if (newFlight.getcFare() <= 0) {
            throw new RuntimeException("\'CFare\' field should greater than zero");
        }
        try {
            flightDAO.addFlight(newFlight);
        } catch (SQLException e) {
            log.error("SQL exception. Ex message :" + e.getMessage());
            throw new RuntimeException("Internal Server Error. Try again later");
        }

    }

    public Flight getFlight(String flightNumber) throws FlightNotFoundException {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'number\' field should not be null or empty.");
        }
        try {
            Flight flight =  flightDAO.getFlight(flightNumber);
            if (flight == null) {
                throw new FlightNotFoundException("Flight with number: " + flightNumber + " not found.");
            }
            return flight;
        } catch (SQLException e) {
            throw new RuntimeException("Error in fetching flight with number: " + flightNumber);
        }
    }

    public void updateFlight(String flightNumber, Flight updatedFlight) throws SQLException {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'flight number\' field should not be null or empty.");
        } else if (updatedFlight.getCompany().isEmpty()) {
            throw new RuntimeException("\'company\' field should not be null or empty");
        } else if (updatedFlight.getaCapacity() <= 0) {
            throw new RuntimeException("\'ACapacity\' field should be greater than zero");
        } else if (updatedFlight.getaOccupancy() <= 0) {
            throw new RuntimeException("\'AOccupancy\' field should greater than zero");
        } else if (updatedFlight.getaFare() <= 0) {
            throw new RuntimeException("\'AFare\' field should greater than zero");
        }else if (updatedFlight.getbCapacity() <= 0) {
            throw new RuntimeException("\'BCapacity\' field should be greater than zero");
        } else if (updatedFlight.getbOccupancy() <= 0) {
            throw new RuntimeException("\'BOccupancy\' field should greater than zero");
        } else if (updatedFlight.getbFare() <= 0) {
            throw new RuntimeException("\'BFare\' field should greater than zero");
        } else if (updatedFlight.getcCapacity() <= 0) {
            throw new RuntimeException("\'CCapacity\' field should be greater than zero");
        } else if (updatedFlight.getcOccupancy() <= 0) {
            throw new RuntimeException("\'COccupancy\' field should greater than zero");
        } else if (updatedFlight.getcFare() <= 0) {
            throw new RuntimeException("\'CFare\' field should greater than zero");
        }
        try {
            flightDAO.updateFlight(flightNumber, updatedFlight);
        } catch (SQLException e) {
            log.error("SQL exception. Ex message :" + e.getMessage());
            throw new RuntimeException("Internal Server Error. Try again later");
        }

    }

    public void deleteFlight(String flightNumber) throws SQLException {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'flight number\' field should not be null or empty.");
        }
        try {
            flightDAO.deleteFlight(flightNumber);
        } catch (SQLException e) {
            throw new RuntimeException("Error while deleting the flight with number " + flightNumber + ".");
        }
    }

    public List<FlightSchedule> getAllFlights() throws SQLException {
        try {
            List<FlightSchedule> allFlights =  flightDAO.getAllFlights();
            return allFlights;
        } catch (SQLException e) {
            throw new RuntimeException("Error in fetching all flights");
        }
    }

    public List<FlightSchedule> searchFlights(SearchFlightRequest searchFlightRequest) throws SQLException {
        try {
            List<FlightSchedule> flights =  flightDAO.searchFlights(searchFlightRequest);
            return flights;
        } catch (SQLException e) {
            throw new RuntimeException("Error in fetching flights based on search parameters");
        }
    }
}
