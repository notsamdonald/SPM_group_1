package com.example.portalbackend.user;

import com.example.portalbackend.database.JDBCConnectionManager;
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

    private final String SQL_ADD_NEW_USER = "INSERT INTO user (first_name, last_name, contact_number, email, password, login)" +
            " VALUES (?, ?, ?, ?, ?, ?)";

    private final String SQL_GET_USER = "SELECT id,first_name, last_name, contact_number, email, password, login FROM USER WHERE login=?";

    private final String SQL_UPDATE_USER = "UPDATE user SET first_name=?, last_name=?, contact_number=?, " +
            "email=?, password=?" +
            " WHERE login=?";

    private final String SQL_DELETE_USER = "DELETE FROM user WHERE login=?";

    public void addUser(User newUser) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();
            try {
                PreparedStatement preparedStatement = conn.prepareStatement(SQL_ADD_NEW_USER);
                preparedStatement.setString(1, newUser.getFirstName());
                preparedStatement.setString(2, newUser.getLastName());
                preparedStatement.setString(3, newUser.getContactNumber());
                preparedStatement.setString(4, newUser.getEmail());
                preparedStatement.setString(5, newUser.getPassword());
                preparedStatement.setString(6, newUser.getLogin());
                preparedStatement.execute();
            } catch (SQLException ex) {
                log.error("Error in adding new user. Duplicate login found" + ex.getMessage());
                throw new RuntimeException("Add User \'" + newUser.getLogin() + "\' is not available." +
                        " Try a different login.");
            }
        } catch (SQLException e) {
            log.error("Error in adding new user: " + e.getMessage());
            throw new RuntimeException("Error in adding new user. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public User getUser(String login) throws SQLException {
        User user = null;
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();
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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public void updateUser(User newUser, String login) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SQL_UPDATE_USER);
            preparedStatement.setString(1, newUser.getFirstName());
            preparedStatement.setString(2, newUser.getLastName());
            preparedStatement.setString(3, newUser.getContactNumber());
            preparedStatement.setString(4, newUser.getEmail());
            preparedStatement.setString(5, newUser.getPassword());
            preparedStatement.setString(6, login);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            log.error("Error in updating the user : " + e.getMessage());
            throw new RuntimeException("Error updating the user. Try again later.");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteUser(String login) throws SQLException {
        Connection conn = null;
        try {
            conn = connectionManager.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SQL_DELETE_USER);
            preparedStatement.setString(1, login);
            preparedStatement.execute();
        } catch (SQLException e) {
            log.error("Error while deleting the user with login " + login + ". Exception : " + e.getMessage());
            throw new RuntimeException("Error while deleting the user with login " + login + ".");
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
}
