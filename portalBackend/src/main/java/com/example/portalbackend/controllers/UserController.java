package com.example.portalbackend.controllers;

import com.example.portalbackend.user.User;
import com.example.portalbackend.user.UserLoginField;
import com.example.portalbackend.user.UserManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    private Logger log = LoggerFactory.getLogger(FlightController.class);

    @Autowired
    private UserManager userManager;

    @PostMapping("/addUser")
    public UserLoginField addUser(@RequestBody User newUser) {
        log.debug("Adding new User.");
        userManager.addUser(newUser);
        return new UserLoginField(newUser.getLogin());
    }

    @GetMapping("/getUser")
    public User getUser(@RequestParam("login") String login ) {
        log.debug("Getting User.");
        User user = userManager.getUser(login);
        return user;
    }
}
