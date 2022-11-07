package com.example.portalbackend.flight;

import java.time.LocalDate;

public class FlightSchedule {
    private final int id;
    private final String number;
    private final String company;
    private final int aCapacity;
    private final int aOccupancy;
    private final int aFare;
    private final int bCapacity;
    private final int bOccupancy;
    private final int bFare;
    private final int cCapacity;
    private final int cOccupancy;
    private final int cFare;
    private final int depart_airport_ID;
    private final LocalDate depart_date_time;
    private final int land_airport_ID;
    private final LocalDate land_date_time;

    public FlightSchedule(int id, String number, String company, int aCapacity, int aOccupancy, int aFare, int bCapacity, int bOccupancy, int bFare, int cCapacity, int cOccupancy, int cFare, int depart_airport_ID, LocalDate depart_date_time, int land_airport_ID, LocalDate land_date_time) {
        this.id = id;
        this.number = number;
        this.company = company;
        this.aCapacity = aCapacity;
        this.aOccupancy = aOccupancy;
        this.aFare = aFare;
        this.bCapacity = bCapacity;
        this.bOccupancy = bOccupancy;
        this.bFare = bFare;
        this.cCapacity = cCapacity;
        this.cOccupancy = cOccupancy;
        this.cFare = cFare;
        this.depart_airport_ID = depart_airport_ID;
        this.depart_date_time = depart_date_time;
        this.land_airport_ID = land_airport_ID;
        this.land_date_time = land_date_time;
    }

    public int getId() {
        return id;
    }

    public String getNumber() {
        return number;
    }

    public String getCompany() {
        return company;
    }

    public int getaCapacity() {
        return aCapacity;
    }

    public int getaOccupancy() {
        return aOccupancy;
    }

    public int getaFare() {
        return aFare;
    }

    public int getbCapacity() {
        return bCapacity;
    }

    public int getbOccupancy() {
        return bOccupancy;
    }

    public int getbFare() {
        return bFare;
    }

    public int getcCapacity() {
        return cCapacity;
    }

    public int getcOccupancy() {
        return cOccupancy;
    }

    public int getcFare() {
        return cFare;
    }

    public int getDepart_airport_ID() {
        return depart_airport_ID;
    }

    public LocalDate getDepart_date_time() {
        return depart_date_time;
    }

    public int getLand_airport_ID() {
        return land_airport_ID;
    }

    public LocalDate getLand_date_time() {
        return land_date_time;
    }
}
