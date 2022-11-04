package com.example.portalbackend.controllers.exceptions;

public class FlightNotFoundException extends Exception {
    public FlightNotFoundException(String message) {
        super(message);
    }
}
