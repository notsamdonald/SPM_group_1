package com.example.portalbackend.flight;

import com.example.portalbackend.controllers.response.ResponseMessageField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FlightManager {

    @Autowired
    private FlightDAO flightDAO;

    public int addFlight(Flight newFlight) {
        if (newFlight.getId() <= 0) {
            throw new RuntimeException("\'id\' field should be greater than zero and unique");
        } else if (newFlight.getNumber().isEmpty() || newFlight.getNumber() == null) {
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
        return flightDAO.addFlight(newFlight);
    }

    public Flight getFlight(String flightNumber) {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'number\' field should not be null or empty.");
        }
        return flightDAO.getFlight(flightNumber);
    }

    public ResponseMessageField updateFlight(String flightNumber, Flight updatedFlight) {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'flight number\' field should not be null or empty.");
        } else if (updatedFlight.getId() <= 0) {
            throw new RuntimeException("\'id\' field should be greater than zero and unique");
        } else if (updatedFlight.getNumber().isEmpty() || updatedFlight.getNumber() == null) {
            throw new RuntimeException("\'number\' field should not be null or empty.");
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
        return flightDAO.updateFlight(flightNumber, updatedFlight);
    }

    public ResponseMessageField deleteFlight(String flightNumber) {
        if (flightNumber.isEmpty() || flightNumber == null) {
            throw new RuntimeException("\'flight number\' field should not be null or empty.");
        }
        return flightDAO.deleteFlight(flightNumber);
    }
}
