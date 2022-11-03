package com.example.portalbackend.user;

import com.example.portalbackend.flight.Flight;
import com.example.portalbackend.flight.FlightDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserManager {

    @Autowired
    private UserDAO userDAO;

    public void addUser(User newUser) {
        if (newUser.getId() <= 0) {
            throw new RuntimeException("\'id\' field should be greater than zero and unique");
        } else if (newUser.getFirstName().isEmpty() || newUser.getFirstName() == null) {
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
        userDAO.addUser(newUser);
    }

    public User getUser(String login) {
        if (login.isEmpty() || login == null) {
            throw new RuntimeException("\'login\' field should not be null or empty.");
        }
        return userDAO.getUser(login);
    }
}
