package com.example.portalbackend.flight;

public class Flight {
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

    public Flight(int id, String number, String company, int aCapacity, int aOccupancy, int aFare, int bCapacity, int bOccupancy, int bFare, int cCapacity, int cOccupancy, int cFare) {
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
}
