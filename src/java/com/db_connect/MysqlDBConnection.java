package com.db_connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author shoumitro
 */
public class MysqlDBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/photostock2", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
