package com.example.portalbackend.flight;

import java.time.LocalDate;

public class SearchFlightRequest {
    private final int landAirportId;
    private final int departAirportId;
    private final LocalDate departDateTime;
    private final int numberOfTravellers;

    public SearchFlightRequest(int landAirportId, int departAirportId, LocalDate departDateTime, int numberOfTravellers) {
        this.landAirportId = landAirportId;
        this.departAirportId = departAirportId;
        this.departDateTime = departDateTime;
        this.numberOfTravellers = numberOfTravellers;
    }

    public int getLandAirportId() {
        return landAirportId;
    }

    public int getDepartAirportId() {
        return departAirportId;
    }

    public LocalDate getDepartDateTime() {
        return departDateTime;
    }

    public int getNumberOfTravellers() {
        return numberOfTravellers;
    }
}
