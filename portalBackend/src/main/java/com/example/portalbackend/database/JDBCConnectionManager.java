package com.example.portalbackend.database;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Component
public class JDBCConnectionManager {
    @Autowired
    private Environment env;

    private final String URL_PREFIX = "jdbc:mysql://";

    public Connection getConnection() throws SQLException {
        System.out.println("URL: ======= ");
        String url = URL_PREFIX + env.getProperty("sql.serverUrl") + ":" + env.getProperty("sql.serverPort")
                + "/" + env.getProperty("sql.db");
        System.out.println("URL: " + url);
        String username = env.getProperty("sql.username");
//        String password = env.getProperty("sql.password");
        String password = "";
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
    }
}
