package com.example.portalbackend.flight;

import com.example.portalbackend.common.Constants;
import com.example.portalbackend.controllers.response.ResponseMessageField;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.example.portalbackend.database.JDBCConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class FlightDAO {
    private Logger log = LoggerFactory.getLogger(FlightDAO.class);

    @Autowired
    public JDBCConnectionManager connectionManager;

    private final String SQL_ADD_NEW_FLIGHT = "INSERT INTO FLIGHT (number, company, A_capacity, A_occupancy, A_fare, B_capacity, B_occupancy, B_fare, C_capacity, C_occupancy, C_fare)" +
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_UPDATE_FLIGHT = "UPDATE FLIGHT SET company=?, A_capacity=?, A_occupancy=?, A_fare=?, B_capacity=?, B_occupancy=?, B_fare=?, C_capacity=?, C_occupancy=?, C_fare=?" +
            " WHERE number=?";

    private final String SQL_DELETE_FLIGHT = "DELETE FROM FLIGHT WHERE number=?";

    private final String SQL_FLIGHT_ID_BY_NUMBER = "SELECT id FROM FLIGHT WHERE NUMBER = ?";
    private final String SQL_FLIGHT_BY_NUMBER = "SELECT * FROM FLIGHT WHERE NUMBER = ?";

    public void addFlight(Flight newFlight) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();

            try {
                PreparedStatement preparedStatement = conn.prepareStatement(SQL_ADD_NEW_FLIGHT);
                preparedStatement.setString(1, newFlight.getNumber());
                preparedStatement.setString(2, newFlight.getCompany());
                preparedStatement.setInt(3, newFlight.getaCapacity());
                preparedStatement.setInt(4, newFlight.getaOccupancy());
                preparedStatement.setInt(5, newFlight.getaFare());
                preparedStatement.setInt(6, newFlight.getbCapacity());
                preparedStatement.setInt(7, newFlight.getbOccupancy());
                preparedStatement.setInt(8, newFlight.getbFare());
                preparedStatement.setInt(9, newFlight.getcCapacity());
                preparedStatement.setInt(10, newFlight.getcOccupancy());
                preparedStatement.setInt(11, newFlight.getcFare());
                preparedStatement.execute();
            } catch (SQLException ex) {
                log.error("Error in adding new flight. Duplicate flight found" + ex.getMessage());
                throw new RuntimeException("Add Flight \'" + newFlight.getNumber() + "\' is not available." +
                        " Try a different flight.");
            }
        } catch (SQLException e) {
            log.error("Error in adding the new flight information : " + e.getMessage());
            throw new RuntimeException("Error in adding new flight. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public Flight getFlight(String flightNumber) throws SQLException {
        Flight flight = null;
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL_FLIGHT_BY_NUMBER);
            ps.setString(1, flightNumber);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String number = resultSet.getString(2);
                String company = resultSet.getString(3);
                int aCapacity = resultSet.getInt(4);
                int aOccupancy = resultSet.getInt(5);
                int aFare = resultSet.getInt(6);
                int bCapacity = resultSet.getInt(7);
                int bOccupancy = resultSet.getInt(8);
                int bFare = resultSet.getInt(9);
                int cCapacity = resultSet.getInt(10);
                int cOccupancy = resultSet.getInt(11);
                int cFare = resultSet.getInt(12);

                flight = new Flight(number,company,aCapacity,aOccupancy,aFare,bCapacity,bOccupancy,bFare,cCapacity,cOccupancy,cFare);
                flight.setId(id);
            }
        } catch (SQLException e) {
            log.error("Error in getting the flight information : " + e.getMessage());
            throw new RuntimeException("Error in getting the flight. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return flight;
    }

    public void updateFlight(String flightNumber, Flight newFlight) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();

            try {
                PreparedStatement preparedStatement = conn.prepareStatement(SQL_UPDATE_FLIGHT);
                preparedStatement.setString(1, newFlight.getCompany());
                preparedStatement.setInt(2, newFlight.getaCapacity());
                preparedStatement.setInt(3, newFlight.getaOccupancy());
                preparedStatement.setInt(4, newFlight.getaFare());
                preparedStatement.setInt(5, newFlight.getbCapacity());
                preparedStatement.setInt(6, newFlight.getbOccupancy());
                preparedStatement.setInt(7, newFlight.getbFare());
                preparedStatement.setInt(8, newFlight.getcCapacity());
                preparedStatement.setInt(9, newFlight.getcOccupancy());
                preparedStatement.setInt(10, newFlight.getcFare());
                preparedStatement.setString(11, flightNumber);
                preparedStatement.execute();
            } catch (SQLException ex) {
                log.error("Error in updating flight" + ex.getMessage());
                throw new RuntimeException("Update Flight \'" + flightNumber + "\' is not found.");
            }
        } catch (SQLException e) {
            log.error("Error in updating the flight information : " + e.getMessage());
            throw new RuntimeException("Error in updating flight. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteFlight(String flightNumber) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();

            try {
                PreparedStatement preparedStatement = conn.prepareStatement(SQL_DELETE_FLIGHT);
                preparedStatement.setString(1, flightNumber);
                preparedStatement.execute();
            } catch (SQLException ex) {
                log.error("Error in deleting flight" + ex.getMessage());
                throw new RuntimeException("Delete Flight \'" + flightNumber + "\' is not found.");
            }
        } catch (SQLException e) {
            log.error("Error in deleting the flight information : " + e.getMessage());
            throw new RuntimeException("Error in updating flight. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
}
