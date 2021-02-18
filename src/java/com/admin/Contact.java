package com.admin;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class Contact {

    public static void insertContactMessage(String fullname, String email, String msg, int user_id) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss a");
        String msg_datetime = LocalDateTime.now().format(formatter);

        String sql = "INSERT INTO `contact` (`fullname`, `email`, `msg`, `msg_datetime`, `user_id`) VALUES (?, ?, ?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, fullname);
        ps.setString(2, email);
        ps.setString(3, msg);
        ps.setString(4, msg_datetime);
        ps.setInt(5, user_id);
        ps.executeUpdate();

    }

    public static void deleteMsg(int contact_id) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "DELETE FROM `contact` WHERE `contact`.`contact_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, contact_id);
        ps.executeUpdate();

    }

    public static List getAllContactInfo(boolean order) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();
        String sql;
        if (order) {
            sql = "SELECT * FROM `contact` order by contact_id asc;";
        } else {
            sql = "SELECT * FROM `contact` order by contact_id desc;";  
        }

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("contact_id", rs.getString("contact_id"));
            map.put("fullname", rs.getString("fullname"));
            map.put("email", rs.getString("email"));
            map.put("msg", rs.getString("msg"));
            map.put("msg_datetime", rs.getString("msg_datetime"));
            map.put("active", rs.getBoolean("active"));
            map.put("user_id", rs.getInt("user_id"));

            sql = "SELECT * FROM `user` where user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("picture_url", rs2.getString("picture_url") + "");
            }

            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("fullname"));
//            System.out.println(map.get("email"));
//            System.out.println(map.get("msg"));
//            System.out.println(map.get("active"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAllContactActiveInfo() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `contact` where active = 1 order by contact_id desc;;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("contact_id", rs.getString("contact_id"));
            map.put("fullname", rs.getString("fullname"));
            map.put("email", rs.getString("email"));
            map.put("msg", rs.getString("msg"));
            map.put("msg_datetime", rs.getString("msg_datetime"));
            map.put("active", rs.getBoolean("active"));
            map.put("user_id", rs.getInt("user_id"));

            sql = "SELECT * FROM `user` where user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("picture_url", rs2.getString("picture_url") + "");
            }

            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("fullname"));
//            System.out.println(map.get("email"));
//            System.out.println(map.get("msg"));
//            System.out.println(map.get("active"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static boolean msgNotActive() throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `contact` where active = 1;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {

            sql = "UPDATE `contact` SET `active` = '0' WHERE `contact`.`contact_id` = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("contact_id"));
            ps.executeUpdate();
        }

        return true;
    }

    public static void main(String[] args) throws SQLException {
        Contact.getAllContactInfo(true);
    }

}
