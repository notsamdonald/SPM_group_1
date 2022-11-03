package com.example.portalbackend.user;

import com.example.portalbackend.database.JDBCConnectionManager;
import com.example.portalbackend.flight.Flight;
import com.example.portalbackend.flight.FlightDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class UserDAO {

    private Logger log = LoggerFactory.getLogger(FlightDAO.class);

    @Autowired
    public JDBCConnectionManager connectionManager;

    private final String SQL_ADD_NEW_USER = "INSERT INTO USER (id, first_name, last_name, contact_number, email, password, login)" +
            " VALUES (?, ?, ?, ?, ?, ?, ?)";

    private final String SQL_GET_USER = "SELECT * FROM USER WHERE login=?";

    public void addUser(User newUser) {
        try {
            Connection conn = connectionManager.getConnection();

            try {
                PreparedStatement preparedStatement = conn.prepareStatement(SQL_ADD_NEW_USER);
                preparedStatement.setInt(1, newUser.getId());
                preparedStatement.setString(2, newUser.getFirstName());
                preparedStatement.setString(3, newUser.getLastName());
                preparedStatement.setString(4, newUser.getContactNumber());
                preparedStatement.setString(5, newUser.getEmail());
                preparedStatement.setString(6, newUser.getPassword());
                preparedStatement.setString(7, newUser.getLogin());
                preparedStatement.execute();
            } catch (SQLException ex) {
                log.error("Error in adding new user. Duplicate login found" + ex.getMessage());
                throw new RuntimeException("Add User \'" + newUser.getLogin() + "\' is not available." +
                        " Try a different login.");
            }
        } catch (SQLException e) {
            log.error("Error in adding new user: " + e.getMessage());
            throw new RuntimeException("Error in adding new user. Try again later.");
        }
    }

    public User getUser(String login) {
        User user = null;
        try {
            Connection conn = connectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL_GET_USER);
            ps.setString(1, login);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String firstName = resultSet.getString(2);
                String lastName = resultSet.getString(3);
                String contactNumber = resultSet.getString(4);
                String email = resultSet.getString(5);
                String password = resultSet.getString(6);

                user = new User(id,firstName,lastName,contactNumber,email,password,login);
            }
        } catch (SQLException e) {
            log.error("Error in getting the user information : " + e.getMessage());
            throw new RuntimeException("Error in getting the user. Try again later.");
        }
        return user;
    }
}
