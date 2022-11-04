package com.example.portalbackend.user;

public class User {

    private final int id;
    private final String firstName;
    private final String lastName;
    private final String contactNumber;
    private final String email;
    private final String password;
    private final String login;

    public int getId() {
        return id;
    }

    public User(int id, String firstName, String lastName, String contactNumber, String email, String password, String login) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contactNumber = contactNumber;
        this.email = email;
        this.password = password;
        this.login = login;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getLogin() {
        return login;
    }
}
