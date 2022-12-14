package com.example.portalbackend.controllers;

import com.example.portalbackend.common.Constants;
import com.example.portalbackend.controllers.exceptions.UserNotFoundException;
import com.example.portalbackend.controllers.response.ResponseMessageField;
import com.example.portalbackend.user.User;
import com.example.portalbackend.user.UserLoginField;
import com.example.portalbackend.user.UserManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "*")
public class UserController {
    private Logger log = LoggerFactory.getLogger(FlightController.class);

    @Autowired
    private UserManager userManager;

    @PostMapping("/addUser")
    public UserLoginField addUser(@RequestBody User newUser) throws SQLException {
        log.debug("Adding new User.");
        userManager.addUser(newUser);
        return new UserLoginField(newUser.getLogin());
    }

    @GetMapping("/getUser")
    public User getUser(@RequestParam("login") String login ) throws UserNotFoundException {
        log.debug("Getting User.");
        return userManager.getUser(login);
    }

    @PutMapping("/updateUser/{login}")
    public UserLoginField updateUser(@RequestBody User newUser, @PathVariable("login") String login) {
        userManager.updateUser(newUser, login);
        return new UserLoginField(login);
    }

    @DeleteMapping("/deleteUser/{login}")
    public ResponseMessageField deleteUser(@PathVariable("login") String login) {
        userManager.deleteUser(login);
        return new ResponseMessageField(Constants.deleteUserSuccessMessage);
    }
}
