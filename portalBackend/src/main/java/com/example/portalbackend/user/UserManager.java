package com.example.portalbackend.user;

import com.example.portalbackend.controllers.exceptions.UserNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class UserManager {
    Logger log = LoggerFactory.getLogger(UserManager.class);

    @Autowired
    private UserDAO userDAO;

    public void addUser(User newUser) throws SQLException {
        if (newUser.getFirstName().isEmpty() || newUser.getFirstName() == null) {
            throw new RuntimeException("\'First Name\' field should not be null or empty.");
        } else if (newUser.getLastName().isEmpty()) {
            throw new RuntimeException("\'Last Name\' field should not be null or empty");
        } else if (newUser.getContactNumber().isEmpty() || newUser.getContactNumber() == null) {
            throw new RuntimeException("\'Contact Number\' field should not be null or empty.");
        } else if (newUser.getEmail().isEmpty() || newUser.getEmail() == null) {
            throw new RuntimeException("\'Email\' field should not be null or empty.");
        } else if (newUser.getPassword().isEmpty() || newUser.getPassword() == null) {
            throw new RuntimeException("\'Password\' field should not be null or empty.");
        } else if (newUser.getLogin().isEmpty() || newUser.getLogin() == null) {
            throw new RuntimeException("\'Login\' field should not be null or empty.");
        }
        try {
            userDAO.addUser(newUser);
        } catch (SQLException e) {
            log.error("SQL exception. Ex message :" + e.getMessage());
            throw new RuntimeException("Internal Server Error. Try again later");
        }

    }

    public User getUser(String login) throws UserNotFoundException {
        if (login.isEmpty() || login == null) {
            throw new RuntimeException("\'login\' field should not be null or empty.");
        }
        try {
            User user = userDAO.getUser(login);
            if (user == null) {
                throw new UserNotFoundException("User with login :" + login + " is not found.");
            }
            return user;
        } catch (SQLException e) {
            throw new RuntimeException("Error in fetching user with login: " + login);
        }

    }

    public void updateUser(User newUser, String login) {
        if (login == null || login.isEmpty()) {
            throw new RuntimeException("\'login\' field should not be null or empty.");
        }
        try {
            userDAO.updateUser(newUser, login);
        }catch (SQLException e) {
            log.error("SQL exception. Ex message :" + e.getMessage());
            throw new RuntimeException("Internal Server Error. Try again later");
        }
    }

    public void deleteUser(String login) {
        if (login == null || login.isEmpty()) {
            throw new RuntimeException("\'login\' field can not be empty or null.");
        }
        try {
            userDAO.deleteUser(login);
        } catch (SQLException ex) {
            throw new RuntimeException("Error while deleting the user with login " + login + ".");
        }
    }
}
