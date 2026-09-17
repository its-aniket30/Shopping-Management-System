package com.shopping.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {

    private static Connection con;

    public static Connection getDbcon() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // load driver

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mit",
                    "root",
                    "8446");

            System.out.println("---Connected to Db---");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con; // IMPORTANT
    }
}